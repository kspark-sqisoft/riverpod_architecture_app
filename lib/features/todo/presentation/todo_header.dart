import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture_app/features/todo/data/todos_provider.dart';
import 'package:riverpod_architecture_app/main.dart';
import 'package:riverpod_architecture_app/utils/string_color_extension.dart';

import '../../../common/provider/theme_provider.dart';
import '../domain/todo.dart';

class TodoHeader extends ConsumerStatefulWidget {
  const TodoHeader({super.key});

  @override
  ConsumerState<TodoHeader> createState() => _TodoHeaderState();
}

class _TodoHeaderState extends ConsumerState<TodoHeader> {
  Widget prevTodoCountWidget = const SizedBox.shrink();

  Widget getActiveTodoCount(List<Todo> todos) {
    final totalCount = todos.length;
    final activeTodoCount =
        todos.where((todo) => !todo.completed).toList().length;

    prevTodoCountWidget = Text(
      '($activeTodoCount/$totalCount item${activeTodoCount != 1 ? "s" : ""} left)',
      style: TextStyle(
        fontSize: 18.0,
        color: Colors.blue[900],
      ),
    );

    return prevTodoCountWidget;
  }

  @override
  Widget build(BuildContext context) {
    final asyncTodos = ref.watch(todosProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Text(
              'TODO',
              style: TextStyle(fontSize: 36.0),
            ),
            const SizedBox(width: 10),
            asyncTodos.maybeWhen(
              data: (List<Todo> todos) => getActiveTodoCount(todos),
              orElse: () => prevTodoCountWidget,
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                ref.read(themeProvider.notifier).toggleTheme();
              },
              icon: const Icon(Icons.light_mode),
            ),
            const SizedBox(width: 10),
            IconButton(
              onPressed: () {
                logger.d('ref.invalidate(todosProvider)'.toMagenta);
                ref.invalidate(todosProvider);
              },
              icon: const Icon(Icons.refresh),
            ),
          ],
        )
      ],
    );
  }
}
