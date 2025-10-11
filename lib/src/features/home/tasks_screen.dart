import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;


class TasksScreen extends StatefulWidget {
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  String message = '';

  Future<void> fetchTasks() async {
    final token = await FirebaseAuth.instance.currentUser?.getIdToken();
    final res = await http.get(
      Uri.parse('http://127.0.0.1:8000/tasks'), // zmień na URL backendu, gdy go wdrożysz
      headers: {'Authorization': 'Bearer $token'},
    );
    setState(() => message = res.body);
  }

  @override
  void initState() {
    super.initState();
    fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Twoje zadania')),
      body: Center(child: Text(message)),
    );
  }
}
