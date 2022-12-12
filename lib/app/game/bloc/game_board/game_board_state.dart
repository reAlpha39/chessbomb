part of 'game_board_cubit.dart';

@freezed
class GameBoardState with _$GameBoardState {
  const factory GameBoardState.initial() = _Initial;
  const factory GameBoardState.loading() = _Loading;
  const factory GameBoardState.error() = _Error;
  const factory GameBoardState.selectedTiles() = _SelectedTiles;
  const factory GameBoardState.selectedStrategy() = _SelectedStrategy;
  const factory GameBoardState.updateBoard() = _UpdateBoard;
  const factory GameBoardState.playerTurn(String playerId) = _PlayerTurn;
  const factory GameBoardState.gameFinished() = _GameFinished;
}
