part of 'game_timer_cubit.dart';

@freezed
class GameTimerState with _$GameTimerState {
  const factory GameTimerState.initial() = _Initial;
  const factory GameTimerState.loading() = _Loading;
  const factory GameTimerState.update() = _Update;
  const factory GameTimerState.stopped() = _Stopped;
  const factory GameTimerState.timeOut() = _TimeOut;
}
