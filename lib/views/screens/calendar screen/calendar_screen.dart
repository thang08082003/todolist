import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("calender screen app bar"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Calender screen"),
      ),
    );
  }
}
