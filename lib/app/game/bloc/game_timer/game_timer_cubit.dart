import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'game_timer_state.dart';
part 'game_timer_cubit.freezed.dart';

@injectable
class GameTimerCubit extends Cubit<GameTimerState> {
  GameTimerCubit() : super(const GameTimerState.initial());

  int time = 900;
  bool _stopRunningTimer = false;
  bool isTimeOut = false;

  void startTimer() async {
    try {
      bool _isStop = false;
      for (int i = time; i >= 0; i--) {
        emit(const GameTimerState.loading());

        await Future.delayed(const Duration(seconds: 1));
        time = i;

        // stop timer if one of the player win the game
        if (_stopRunningTimer) {
          _isStop = true;
          _stopRunningTimer = false;
          emit(const GameTimerState.stopped());
          break;
        }

        emit(const GameTimerState.update());
      }
      if (!_isStop) {
        isTimeOut = true;
        emit(const GameTimerState.timeOut());
      }
    } catch (_) {}
  }

  void resetTimer() {
    time = 900;
  }

  void stopTimer() {
    isTimeOut = false;
    _stopRunningTimer = true;
  }
}
