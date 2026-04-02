import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Upewnij się, że te importy pasują do ścieżek w Twoim projekcie!
import 'package:routine_app_front/src/constants/text_strings.dart';
import '../models/event_model.dart';
import '../../../repository/calendar_repository/calendar_repository.dart';

class AddEventBottomSheet extends StatefulWidget {
  final DateTime selectedDate;

  const AddEventBottomSheet({super.key, required this.selectedDate});

  @override
  State<AddEventBottomSheet> createState() => _AddEventBottomSheetState();
}

class _AddEventBottomSheetState extends State<AddEventBottomSheet> {
  final _titleController = TextEditingController();
  final _todoController = TextEditingController();

  String _selectedRecurrence = 'none';
  bool _isAllDay = true;
  bool _isTodoList = false;
  DateTime? _recurrenceEndDate;

  late DateTime _startDate;
  late DateTime _endDate;
  List<TodoItem> _todos = [];

  @override
  void initState() {
    super.initState();
    _startDate = widget.selectedDate;
    _endDate = widget.selectedDate;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _todoController.dispose();
    super.dispose();
  }

  Future<void> _pickDateTime(bool isStart) async {
    DateTime initialDate = isStart ? _startDate : _endDate;

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (pickedDate == null) return;

    TimeOfDay? pickedTime;
    if (!_isAllDay) {
      pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialDate),
      );
      if (pickedTime == null) return;
    }

    setState(() {
      final finalDateTime = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        _isAllDay ? 0 : pickedTime!.hour,
        _isAllDay ? 0 : pickedTime!.minute,
      );

      if (isStart) {
        _startDate = finalDateTime;
        if (_endDate.isBefore(_startDate)) _endDate = _startDate;
      } else {
        _endDate = finalDateTime;
      }
    });
  }

  void _saveEvent() async {
    if (_titleController.text.trim().isEmpty) {
      // Upewnij się, że masz tEnterTitle (lub tErrorNoTitle) w text_strings.dart
      Get.snackbar(tError, tEnterTitle, backgroundColor: Colors.redAccent, colorText: Colors.white);
      return;
    }

    final newEvent = EventModel(
      title: _titleController.text.trim(),
      isAllDay: _isAllDay,
      startDate: _startDate,
      endDate: _endDate,
      recurrence: _selectedRecurrence,
      recurrenceEndDate: _recurrenceEndDate, // <--- DODANO
      isTodoList: _isTodoList,
      todos: _todos,
    );

    Get.back();
    await CalendarRepository.instance.createEvent(newEvent);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 20, left: 20, right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(tSave, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),

            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: tTitle, border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: SwitchListTile(
                    title: const Text(tAllDay, style: TextStyle(fontSize: 14)),
                    value: _isAllDay,
                    onChanged: (val) => setState(() => _isAllDay = val),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
                Expanded(
                  child: SwitchListTile(
                    title: const Text(tTodoList, style: TextStyle(fontSize: 14)),
                    value: _isTodoList,
                    onChanged: (val) => setState(() => _isTodoList = val),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => _pickDateTime(true),
                    child: Text("$tFrom: ${_startDate.day.toString().padLeft(2, '0')}.${_startDate.month.toString().padLeft(2, '0')} ${_isAllDay ? '' : '${_startDate.hour}:${_startDate.minute.toString().padLeft(2, '0')}'}"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => _pickDateTime(false),
                    child: Text("$tTo: ${_endDate.day.toString().padLeft(2, '0')}.${_endDate.month.toString().padLeft(2, '0')} ${_isAllDay ? '' : '${_endDate.hour}:${_endDate.minute.toString().padLeft(2, '0')}'}"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            DropdownButtonFormField<String>(
              value: _selectedRecurrence,
              decoration: const InputDecoration(
                labelText: tRepeat,
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.repeat),
              ),
              items: const [
                DropdownMenuItem(value: 'none', child: Text(tNever)),
                DropdownMenuItem(value: 'daily', child: Text(tDaily)),
                DropdownMenuItem(value: 'weekly', child: Text(tWeekly)),
                DropdownMenuItem(value: 'monthly', child: Text(tMonthly)),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedRecurrence = value!;
                });
              },
            ),
            if (_selectedRecurrence != 'none') ...[
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text("$tRepeatUntil ${_recurrenceEndDate == null ? tNoLimit : '${_recurrenceEndDate!.day.toString().padLeft(2, '0')}.${_recurrenceEndDate!.month.toString().padLeft(2, '0')}.${_recurrenceEndDate!.year}'}"),
                trailing: const Icon(Icons.calendar_today, color: Colors.blue),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: _endDate,
                    firstDate: _endDate, // Nie można skończyć powtarzać przed końcem wydarzenia
                    lastDate: DateTime(2030),
                  );
                  if (picked != null) {
                    setState(() => _recurrenceEndDate = picked);
                  }
                },
              ),
              const SizedBox(height: 10),
            ],
            const SizedBox(height: 10),

            if (_isTodoList) ...[
              const Divider(),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _todoController,
                      decoration: const InputDecoration(hintText: tNewTask),
                      onSubmitted: (val) {
                        if (val.isNotEmpty) {
                          setState(() { _todos.add(TodoItem(title: val)); _todoController.clear(); });
                        }
                      },
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_circle, color: Colors.blue),
                    onPressed: () {
                      if (_todoController.text.isNotEmpty) {
                        setState(() { _todos.add(TodoItem(title: _todoController.text)); _todoController.clear(); });
                      }
                    },
                  )
                ],
              ),
              ..._todos.map((todo) => ListTile(
                dense: true,
                title: Text(todo.title),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, size: 18, color: Colors.red),
                  onPressed: () => setState(() => _todos.remove(todo)),
                ),
              )),
              const Divider(),
            ],

            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity, height: 50,
              child: ElevatedButton(onPressed: _saveEvent, child: const Text(tSave)),
            ),
          ],
        ),
      ),
    );
  }
}