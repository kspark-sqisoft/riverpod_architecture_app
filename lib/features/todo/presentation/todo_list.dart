import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture_app/features/todo/data/todo_filter_provider.dart';
import 'package:riverpod_architecture_app/features/todo/data/todo_provider.dart';
import 'package:riverpod_architecture_app/features/todo/data/todo_search_provider.dart';
import 'package:riverpod_architecture_app/features/todo/data/todos_provider.dart';
import 'package:riverpod_architecture_app/features/todo/presentation/todo_item.dart';
import 'package:riverpod_architecture_app/utils/async_value_extension.dart';
import 'package:riverpod_architecture_app/utils/string_color_extension.dart';

import '../../../main.dart';
import '../domain/todo.dart';

class TodoList extends ConsumerStatefulWidget {
  const TodoList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TodoListState();
}

class _TodoListState extends ConsumerState<TodoList> {
  List<Todo> filteredTodos(List<Todo> todos) {
    //필터터
    final selectedFilter = ref.watch(todoFilterProvider);
    logger.d('TodoList ref.watch(todoFilterProvider)'.toMagenta);
    List<Todo> tempTodos = switch (selectedFilter) {
      Filter.active => todos.where((todo) => !todo.completed).toList(),
      Filter.completed => todos.where((todo) => todo.completed).toList(),
      Filter.all => todos,
    };
    //검색
    final search = ref.watch(todoSearchProvider);
    logger.d('TodoList ref.watch(todoSearchProvider)'.toMagenta);
    if (search.isNotEmpty) {
      tempTodos = tempTodos
          .where(
              (todo) => todo.desc.toLowerCase().contains(search.toLowerCase()))
          .toList();
    }

    return tempTodos;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<List<Todo>>>(todosProvider, (p, next) {
      next.whenOrNull(
        error: (error, stackTrace) {
          if (!next.isLoading) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    'Error',
                    textAlign: TextAlign.center,
                  ),
                  content: Text(
                    error.toString(),
                    textAlign: TextAlign.center,
                  ),
                );
              },
            );
          }
        },
      );
    });

    logger.d('-------------------------------------');
    logger.d('TodoList ref.watch(todosProvider)'.toMagenta);
    final asyncTodos = ref.watch(todosProvider);
    logger.d('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
    logger.d('asyncTodos:${asyncTodos.toStr}'.toYellow);
    logger.d('asyncTodos.isLoading:${asyncTodos.isLoading}');
    logger.d('asyncTodos.isRefreshing:${asyncTodos.isRefreshing}');
    logger.d('asyncTodos.isReloading:${asyncTodos.isReloading}');
    logger.d('asyncTodos.hasValue:${asyncTodos.hasValue}');
    logger.d('asyncTodos.hasError:${asyncTodos.hasError}');
    logger.d('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
    return asyncTodos.when(
      //skipLoadingOnReload: true,
      data: (todos) {
        final filteredResultTodos = filteredTodos(todos);
        return ListView.separated(
            itemBuilder: (context, index) {
              final todo = filteredResultTodos[index];
              return ProviderScope(
                overrides: [todoProvider.overrideWithValue(todo)],
                child: TodoItem(),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.grey,
              );
            },
            itemCount: filteredResultTodos.length);
      },
      error: (error, stackTrace) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                error.toString(),
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  logger.d('ref.invalidate(todosProvider)'.toMagenta);
                  ref.invalidate(todosProvider);
                },
                child: const Text(
                  'Please Retry!',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        );
      },
      loading: () {
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
