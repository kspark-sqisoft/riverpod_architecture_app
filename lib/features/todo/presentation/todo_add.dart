import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture_app/features/todo/data/todos_provider.dart';

class TodoAdd extends ConsumerStatefulWidget {
  const TodoAdd({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TodoAddState();
}

class _TodoAddState extends ConsumerState<TodoAdd> {
  final textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(labelText: 'What to do?'),
      enabled: true,
      onSubmitted: (String? value) {
        if (value != null && value.trim().isNotEmpty) {
          ref.read(todosProvider.notifier).addTodo(value);
          textEditingController.clear();
        }
      },
    );
  }
}
