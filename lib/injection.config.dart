// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'app/game/bloc/game_board/game_board_cubit.dart' as _i3;
import 'app/game/bloc/poin_counter/poin_counter_cubit.dart' as _i5;
import 'app/game/bloc/roll_dice/roll_dice_cubit.dart' as _i6;
import 'app/game/bloc/turn_timer/turn_timer_cubit.dart' as _i7;
import 'app/home/bloc/cubit/player_id_cubit.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.GameBoardCubit>(() => _i3.GameBoardCubit());
  gh.factory<_i4.PlayerIdCubit>(() => _i4.PlayerIdCubit());
  gh.factory<_i5.PoinCounterCubit>(() => _i5.PoinCounterCubit());
  gh.factory<_i6.RollDiceCubit>(() => _i6.RollDiceCubit());
  gh.factory<_i7.TurnTimerCubit>(() => _i7.TurnTimerCubit());
  return get;
}
