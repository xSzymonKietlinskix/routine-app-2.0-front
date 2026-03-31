import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

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
    return TableCalendar(
      firstDay: DateTime.utc(2020, 10, 16), // Od kiedy kalendarz działa
      lastDay: DateTime.utc(2030, 3, 14),   // Do kiedy
      focusedDay: focusedDay,
      calendarFormat: calendarFormat,
      startingDayOfWeek: StartingDayOfWeek.monday,
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
    );
  }
}