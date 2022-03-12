import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'player_state.dart';
part 'player_cubit.freezed.dart';

@injectable
class PlayerCubit extends Cubit<PlayerState> {
  PlayerCubit() : super(const PlayerState.initial());

  int index = -1;
  int playerStateIndex = -1;

  void changePlayerState() {
    emit(const PlayerState.initial());
    index++;
    playerStateIndex = index;
    switch (index) {
      case 0:
        emit(const PlayerState.onTurn());
        break;
      case 1:
        emit(const PlayerState.diceRolled());
        break;
      case 2:
        emit(const PlayerState.pionChosen());
        break;
      case 3:
        emit(const PlayerState.strategyChosen());
        break;
      case 4:
        emit(const PlayerState.pionMoved());
        break;
      case 5:
        emit(const PlayerState.bombThrowed());
        break;
      case 6:
        index = -1;
        emit(const PlayerState.endOfTurn());
        break;
      default:
        index = -1;
        emit(const PlayerState.waitForTurn());
    }
  }
}
