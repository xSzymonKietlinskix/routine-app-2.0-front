class EventModel {
  final String? id; // ID dokumentu z Firebase
  final String title;
  final DateTime date;
  final String recurrence; // 'none', 'daily', 'weekly', 'monthly'

  EventModel({
    this.id,
    required this.title,
    required this.date,
    this.recurrence = 'none',
  });

  // Funkcja do zamiany obiektu na format rozumiany przez Firebase (Mapę/JSON)
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'date': date.toIso8601String(),
      'recurrence': recurrence,
    };
  }

  // Funkcja do pobierania z Firebase i zamiany z powrotem na obiekt Dart
  factory EventModel.fromJson(Map<String, dynamic> json, String documentId) {
    return EventModel(
      id: documentId,
      title: json['title'] ?? '',
      date: DateTime.parse(json['date']),
      recurrence: json['recurrence'] ?? 'none',
    );
  }
}