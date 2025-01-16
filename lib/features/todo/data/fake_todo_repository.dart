import 'dart:math';

import 'package:riverpod_architecture_app/features/todo/data/todo_repository.dart';
import 'package:riverpod_architecture_app/features/todo/domain/todo.dart';
import 'package:riverpod_architecture_app/main.dart';
import 'package:riverpod_architecture_app/utils/string_color_extension.dart';

final initialTodos = [
  {"id": "1", "desc": "Clean the room", "completed": false},
  {"id": "2", "desc": "Wash the dish", "completed": false},
  {"id": "3", "desc": "Do homework", "completed": false},
];

const double kProbabiltyOfError = 0.2;
const int kDelayDuration = 1;

class FakeTodoRepository extends TodoRepository {
  FakeTodoRepository() {
    logger.d('FakeTodoRepository constructor'.toMagenta);
  }
  List<Map<String, dynamic>> todos = initialTodos;
  final Random random = Random();
  @override
  Future<List<Todo>> getTodos() async {
    await Future.delayed(Duration(seconds: kDelayDuration));
    try {
      if (random.nextDouble() < kProbabiltyOfError) {
        throw 'Fail to retrieve todos';
      }

      return [for (final todo in todos) Todo.fromJson(todo)];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addTodo({required Todo todo}) async {
    await Future.delayed(Duration(seconds: kDelayDuration));
    try {
      if (random.nextDouble() < kProbabiltyOfError) {
        throw 'Fail to add todo';
      }
      todos = [...todos, todo.toJson()];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> editTodo({required String id, required String desc}) async {
    await Future.delayed(Duration(seconds: kDelayDuration));
    try {
      if (random.nextDouble() < kProbabiltyOfError) {
        throw 'Fail to edit todo';
      }

      todos = [
        for (final todo in todos)
          if (todo['id'] == id)
            {'id': id, 'desc': desc, 'completed': todo['completed']}
          else
            todo
      ];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> removeTodo({required String id}) async {
    await Future.delayed(Duration(seconds: kDelayDuration));
    try {
      if (random.nextDouble() < kProbabiltyOfError) {
        throw 'Fail to remove todo';
      }

      todos = [
        for (final todo in todos)
          if (todo['id'] != id) todo
      ];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> toggleTodo({required String id}) async {
    await Future.delayed(Duration(seconds: kDelayDuration));
    try {
      if (random.nextDouble() < kProbabiltyOfError) {
        throw 'Fail to toggle todo';
      }

      todos = [
        for (final todo in todos)
          if (todo['id'] == id)
            {'id': id, 'desc': todo['desc'], 'completed': !todo['completed']}
          else
            todo,
      ];
    } catch (e) {
      rethrow;
    }
  }
}
