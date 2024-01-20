import 'package:flutter/material.dart';
import 'package:to_do_app/domain/entities/unique_id.dart';

import '../../../widgets/todo_entry_item/todo_entry_item.dart';

class ToDoDetailLoaded extends StatelessWidget {
  const ToDoDetailLoaded({
    super.key,
    required this.collectionId,
    required this.entryIds,
  });

  final List<EntryId> entryIds;
  final CollectionId collectionId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: entryIds.length,
          itemBuilder: (context, index) => ToDoEntryItemProvider(
            collectionId: collectionId,
            entryId: entryIds[index],
          ),
        ),
      ),
    );
  }
}
