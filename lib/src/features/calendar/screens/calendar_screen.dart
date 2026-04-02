import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../constants/sizes.dart'; // Twój import
import '../widgets/calendar_grid_widget.dart';
import '../widgets/event_list_widget.dart';
import 'package:get/get.dart';
import '../widgets/add_event_bottom_sheet.dart'; // Upewnij się, że ścieżka jest poprawna!

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  // Zmienne do zarządzania stanem kalendarza
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text("Kalendarz"),
        //   centerTitle: true,
        // ),
        body: Column(
          children: [
            // 1. WIDŻET KALENDARZA
            CalendarGridWidget(
              calendarFormat: _calendarFormat,
              focusedDay: _focusedDay,
              selectedDay: _selectedDay,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay; // Aktualizuje widoczny miesiąc
                });
              },
            ),
            
            const SizedBox(height: 10),
            const Divider(),
            
            // 2. WIDŻET LISTY WYDARZEŃ DLA WYBRANEGO DNIA
            // (Na razie dajemy twardy tekst, dopóki nie wepniemy Firebase)
            Expanded(
              child: EventListWidget(selectedDay: _selectedDay!),
            ),
          ],
        ),
        // 3. PRZYCISK DODAWANIA WYDARZENIA
       floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Get.bottomSheet wysuwa nasze nowe okienko z dołu
            Get.bottomSheet(
              AddEventBottomSheet(
                // Przekazujemy aktualnie wybrany dzień z kalendarza
                selectedDate: _selectedDay ?? _focusedDay, 
              ),
              isScrollControlled: true, // Pozwala okienku przesunąć się wyżej, gdy wyskoczy klawiatura
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}