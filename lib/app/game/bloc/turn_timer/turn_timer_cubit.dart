import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'turn_timer_state.dart';
part 'turn_timer_cubit.freezed.dart';

@injectable
class TurnTimerCubit extends Cubit<TurnTimerState> {
  TurnTimerCubit() : super(const TurnTimerState.initial());

  int time = 15;
  bool _stopRunningTimer = false;

  void startTimer() async {
    try {
      bool _isStop = false;
      for (int i = time; i >= 0; i--) {
        emit(const TurnTimerState.loading());

        await Future.delayed(const Duration(seconds: 1));
        time = i;

        // stop timer if user player ended the turn before timeout
        if (_stopRunningTimer) {
          _isStop = true;
          _stopRunningTimer = false;
          emit(const TurnTimerState.stopped());
          break;
        }

        emit(const TurnTimerState.update());
      }
      if (!_isStop) {
        emit(const TurnTimerState.timeOut());
      }
    } catch (_) {}
  }

  void resetTimer() {
    time = 15;
  }

  void stopTimer() {
    _stopRunningTimer = true;
  }
}
