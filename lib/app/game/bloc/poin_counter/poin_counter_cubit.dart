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

  void updatePoint({required int tempPoint, required String playerId}) {
    emit(const PoinCounterState.loading());
    // reverse playerId
    if (playerId == '2') {
      playerAPoint += tempPoint;
      playerAScore += tempPoint;
    } else if (playerId == '1') {
      playerBPoint += tempPoint;
      playerBScore += tempPoint;
    }
    emit(const PoinCounterState.success());
  }
}
