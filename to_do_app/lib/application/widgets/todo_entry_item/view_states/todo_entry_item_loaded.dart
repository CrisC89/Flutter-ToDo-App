import 'package:flutter/material.dart';

import '../../../../domain/entities/to_do_entry.dart';



class ToDoEntryItemLoaded extends StatelessWidget {
  const ToDoEntryItemLoaded({
    super.key,
    required this.entryItem,
    required this.onChanged,
  });

  final ToDoEntry entryItem;
  final Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(entryItem.description),
      value: entryItem.isDone,
      onChanged: onChanged,
    );
  }
}
