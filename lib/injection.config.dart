// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'app/game/bloc/game_board/game_board_cubit.dart' as _i3;
import 'app/game/bloc/roll_dice/roll_dice_cubit.dart' as _i5;
import 'app/home/bloc/cubit/player_id_cubit.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.GameBoardCubit>(() => _i3.GameBoardCubit());
  gh.factory<_i4.PlayerIdCubit>(() => _i4.PlayerIdCubit());
  gh.factory<_i5.RollDiceCubit>(() => _i5.RollDiceCubit());
  return get;
}
