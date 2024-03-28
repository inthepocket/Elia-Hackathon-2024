import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../date_formatter.dart';

part 'pods.g.dart';

@riverpod
DateFormatter dateFormatter(DateFormatterRef ref) {
  return DateFormatterImpl();
}
