import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_architecture_app/utils/string_color_extension.dart';

import '../../../main.dart';
import '../domain/todo.dart';
part 'todo_repository.g.dart';

abstract class TodoRepository {
  Future<List<Todo>> getTodos();
  Future<void> addTodo({required Todo todo});
  Future<void> editTodo({required String id, required String desc});
  Future<void> toggleTodo({required String id});
  Future<void> removeTodo({required String id});
}

@riverpod
TodoRepository todoRepository(Ref ref) {
  //아래 메서드들 안불림
  ref.onDispose(() {
    logger.d('todoRepositoryProvider onDispose'.toRed);
  });
  ref.onCancel(() {
    logger.d('todoRepositoryProvider onCancel');
  });
  ref.onResume(() {
    logger.d('todoRepositoryProvider onResume');
  });
  ref.onAddListener(() {
    logger.d('todoRepositoryProvider onAddListener');
  });
  ref.onRemoveListener(() {
    logger.d('todoRepositoryProvider onRemoveListener');
  });
  logger.d('todoRepositoryProvider initialized'.toGreen);
  throw UnimplementedError();
}
