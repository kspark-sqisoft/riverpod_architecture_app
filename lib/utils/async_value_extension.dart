import 'package:flutter_riverpod/flutter_riverpod.dart';

extension AsyncValueExtension on AsyncValue {
  String get toStr {
    final content = [
      if (isLoading && this is! AsyncLoading) 'isLoading: $isLoading',
      //if (hasValue) 'value: $value',
      //if (hasValue) 'value: 있다',
      if (hasValue) 'valueRuntimeType: ${value.runtimeType} value:$value',
      if (hasError) ...[
        'error: $error',
      ]
    ].join(', ');

    return '$runtimeType($content)';
  }

  String get props {
    return 'isLoading: $isLoading, isRefreshing: $isRefreshing, isReloading: $isReloading\nhasValue: $hasValue, hasError: $hasError';
  }
}
