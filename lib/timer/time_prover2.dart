import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentTimeProvider = StreamProvider<DateTime>((ref) {
  return Stream<DateTime>.periodic(
    const Duration(seconds: 1),
    (_) => DateTime.now(),
  );
});
final carouselIndexProvider = StateProvider<int>((ref) => 0);
