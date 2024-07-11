import 'package:flutter/material.dart';

enum Category {
  learn,
  work,
  general,
}

extension CategoryExtension on Category {
  String get displayTitle {
    switch (this) {
      case Category.learn:
        return 'Learn';
      case Category.work:
        return 'Work';
      case Category.general:
        return 'General';
    }
  }

  Color get color {
    switch (this) {
      case Category.learn:
        return Colors.grey.shade800;
      case Category.work:
        return Colors.grey.shade600;
      case Category.general:
        return Colors.grey.shade400;
    }
  }
}
