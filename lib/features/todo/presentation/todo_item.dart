import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture_app/features/todo/data/todo_provider.dart';
import 'package:riverpod_architecture_app/features/todo/data/todos_provider.dart';
import 'package:riverpod_architecture_app/utils/string_color_extension.dart';

import '../../../main.dart';

class TodoItem extends ConsumerWidget {
  const TodoItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = ref.watch(todoProvider);
    logger.d('TodoItem ref.watch(todoProvider)'.toMagenta);
    return ListTile(
      leading: Checkbox(
        value: todo.completed,
        onChanged: (bool? checked) {
          ref.read(todosProvider.notifier).toggleTodo(todo.id);
        },
      ),
      title: Text(todo.desc),
      trailing: IconButton(
          onPressed: () async {
            final removeOrNot = await showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Are you sure?'),
                  content: const Text('Do you really want to delete?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text('No'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text('Yes'),
                    ),
                  ],
                );
              },
            );
            if (removeOrNot) {
              ref.read(todosProvider.notifier).removeTodo(todo.id);
            }
          },
          icon: Icon(Icons.delete)),
    );
  }
}
