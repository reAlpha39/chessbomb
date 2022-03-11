import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'roll_dice_state.dart';
part 'roll_dice_cubit.freezed.dart';

@injectable
class RollDiceCubit extends Cubit<RollDiceState> {
  RollDiceCubit() : super(const RollDiceState.initial());
  int roll = -1;

  void rollDice() {
    emit(const RollDiceState.loading());
    if (roll == -1) {
      _generateRandomNumber();
      emit(RollDiceState.rolled(roll));
    }
  }

  void reset() {
    roll = -1;
    emit(const RollDiceState.initial());
  }

  void _generateRandomNumber() {
    Random random = Random();
    int rollNumber = random.nextInt(8);
    if (rollNumber == 0) {
      _generateRandomNumber();
    } else {
      roll = rollNumber;
    }
  }
}
