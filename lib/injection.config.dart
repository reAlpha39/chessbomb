// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bombernyaa/app/game/bloc/game_board/game_board_cubit.dart'
    as _i3;
import 'package:bombernyaa/app/game/bloc/game_timer/game_timer_cubit.dart'
    as _i4;
import 'package:bombernyaa/app/game/bloc/poin_counter/poin_counter_cubit.dart'
    as _i6;
import 'package:bombernyaa/app/game/bloc/roll_dice/roll_dice_cubit.dart' as _i7;
import 'package:bombernyaa/app/game/bloc/turn_timer/turn_timer_cubit.dart'
    as _i8;
import 'package:bombernyaa/app/home/bloc/cubit/player_id_cubit.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.GameBoardCubit>(() => _i3.GameBoardCubit());
    gh.factory<_i4.GameTimerCubit>(() => _i4.GameTimerCubit());
    gh.factory<_i5.PlayerIdCubit>(() => _i5.PlayerIdCubit());
    gh.factory<_i6.PoinCounterCubit>(() => _i6.PoinCounterCubit());
    gh.factory<_i7.RollDiceCubit>(() => _i7.RollDiceCubit());
    gh.factory<_i8.TurnTimerCubit>(() => _i8.TurnTimerCubit());
    return this;
  }
}
