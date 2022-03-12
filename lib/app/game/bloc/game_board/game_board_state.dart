part of 'game_board_cubit.dart';

@freezed
class GameBoardState with _$GameBoardState {
  const factory GameBoardState.initial() = _Initial;
  const factory GameBoardState.loading() = _Loading;
  const factory GameBoardState.error() = _Error;
  const factory GameBoardState.selectedTiles(int index) = _SelectedTiles;
  const factory GameBoardState.selectedTileDest(int index) = _SelectedTileDest;
  const factory GameBoardState.updateBoard() = _UpdateBoard;
}
