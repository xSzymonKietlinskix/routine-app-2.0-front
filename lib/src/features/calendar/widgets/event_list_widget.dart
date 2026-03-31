import 'package:flutter/material.dart';

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
            "Wydarzenia: ${selectedDay.day}.${selectedDay.month}.${selectedDay.year}",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Center(
              child: Text(
                "Tutaj pojawią się wydarzenia z Firebase.",
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}