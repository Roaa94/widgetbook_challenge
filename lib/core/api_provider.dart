import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetbook_challenge/api/widgetbook_api.dart';

/// Riverpod provider for the [WidgetbookApi]
final apiProvider = Provider<WidgetbookApi>((ref) {
  return WidgetbookApi();
});
