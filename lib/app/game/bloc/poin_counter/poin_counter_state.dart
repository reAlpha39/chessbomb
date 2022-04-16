part of 'poin_counter_cubit.dart';

@freezed
class PoinCounterState with _$PoinCounterState {
  const factory PoinCounterState.initial() = _Initial;
  const factory PoinCounterState.loading() = _Loading;
  const factory PoinCounterState.error(String message) = _Error;
  const factory PoinCounterState.success() = _Success;
}
