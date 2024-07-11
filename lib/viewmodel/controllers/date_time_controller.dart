import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todolist/constants.dart';
import 'package:todolist/providers/date_time_provider.dart';

class DateTimeController {
  final WidgetRef ref;

  DateTimeController(this.ref);

  String get date => ref.watch(dateProvider);
  String get time => ref.watch(timeProvider);

  Future<void> pickDate(BuildContext context) async {
    final getValue = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(kFirstDateYear),
      lastDate: DateTime(kLastDateYear),
    );
    if (getValue != null) {
      final format = DateFormat.yMd();
      ref.read(dateProvider.notifier).state = format.format(getValue);
    }
  }

  Future<void> pickTime(BuildContext context) async {
    final getTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (getTime != null) {
      ref.read(timeProvider.notifier).state = getTime.format(context);
    }
  }
}
