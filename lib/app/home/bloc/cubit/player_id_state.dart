part of 'player_id_cubit.dart';

@freezed
class PlayerIdState with _$PlayerIdState {
  const factory PlayerIdState.initial() = _Initial;
  const factory PlayerIdState.loading() = _Loading;
  const factory PlayerIdState.error(String message) = _Error;
  const factory PlayerIdState.success() = _Success;
}
