import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_architecture_app/app.dart';
import 'package:riverpod_architecture_app/features/todo/data/fake_todo_repository.dart';
import 'package:riverpod_architecture_app/features/todo/data/todo_repository.dart';

final logger = Logger(
  printer: SimplePrinter(printTime: true),
  filter: ProductionFilter(),
);

void main() {
  logger.d('main');
  runApp(
    ProviderScope(
      overrides: [
        todoRepositoryProvider.overrideWithValue(
          FakeTodoRepository(),
        ),
      ],
      child: const App(),
    ),
  );
}

// dart run build_runner build --delete-conflicting-outputs
// dart run build_runner watch -d


// flutter run -d windows -v