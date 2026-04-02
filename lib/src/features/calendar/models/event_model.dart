class TodoItem {
  String title;
  bool isDone;

  TodoItem({required this.title, this.isDone = false});

  Map<String, dynamic> toJson() => {'title': title, 'isDone': isDone};

  factory TodoItem.fromJson(Map<String, dynamic> json) {
    return TodoItem(title: json['title'], isDone: json['isDone'] ?? false);
  }
}

class EventModel {
  final String? id;
  final String title;
  final bool isAllDay;
  final DateTime startDate;
  final DateTime endDate;
  final String recurrence;
  final DateTime? recurrenceEndDate; // <--- NOWE POLE
  final bool isTodoList;
  final List<TodoItem> todos;
  final String? calendarId;

  EventModel({
    this.id,
    required this.title,
    this.isAllDay = true,
    required this.startDate,
    required this.endDate,
    this.recurrence = 'none',
    this.isTodoList = false,
    this.todos = const [],
    this.recurrenceEndDate, // <--- NOWE
    this.calendarId,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isAllDay': isAllDay,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'recurrence': recurrence,
      'isTodoList': isTodoList,
      'recurrenceEndDate': recurrenceEndDate?.toIso8601String(), // <--- NOWE
      'todos': todos.map((t) => t.toJson()).toList(),
      'calendarId': calendarId,
    };
  }

  // TUTAJ JEST NOWOŚĆ: Funkcja do odczytywania danych z Firebase
  factory EventModel.fromJson(Map<String, dynamic> json, String documentId) {
    return EventModel(
      id: documentId,
      title: json['title'] ?? '',
      isAllDay: json['isAllDay'] ?? true,
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      recurrence: json['recurrence'] ?? 'none',
      recurrenceEndDate: json['recurrenceEndDate'] != null ? DateTime.parse(json['recurrenceEndDate']) : null,
      isTodoList: json['isTodoList'] ?? false,
      todos: (json['todos'] as List<dynamic>?)
          ?.map((item) => TodoItem.fromJson(item as Map<String, dynamic>))
          .toList() ?? [],
      calendarId: json['calendarId'],
    );
  }
}