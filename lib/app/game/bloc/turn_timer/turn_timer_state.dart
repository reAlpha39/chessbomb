part of 'turn_timer_cubit.dart';

@freezed
class TurnTimerState with _$TurnTimerState {
  const factory TurnTimerState.initial() = _Initial;
  const factory TurnTimerState.loading() = _Loading;
  const factory TurnTimerState.update() = _Update;
  const factory TurnTimerState.reset() = _Reset;
  const factory TurnTimerState.stopped() = _Stopped;
  const factory TurnTimerState.timeOut() = _TimeOut;
}
