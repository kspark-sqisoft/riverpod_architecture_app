import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_architecture_app/main.dart';

part 'dio_provider.g.dart';

@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  ref.onDispose(() {
    logger.d('dioProvider onDispose');
  });
  ref.onCancel(() {
    logger.d('dioProvider onCancel');
  });
  ref.onResume(() {
    logger.d('dioProvider onResume');
  });
  ref.onAddListener(() {
    logger.d('dioProvider onAddListener');
  });
  ref.onRemoveListener(() {
    logger.d('dioProvider onRemoveListener');
  });
  logger.d('dioProvider initialized');
  return Dio();
}
