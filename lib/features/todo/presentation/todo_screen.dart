import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture_app/features/todo/presentation/todo_add.dart';
import 'package:riverpod_architecture_app/features/todo/presentation/todo_filter.dart';
import 'package:riverpod_architecture_app/features/todo/presentation/todo_header.dart';
import 'package:riverpod_architecture_app/features/todo/presentation/todo_list.dart';
import 'package:riverpod_architecture_app/features/todo/presentation/todo_search.dart';

import '../../../main.dart';

class TodoScreen extends ConsumerStatefulWidget {
  const TodoScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TodoScreenState();
}

class _TodoScreenState extends ConsumerState<TodoScreen> {
  @override
  void initState() {
    logger.d('######################################');
    logger.d('TodoScreen initState');
    super.initState();
  }

  @override
  void dispose() {
    logger.d('TodoScreen dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TodoHeader(),
              TodoAdd(),
              SizedBox(
                height: 10,
              ),
              TodoSearch(),
              SizedBox(
                height: 10,
              ),
              TodoFilter(),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: TodoList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
