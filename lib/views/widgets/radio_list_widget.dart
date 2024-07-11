import 'package:flutter/material.dart';

import 'package:todolist/models/radio_list_model.dart';

class RadioListWidget extends StatelessWidget {
  final RadioModel model;
  final VoidCallback onChangeValue;
  final bool isSelected;

  const RadioListWidget({
    super.key,
    required this.model,
    required this.onChangeValue,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChangeValue,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: model.cateColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            Text(
              model.titleRadio,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
