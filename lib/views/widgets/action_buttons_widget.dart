import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:todolist/models/action_buttons_model.dart';

class ActionButtonsWidget extends ConsumerWidget {
  final ActionButtonModel Model;

  const ActionButtonsWidget({
    super.key,
    required this.Model,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              side: Model.side,
              backgroundColor: Model.backgroundColor,
              foregroundColor: Model.foregroundColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(color: Colors.black),
              ),
            ),
            onPressed: Model.onPressed,
            child: Text(Model.text),
          ),
        ),
      ],
    );
  }
}
