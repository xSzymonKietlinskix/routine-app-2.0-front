import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/event_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart'; // Odkomentuj, gdy podepniemy Firestore

class AddEventBottomSheet extends StatefulWidget {
  final DateTime selectedDate;

  const AddEventBottomSheet({super.key, required this.selectedDate});

  @override
  State<AddEventBottomSheet> createState() => _AddEventBottomSheetState();
}

class _AddEventBottomSheetState extends State<AddEventBottomSheet> {
  final _titleController = TextEditingController();
  String _selectedRecurrence = 'none';

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _saveEvent() async {
    if (_titleController.text.trim().isEmpty) {
      Get.snackbar("Błąd", "Nazwa wydarzenia nie może być pusta!",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.redAccent, colorText: Colors.white);
      return;
    }

    final newEvent = EventModel(
      title: _titleController.text.trim(),
      date: widget.selectedDate,
      recurrence: _selectedRecurrence,
    );

    // TODO: Tutaj wyślemy dane do Firebase!
    // Na przykład:
    // await FirebaseFirestore.instance.collection('events').add(newEvent.toJson());

    print("Zapisano wydarzenie: ${newEvent.toJson()}");
    
    // Zamyka okienko po zapisaniu
    Get.back();
    Get.snackbar("Sukces", "Wydarzenie dodane!", snackPosition: SnackPosition.BOTTOM);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        // To zapobiega zasłanianiu formularza przez klawiaturę:
        bottom: MediaQuery.of(context).viewInsets.bottom + 20, 
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Okienko zajmuje tylko tyle miejsca ile musi
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Dodaj nowe wydarzenie", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),
          
          // Pole tekstowe na tytuł
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              labelText: "Tytuł wydarzenia",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.title),
            ),
          ),
          const SizedBox(height: 15),

          // Wybór powtarzalności
          DropdownButtonFormField<String>(
            value: _selectedRecurrence,
            decoration: const InputDecoration(
              labelText: "Powtarzaj",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.repeat),
            ),
            items: const [
              DropdownMenuItem(value: 'none', child: Text("Nigdy")),
              DropdownMenuItem(value: 'daily', child: Text("Codziennie")),
              DropdownMenuItem(value: 'weekly', child: Text("Co tydzień")),
              DropdownMenuItem(value: 'monthly', child: Text("Co miesiąc")),
            ],
            onChanged: (value) {
              setState(() {
                _selectedRecurrence = value!;
              });
            },
          ),
          const SizedBox(height: 20),

          // Przycisk zapisu
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: _saveEvent,
              child: const Text("Zapisz", style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}