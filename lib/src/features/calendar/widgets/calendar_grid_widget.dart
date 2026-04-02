import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../repository/calendar_repository/calendar_repository.dart';

class CalendarGridWidget extends StatelessWidget {
  final CalendarFormat calendarFormat;
  final DateTime focusedDay;
  final DateTime? selectedDay;
  final Function(CalendarFormat) onFormatChanged;
  final Function(DateTime, DateTime) onDaySelected;

  const CalendarGridWidget({
    super.key,
    required this.calendarFormat,
    required this.focusedDay,
    required this.selectedDay,
    required this.onFormatChanged,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {

    return Obx(() {
      // 1. TEN MAŁY TRIK zmusza Obx do śledzenia zmian w liście wydarzeń!
      final _ = CalendarRepository.instance.allEvents.length;


    return TableCalendar(
      firstDay: DateTime.utc(2020, 10, 16), // Od kiedy kalendarz działa
      lastDay: DateTime.utc(2030, 3, 14),   // Do kiedy
      focusedDay: focusedDay,
      calendarFormat: calendarFormat,
      startingDayOfWeek: StartingDayOfWeek.monday,
      daysOfWeekHeight: 30,
      selectedDayPredicate: (day) {
        // Zaznacza wybrany dzień
        return isSameDay(selectedDay, day);
      },
      onDaySelected: (selected, focused) {
        if (!isSameDay(selectedDay, selected)) {
          onDaySelected(selected, focused);
        }
      },
      onFormatChanged: (format) {
        if (calendarFormat != format) {
          onFormatChanged(format);
        }
      },
      onPageChanged: (focused) {
        // Zapisuje aktualny miesiąc przy przewijaniu
      },
      // Ustawienia wyglądu (możesz tu dodać swoje kolory z pliku colors.dart)
      headerStyle: const HeaderStyle(
        formatButtonVisible: true, // Pokazuje przycisk "Miesiąc/2 Tygodnie/Tydzień"
        titleCentered: true,
      ),
      eventLoader: (day) {
        return CalendarRepository.instance.getEventsForDay(day);
      },
    );
    });
  }
}