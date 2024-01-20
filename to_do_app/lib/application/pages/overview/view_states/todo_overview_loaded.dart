import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/domain/entities/to_do_collection.dart';

import '../../todo-detail/todo_detal_page.dart';

class ToDoOverviewLoaded extends StatelessWidget {
  const ToDoOverviewLoaded({
    super.key,
    required this.collections,
  });

  final List<ToDoCollection> collections;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: collections.length,
      itemBuilder: (context, index) {
        final item = collections[index];
        final colorScheme = Theme.of(context).colorScheme;

        return ListTile(
          tileColor: colorScheme.surface,
          selectedTileColor: colorScheme.surfaceVariant,
          iconColor: item.color.color,
          selectedColor: item.color.color,
          onTap: () {
            if (Breakpoints.small.isActive(context)) {
              context.pushNamed(
                ToDoDetailPage.pageConfig.name,
                pathParameters: {'collectionId': item.id.value},
              );
            }
          },
          leading: const Icon(Icons.circle),
          title: Text(item.title),
        );
      },
    );
  }
}
