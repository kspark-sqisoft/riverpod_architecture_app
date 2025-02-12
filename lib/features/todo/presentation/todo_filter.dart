import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture_app/utils/string_color_extension.dart';

import '../../../main.dart';
import '../data/todo_filter_provider.dart';
import '../domain/todo.dart';

class TodoFilter extends StatelessWidget {
  const TodoFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FilterButton(filter: Filter.all),
        FilterButton(filter: Filter.active),
        FilterButton(filter: Filter.completed),
      ],
    );
  }
}

class FilterButton extends ConsumerWidget {
  final Filter filter;
  const FilterButton({super.key, required this.filter});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFilter = ref.watch(todoFilterProvider);
    logger.d('TodoFilter FilterButton ref.watch(todoFilterProvider)'.toMagenta);

    return TextButton(
      onPressed: () {
        ref.read(todoFilterProvider.notifier).changeFilter(filter);
      },
      child: Text(
        filter == Filter.all
            ? 'All'
            : filter == Filter.active
                ? 'Active'
                : 'Completed',
        style: TextStyle(
          fontSize: 18.0,
          color: currentFilter == filter ? Colors.blue : Colors.grey,
        ),
      ),
    );
  }
}
