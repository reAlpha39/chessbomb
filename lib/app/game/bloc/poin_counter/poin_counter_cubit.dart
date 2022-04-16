import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'poin_counter_state.dart';
part 'poin_counter_cubit.freezed.dart';

@injectable
class PoinCounterCubit extends Cubit<PoinCounterState> {
  PoinCounterCubit() : super(const PoinCounterState.initial());
}
