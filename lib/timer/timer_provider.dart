import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final countdownProvider = StateNotifierProvider<TimerNotifier, Duration>((ref) {
  return TimerNotifier();
});

class TimerNotifier extends StateNotifier<Duration> {
  static const Duration initialTime = Duration(hours: 0, minutes: 1, seconds: 30);
  late Timer _timer;

  TimerNotifier() : super(initialTime) {
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.inSeconds > 0) {
        state = state - const Duration(seconds: 1);
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
