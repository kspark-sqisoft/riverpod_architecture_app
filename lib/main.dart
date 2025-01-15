import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_architecture_app/app.dart';

final logger = Logger(
  printer: SimplePrinter(printTime: true),
  filter: ProductionFilter(),
);

void main() {
  logger.d('main');
  runApp(ProviderScope(child: const App()));
}
