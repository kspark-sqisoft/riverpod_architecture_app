import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture_app/main.dart';
import 'package:riverpod_architecture_app/utils/store.dart';

class InMemoryScreen extends ConsumerStatefulWidget {
  const InMemoryScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InMemoryScreenState();
}

class _InMemoryScreenState extends ConsumerState<InMemoryScreen> {
  @override
  void initState() {
    CacheClient.write(key: 'key1', value: 1);
    CacheClient.write(key: 'key2', value: 'keesoon');

    final cache2 = CacheClient.read(key: 'key2');
    logger.d('cache2:$cache2');
    final allCache = CacheClient.readAll();
    logger.d('allCache:$allCache');
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
