import 'package:flutter/material.dart';
import 'package:get/get.dart'; // <--- WAŻNE: Dodaliśmy import GetX dla Obx
import 'package:routine_app_front/src/constants/text_strings.dart';
import '../models/event_model.dart';
import '../../../repository/calendar_repository/calendar_repository.dart';

class EventListWidget extends StatelessWidget {
  final DateTime selectedDay;

  const EventListWidget({super.key, required this.selectedDay});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$tCallendarEvent ${selectedDay.day.toString().padLeft(2, '0')}.${selectedDay.month.toString().padLeft(2, '0')}.${selectedDay.year}",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            // ZAMIAST StreamBuilder używamy lekkiego Obx z GetX!
            child: Obx(() {
              // Pobieramy gotową, przefiltrowaną listę prosto z Repozytorium
              final dayEvents = CalendarRepository.instance.getEventsForDay(selectedDay);

              // 1. Sprawdzamy, czy na ten dzień są w ogóle jakieś wydarzenia
              if (dayEvents.isEmpty) {
                return Center(
                  child: Text(tCallendarEventPlaceHolder, style: TextStyle(color: Colors.grey.shade600)),
                );
              }

              // 2. Mamy wydarzenia! Rysujemy listę
              return ListView.builder(
                itemCount: dayEvents.length,
                itemBuilder: (context, index) {
                  final event = dayEvents[index];
                  return Card(
                    child: ListTile(
                      leading: Container(
                        width: 10,
                        // Pomarańczowy pasek dla To-Do, niebieski dla standardowego wydarzenia
                        color: event.isTodoList ? Colors.orange : Colors.blue,
                      ),
                      title: Text(event.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(
                          event.isAllDay
                              ? tAllDay // Tekst "Cały dzień" z Twoich zmiennych
                          // Jeśli ma godziny, ładnie je formatujemy dodając zera na początku
                              : "${event.startDate.hour.toString().padLeft(2, '0')}:${event.startDate.minute.toString().padLeft(2, '0')} - ${event.endDate.hour.toString().padLeft(2, '0')}:${event.endDate.minute.toString().padLeft(2, '0')}"
                      ),
                      trailing: event.isTodoList ? const Icon(Icons.checklist) : const Icon(Icons.event),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}