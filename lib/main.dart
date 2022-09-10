import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetbook_challenge/app.dart';

void main() {
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
