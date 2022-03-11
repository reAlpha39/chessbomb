import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'player_id_state.dart';
part 'player_id_cubit.freezed.dart';

@injectable
class PlayerIdCubit extends Cubit<PlayerIdState> {
  PlayerIdCubit() : super(const PlayerIdState.initial());

  TextEditingController playerId = TextEditingController();
}
