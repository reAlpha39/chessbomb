part of 'roll_dice_cubit.dart';

@freezed
class RollDiceState with _$RollDiceState {
  const factory RollDiceState.initial() = _Initial;
  const factory RollDiceState.loading() = _Loading;
  const factory RollDiceState.rolled(int index) = _Rolled;
}
