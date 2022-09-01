import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'poin_counter_state.dart';
part 'poin_counter_cubit.freezed.dart';

@injectable
class PoinCounterCubit extends Cubit<PoinCounterState> {
  PoinCounterCubit() : super(const PoinCounterState.initial());

  int playerAPoint = 5;
  int playerBPoint = 5;

  int playerAScore = 5;
  int playerBScore = 5;

  void updatePoint(
      {required int tempPoint,
      required int tempScore,
      required String playerId}) {
    emit(const PoinCounterState.loading());
    // reverse playerId
    if (playerId == '2') {
      playerAPoint += tempPoint;
      playerAScore += tempScore;
    } else if (playerId == '1') {
      playerBPoint += tempPoint;
      playerBScore += tempScore;
    }
    emit(const PoinCounterState.success());
  }

  // add point +100 for debug mode
  void addPoint() {
    emit(const PoinCounterState.loading());
    playerAPoint += 95;
    playerBPoint += 95;
    emit(const PoinCounterState.success());
  }
}
