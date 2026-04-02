import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; // <-- DODAJ TEN IMPORT
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../features/calendar/models/event_model.dart';
import 'package:routine_app_front/src/constants/text_strings.dart';

class CalendarRepository extends GetxController {
  static CalendarRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance; // <-- Instancja Auth

  RxList<EventModel> allEvents = <EventModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Od razu po starcie apki łączymy strumień z Firebase z naszą listą!
    allEvents.bindStream(getEventsStream());
  }

  List<EventModel> getEventsForDay(DateTime selectedDay) {
    return allEvents.where((event) {
      DateTime start = DateTime(event.startDate.year, event.startDate.month, event.startDate.day);
      DateTime end = DateTime(event.endDate.year, event.endDate.month, event.endDate.day);
      DateTime selected = DateTime(selectedDay.year, selectedDay.month, selectedDay.day);

      // 1. Zwykłe sprawdzenie (czy wydarzenie trwa w ten dzień)
      if (selected.isAtSameMomentAs(start) || selected.isAtSameMomentAs(end) || (selected.isAfter(start) && selected.isBefore(end))) {
        return true;
      }

      // 2. Sprawdzenie powtarzalności
      if (event.recurrence != 'none') {
        // Jeśli jest data końcowa powtarzania, odrzucamy dni po tej dacie
        if (event.recurrenceEndDate != null) {
          DateTime recEnd = DateTime(event.recurrenceEndDate!.year, event.recurrenceEndDate!.month, event.recurrenceEndDate!.day);
          if (selected.isAfter(recEnd)) return false;
        }

        // Sprawdzamy czy wybrany dzień jest PO dacie zakończenia pierwszego wystąpienia
        if (selected.isAfter(end)) {
          if (event.recurrence == 'daily') return true;
          if (event.recurrence == 'weekly' && selected.weekday == start.weekday) return true;
          if (event.recurrence == 'monthly' && selected.day == start.day) return true;
        }
      }
      return false;
    }).toList();
  }


  // --- ZAPISYWANIE WYDARZENIA ---
  Future<void> createEvent(EventModel event) async {
    try {
      // 1. Pobieramy ID aktualnie zalogowanego użytkownika
      final userId = _auth.currentUser?.uid;

      if (userId == null) {
        throw Exception("Musisz być zalogowany, aby dodać wydarzenie!");
      }

      // 2. Pobieramy dane z formularza i DOKLEJAMY nasze userId
      final eventData = event.toJson();
      eventData['userId'] = userId; // To pozwala przejść przez nowe reguły!

      await _db.collection('events').add(eventData);

      Get.snackbar(
        tSuccess,
        tEventAdded,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.8),
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        tError,
        "$tSomethingWentWrong$e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.8),
        colorText: Colors.white,
      );
    }
  }

  // --- POBIERANIE WYDARZEŃ W CZASIE RZECZYWISTYM ---
  Stream<List<EventModel>> getEventsStream() {
    final userId = _auth.currentUser?.uid;

    if (userId == null) {
      return const Stream.empty(); // Jeśli niezalogowany, zwraca pustą listę
    }

    return _db.collection('events')
        .where('userId', isEqualTo: userId) // <-- POBIERA TYLKO MOJE WYDARZENIA
        .snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => EventModel.fromJson(doc.data(), doc.id)).toList();
    });
  }
}