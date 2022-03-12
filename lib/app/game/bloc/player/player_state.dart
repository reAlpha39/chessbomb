part of 'player_cubit.dart';

@freezed
class PlayerState with _$PlayerState {
  const factory PlayerState.initial() = _Initial;
  const factory PlayerState.loading() = _Loading;
  const factory PlayerState.waitForTurn() = _WaitForTurn;
  const factory PlayerState.onTurn() = _OnTurn;
  const factory PlayerState.diceRolled() = _RollDice;
  const factory PlayerState.pionChosen() = _PionChosen;
  const factory PlayerState.strategyChosen() = _StrategyChosen;
  const factory PlayerState.pionMoved() = _PionMoved;
  const factory PlayerState.bombThrowed() = _BombThrowed;
  const factory PlayerState.endOfTurn() = _EndOfTurn;
}
