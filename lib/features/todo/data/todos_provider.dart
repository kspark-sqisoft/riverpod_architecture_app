import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_architecture_app/features/todo/data/todo_repository.dart';
import 'package:riverpod_architecture_app/utils/string_color_extension.dart';

import '../../../main.dart';
import '../domain/todo.dart';

part 'todos_provider.g.dart';

@riverpod
class Todos extends _$Todos {
  @override
  FutureOr<List<Todo>> build() {
    ref.onDispose(() {
      logger.d('todosProvider onDispose'.toRed);
    });
    ref.onCancel(() {
      logger.d('todosProvider onCancel');
    });
    ref.onResume(() {
      logger.d('todosProvider onResume');
    });
    ref.onAddListener(() {
      logger.d('todosProvider onAddListener');
    });
    ref.onRemoveListener(() {
      logger.d('todosProvider onRemoveListener');
    });
    logger.d('todosProvider initialized'.toGreen);
    return _getTodos();
  }

  Future<List<Todo>> _getTodos() {
    return ref.read(todoRepositoryProvider).getTodos();
  }

  Future<void> addTodo(String desc) async {
    logger.d('todosProvider addTodo($desc)'.toCyan);
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final newTodo = Todo.add(desc: desc);

      await ref.read(todoRepositoryProvider).addTodo(todo: newTodo);

      return [...state.value!, newTodo];
    });
  }

  Future<void> toggleTodo(String id) async {
    logger.d('todosProvider toggleTodo($id)'.toCyan);
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await ref.read(todoRepositoryProvider).toggleTodo(id: id);

      return [
        for (final todo in state.value!)
          if (todo.id == id) todo.copyWith(completed: !todo.completed) else todo
      ];
    });
  }

  Future<void> editTodo(String id, String desc) async {
    logger.d('todosProvider editTodo($id)'.toCyan);
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await ref.read(todoRepositoryProvider).editTodo(id: id, desc: desc);

      return [
        for (final todo in state.value!)
          if (todo.id == id) todo.copyWith(desc: desc) else todo
      ];
    });
  }

  Future<void> removeTodo(String id) async {
    logger.d('todosProvider removeTodo($id)'.toCyan);
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await ref.read(todoRepositoryProvider).removeTodo(id: id);

      return [
        for (final todo in state.value!)
          if (todo.id != id) todo
      ];
    });
  }
}
