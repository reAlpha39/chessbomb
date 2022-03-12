// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'player_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PlayerStateTearOff {
  const _$PlayerStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Loading loading() {
    return const _Loading();
  }

  _WaitForTurn waitForTurn() {
    return const _WaitForTurn();
  }

  _OnTurn onTurn() {
    return const _OnTurn();
  }

  _RollDice diceRolled() {
    return const _RollDice();
  }

  _PionChosen pionChosen() {
    return const _PionChosen();
  }

  _StrategyChosen strategyChosen() {
    return const _StrategyChosen();
  }

  _PionMoved pionMoved() {
    return const _PionMoved();
  }

  _BombThrowed bombThrowed() {
    return const _BombThrowed();
  }

  _EndOfTurn endOfTurn() {
    return const _EndOfTurn();
  }
}

/// @nodoc
const $PlayerState = _$PlayerStateTearOff();

/// @nodoc
mixin _$PlayerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() waitForTurn,
    required TResult Function() onTurn,
    required TResult Function() diceRolled,
    required TResult Function() pionChosen,
    required TResult Function() strategyChosen,
    required TResult Function() pionMoved,
    required TResult Function() bombThrowed,
    required TResult Function() endOfTurn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? waitForTurn,
    TResult Function()? onTurn,
    TResult Function()? diceRolled,
    TResult Function()? pionChosen,
    TResult Function()? strategyChosen,
    TResult Function()? pionMoved,
    TResult Function()? bombThrowed,
    TResult Function()? endOfTurn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? waitForTurn,
    TResult Function()? onTurn,
    TResult Function()? diceRolled,
    TResult Function()? pionChosen,
    TResult Function()? strategyChosen,
    TResult Function()? pionMoved,
    TResult Function()? bombThrowed,
    TResult Function()? endOfTurn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_WaitForTurn value) waitForTurn,
    required TResult Function(_OnTurn value) onTurn,
    required TResult Function(_RollDice value) diceRolled,
    required TResult Function(_PionChosen value) pionChosen,
    required TResult Function(_StrategyChosen value) strategyChosen,
    required TResult Function(_PionMoved value) pionMoved,
    required TResult Function(_BombThrowed value) bombThrowed,
    required TResult Function(_EndOfTurn value) endOfTurn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_WaitForTurn value)? waitForTurn,
    TResult Function(_OnTurn value)? onTurn,
    TResult Function(_RollDice value)? diceRolled,
    TResult Function(_PionChosen value)? pionChosen,
    TResult Function(_StrategyChosen value)? strategyChosen,
    TResult Function(_PionMoved value)? pionMoved,
    TResult Function(_BombThrowed value)? bombThrowed,
    TResult Function(_EndOfTurn value)? endOfTurn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_WaitForTurn value)? waitForTurn,
    TResult Function(_OnTurn value)? onTurn,
    TResult Function(_RollDice value)? diceRolled,
    TResult Function(_PionChosen value)? pionChosen,
    TResult Function(_StrategyChosen value)? strategyChosen,
    TResult Function(_PionMoved value)? pionMoved,
    TResult Function(_BombThrowed value)? bombThrowed,
    TResult Function(_EndOfTurn value)? endOfTurn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerStateCopyWith<$Res> {
  factory $PlayerStateCopyWith(
          PlayerState value, $Res Function(PlayerState) then) =
      _$PlayerStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PlayerStateCopyWithImpl<$Res> implements $PlayerStateCopyWith<$Res> {
  _$PlayerStateCopyWithImpl(this._value, this._then);

  final PlayerState _value;
  // ignore: unused_field
  final $Res Function(PlayerState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$PlayerStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'PlayerState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() waitForTurn,
    required TResult Function() onTurn,
    required TResult Function() diceRolled,
    required TResult Function() pionChosen,
    required TResult Function() strategyChosen,
    required TResult Function() pionMoved,
    required TResult Function() bombThrowed,
    required TResult Function() endOfTurn,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? waitForTurn,
    TResult Function()? onTurn,
    TResult Function()? diceRolled,
    TResult Function()? pionChosen,
    TResult Function()? strategyChosen,
    TResult Function()? pionMoved,
    TResult Function()? bombThrowed,
    TResult Function()? endOfTurn,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? waitForTurn,
    TResult Function()? onTurn,
    TResult Function()? diceRolled,
    TResult Function()? pionChosen,
    TResult Function()? strategyChosen,
    TResult Function()? pionMoved,
    TResult Function()? bombThrowed,
    TResult Function()? endOfTurn,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_WaitForTurn value) waitForTurn,
    required TResult Function(_OnTurn value) onTurn,
    required TResult Function(_RollDice value) diceRolled,
    required TResult Function(_PionChosen value) pionChosen,
    required TResult Function(_StrategyChosen value) strategyChosen,
    required TResult Function(_PionMoved value) pionMoved,
    required TResult Function(_BombThrowed value) bombThrowed,
    required TResult Function(_EndOfTurn value) endOfTurn,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_WaitForTurn value)? waitForTurn,
    TResult Function(_OnTurn value)? onTurn,
    TResult Function(_RollDice value)? diceRolled,
    TResult Function(_PionChosen value)? pionChosen,
    TResult Function(_StrategyChosen value)? strategyChosen,
    TResult Function(_PionMoved value)? pionMoved,
    TResult Function(_BombThrowed value)? bombThrowed,
    TResult Function(_EndOfTurn value)? endOfTurn,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_WaitForTurn value)? waitForTurn,
    TResult Function(_OnTurn value)? onTurn,
    TResult Function(_RollDice value)? diceRolled,
    TResult Function(_PionChosen value)? pionChosen,
    TResult Function(_StrategyChosen value)? strategyChosen,
    TResult Function(_PionMoved value)? pionMoved,
    TResult Function(_BombThrowed value)? bombThrowed,
    TResult Function(_EndOfTurn value)? endOfTurn,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PlayerState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$PlayerStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'PlayerState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() waitForTurn,
    required TResult Function() onTurn,
    required TResult Function() diceRolled,
    required TResult Function() pionChosen,
    required TResult Function() strategyChosen,
    required TResult Function() pionMoved,
    required TResult Function() bombThrowed,
    required TResult Function() endOfTurn,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? waitForTurn,
    TResult Function()? onTurn,
    TResult Function()? diceRolled,
    TResult Function()? pionChosen,
    TResult Function()? strategyChosen,
    TResult Function()? pionMoved,
    TResult Function()? bombThrowed,
    TResult Function()? endOfTurn,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? waitForTurn,
    TResult Function()? onTurn,
    TResult Function()? diceRolled,
    TResult Function()? pionChosen,
    TResult Function()? strategyChosen,
    TResult Function()? pionMoved,
    TResult Function()? bombThrowed,
    TResult Function()? endOfTurn,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_WaitForTurn value) waitForTurn,
    required TResult Function(_OnTurn value) onTurn,
    required TResult Function(_RollDice value) diceRolled,
    required TResult Function(_PionChosen value) pionChosen,
    required TResult Function(_StrategyChosen value) strategyChosen,
    required TResult Function(_PionMoved value) pionMoved,
    required TResult Function(_BombThrowed value) bombThrowed,
    required TResult Function(_EndOfTurn value) endOfTurn,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_WaitForTurn value)? waitForTurn,
    TResult Function(_OnTurn value)? onTurn,
    TResult Function(_RollDice value)? diceRolled,
    TResult Function(_PionChosen value)? pionChosen,
    TResult Function(_StrategyChosen value)? strategyChosen,
    TResult Function(_PionMoved value)? pionMoved,
    TResult Function(_BombThrowed value)? bombThrowed,
    TResult Function(_EndOfTurn value)? endOfTurn,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_WaitForTurn value)? waitForTurn,
    TResult Function(_OnTurn value)? onTurn,
    TResult Function(_RollDice value)? diceRolled,
    TResult Function(_PionChosen value)? pionChosen,
    TResult Function(_StrategyChosen value)? strategyChosen,
    TResult Function(_PionMoved value)? pionMoved,
    TResult Function(_BombThrowed value)? bombThrowed,
    TResult Function(_EndOfTurn value)? endOfTurn,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements PlayerState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$WaitForTurnCopyWith<$Res> {
  factory _$WaitForTurnCopyWith(
          _WaitForTurn value, $Res Function(_WaitForTurn) then) =
      __$WaitForTurnCopyWithImpl<$Res>;
}

/// @nodoc
class __$WaitForTurnCopyWithImpl<$Res> extends _$PlayerStateCopyWithImpl<$Res>
    implements _$WaitForTurnCopyWith<$Res> {
  __$WaitForTurnCopyWithImpl(
      _WaitForTurn _value, $Res Function(_WaitForTurn) _then)
      : super(_value, (v) => _then(v as _WaitForTurn));

  @override
  _WaitForTurn get _value => super._value as _WaitForTurn;
}

/// @nodoc

class _$_WaitForTurn implements _WaitForTurn {
  const _$_WaitForTurn();

  @override
  String toString() {
    return 'PlayerState.waitForTurn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _WaitForTurn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() waitForTurn,
    required TResult Function() onTurn,
    required TResult Function() diceRolled,
    required TResult Function() pionChosen,
    required TResult Function() strategyChosen,
    required TResult Function() pionMoved,
    required TResult Function() bombThrowed,
    required TResult Function() endOfTurn,
  }) {
    return waitForTurn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? waitForTurn,
    TResult Function()? onTurn,
    TResult Function()? diceRolled,
    TResult Function()? pionChosen,
    TResult Function()? strategyChosen,
    TResult Function()? pionMoved,
    TResult Function()? bombThrowed,
    TResult Function()? endOfTurn,
  }) {
    return waitForTurn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? waitForTurn,
    TResult Function()? onTurn,
    TResult Function()? diceRolled,
    TResult Function()? pionChosen,
    TResult Function()? strategyChosen,
    TResult Function()? pionMoved,
    TResult Function()? bombThrowed,
    TResult Function()? endOfTurn,
    required TResult orElse(),
  }) {
    if (waitForTurn != null) {
      return waitForTurn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_WaitForTurn value) waitForTurn,
    required TResult Function(_OnTurn value) onTurn,
    required TResult Function(_RollDice value) diceRolled,
    required TResult Function(_PionChosen value) pionChosen,
    required TResult Function(_StrategyChosen value) strategyChosen,
    required TResult Function(_PionMoved value) pionMoved,
    required TResult Function(_BombThrowed value) bombThrowed,
    required TResult Function(_EndOfTurn value) endOfTurn,
  }) {
    return waitForTurn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_WaitForTurn value)? waitForTurn,
    TResult Function(_OnTurn value)? onTurn,
    TResult Function(_RollDice value)? diceRolled,
    TResult Function(_PionChosen value)? pionChosen,
    TResult Function(_StrategyChosen value)? strategyChosen,
    TResult Function(_PionMoved value)? pionMoved,
    TResult Function(_BombThrowed value)? bombThrowed,
    TResult Function(_EndOfTurn value)? endOfTurn,
  }) {
    return waitForTurn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_WaitForTurn value)? waitForTurn,
    TResult Function(_OnTurn value)? onTurn,
    TResult Function(_RollDice value)? diceRolled,
    TResult Function(_PionChosen value)? pionChosen,
    TResult Function(_StrategyChosen value)? strategyChosen,
    TResult Function(_PionMoved value)? pionMoved,
    TResult Function(_BombThrowed value)? bombThrowed,
    TResult Function(_EndOfTurn value)? endOfTurn,
    required TResult orElse(),
  }) {
    if (waitForTurn != null) {
      return waitForTurn(this);
    }
    return orElse();
  }
}

abstract class _WaitForTurn implements PlayerState {
  const factory _WaitForTurn() = _$_WaitForTurn;
}

/// @nodoc
abstract class _$OnTurnCopyWith<$Res> {
  factory _$OnTurnCopyWith(_OnTurn value, $Res Function(_OnTurn) then) =
      __$OnTurnCopyWithImpl<$Res>;
}

/// @nodoc
class __$OnTurnCopyWithImpl<$Res> extends _$PlayerStateCopyWithImpl<$Res>
    implements _$OnTurnCopyWith<$Res> {
  __$OnTurnCopyWithImpl(_OnTurn _value, $Res Function(_OnTurn) _then)
      : super(_value, (v) => _then(v as _OnTurn));

  @override
  _OnTurn get _value => super._value as _OnTurn;
}

/// @nodoc

class _$_OnTurn implements _OnTurn {
  const _$_OnTurn();

  @override
  String toString() {
    return 'PlayerState.onTurn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _OnTurn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() waitForTurn,
    required TResult Function() onTurn,
    required TResult Function() diceRolled,
    required TResult Function() pionChosen,
    required TResult Function() strategyChosen,
    required TResult Function() pionMoved,
    required TResult Function() bombThrowed,
    required TResult Function() endOfTurn,
  }) {
    return onTurn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? waitForTurn,
    TResult Function()? onTurn,
    TResult Function()? diceRolled,
    TResult Function()? pionChosen,
    TResult Function()? strategyChosen,
    TResult Function()? pionMoved,
    TResult Function()? bombThrowed,
    TResult Function()? endOfTurn,
  }) {
    return onTurn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? waitForTurn,
    TResult Function()? onTurn,
    TResult Function()? diceRolled,
    TResult Function()? pionChosen,
    TResult Function()? strategyChosen,
    TResult Function()? pionMoved,
    TResult Function()? bombThrowed,
    TResult Function()? endOfTurn,
    required TResult orElse(),
  }) {
    if (onTurn != null) {
      return onTurn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_WaitForTurn value) waitForTurn,
    required TResult Function(_OnTurn value) onTurn,
    required TResult Function(_RollDice value) diceRolled,
    required TResult Function(_PionChosen value) pionChosen,
    required TResult Function(_StrategyChosen value) strategyChosen,
    required TResult Function(_PionMoved value) pionMoved,
    required TResult Function(_BombThrowed value) bombThrowed,
    required TResult Function(_EndOfTurn value) endOfTurn,
  }) {
    return onTurn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_WaitForTurn value)? waitForTurn,
    TResult Function(_OnTurn value)? onTurn,
    TResult Function(_RollDice value)? diceRolled,
    TResult Function(_PionChosen value)? pionChosen,
    TResult Function(_StrategyChosen value)? strategyChosen,
    TResult Function(_PionMoved value)? pionMoved,
    TResult Function(_BombThrowed value)? bombThrowed,
    TResult Function(_EndOfTurn value)? endOfTurn,
  }) {
    return onTurn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_WaitForTurn value)? waitForTurn,
    TResult Function(_OnTurn value)? onTurn,
    TResult Function(_RollDice value)? diceRolled,
    TResult Function(_PionChosen value)? pionChosen,
    TResult Function(_StrategyChosen value)? strategyChosen,
    TResult Function(_PionMoved value)? pionMoved,
    TResult Function(_BombThrowed value)? bombThrowed,
    TResult Function(_EndOfTurn value)? endOfTurn,
    required TResult orElse(),
  }) {
    if (onTurn != null) {
      return onTurn(this);
    }
    return orElse();
  }
}

abstract class _OnTurn implements PlayerState {
  const factory _OnTurn() = _$_OnTurn;
}

/// @nodoc
abstract class _$RollDiceCopyWith<$Res> {
  factory _$RollDiceCopyWith(_RollDice value, $Res Function(_RollDice) then) =
      __$RollDiceCopyWithImpl<$Res>;
}

/// @nodoc
class __$RollDiceCopyWithImpl<$Res> extends _$PlayerStateCopyWithImpl<$Res>
    implements _$RollDiceCopyWith<$Res> {
  __$RollDiceCopyWithImpl(_RollDice _value, $Res Function(_RollDice) _then)
      : super(_value, (v) => _then(v as _RollDice));

  @override
  _RollDice get _value => super._value as _RollDice;
}

/// @nodoc

class _$_RollDice implements _RollDice {
  const _$_RollDice();

  @override
  String toString() {
    return 'PlayerState.diceRolled()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _RollDice);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() waitForTurn,
    required TResult Function() onTurn,
    required TResult Function() diceRolled,
    required TResult Function() pionChosen,
    required TResult Function() strategyChosen,
    required TResult Function() pionMoved,
    required TResult Function() bombThrowed,
    required TResult Function() endOfTurn,
  }) {
    return diceRolled();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? waitForTurn,
    TResult Function()? onTurn,
    TResult Function()? diceRolled,
    TResult Function()? pionChosen,
    TResult Function()? strategyChosen,
    TResult Function()? pionMoved,
    TResult Function()? bombThrowed,
    TResult Function()? endOfTurn,
  }) {
    return diceRolled?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? waitForTurn,
    TResult Function()? onTurn,
    TResult Function()? diceRolled,
    TResult Function()? pionChosen,
    TResult Function()? strategyChosen,
    TResult Function()? pionMoved,
    TResult Function()? bombThrowed,
    TResult Function()? endOfTurn,
    required TResult orElse(),
  }) {
    if (diceRolled != null) {
      return diceRolled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_WaitForTurn value) waitForTurn,
    required TResult Function(_OnTurn value) onTurn,
    required TResult Function(_RollDice value) diceRolled,
    required TResult Function(_PionChosen value) pionChosen,
    required TResult Function(_StrategyChosen value) strategyChosen,
    required TResult Function(_PionMoved value) pionMoved,
    required TResult Function(_BombThrowed value) bombThrowed,
    required TResult Function(_EndOfTurn value) endOfTurn,
  }) {
    return diceRolled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_WaitForTurn value)? waitForTurn,
    TResult Function(_OnTurn value)? onTurn,
    TResult Function(_RollDice value)? diceRolled,
    TResult Function(_PionChosen value)? pionChosen,
    TResult Function(_StrategyChosen value)? strategyChosen,
    TResult Function(_PionMoved value)? pionMoved,
    TResult Function(_BombThrowed value)? bombThrowed,
    TResult Function(_EndOfTurn value)? endOfTurn,
  }) {
    return diceRolled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_WaitForTurn value)? waitForTurn,
    TResult Function(_OnTurn value)? onTurn,
    TResult Function(_RollDice value)? diceRolled,
    TResult Function(_PionChosen value)? pionChosen,
    TResult Function(_StrategyChosen value)? strategyChosen,
    TResult Function(_PionMoved value)? pionMoved,
    TResult Function(_BombThrowed value)? bombThrowed,
    TResult Function(_EndOfTurn value)? endOfTurn,
    required TResult orElse(),
  }) {
    if (diceRolled != null) {
      return diceRolled(this);
    }
    return orElse();
  }
}

abstract class _RollDice implements PlayerState {
  const factory _RollDice() = _$_RollDice;
}

/// @nodoc
abstract class _$PionChosenCopyWith<$Res> {
  factory _$PionChosenCopyWith(
          _PionChosen value, $Res Function(_PionChosen) then) =
      __$PionChosenCopyWithImpl<$Res>;
}

/// @nodoc
class __$PionChosenCopyWithImpl<$Res> extends _$PlayerStateCopyWithImpl<$Res>
    implements _$PionChosenCopyWith<$Res> {
  __$PionChosenCopyWithImpl(
      _PionChosen _value, $Res Function(_PionChosen) _then)
      : super(_value, (v) => _then(v as _PionChosen));

  @override
  _PionChosen get _value => super._value as _PionChosen;
}

/// @nodoc

class _$_PionChosen implements _PionChosen {
  const _$_PionChosen();

  @override
  String toString() {
    return 'PlayerState.pionChosen()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _PionChosen);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() waitForTurn,
    required TResult Function() onTurn,
    required TResult Function() diceRolled,
    required TResult Function() pionChosen,
    required TResult Function() strategyChosen,
    required TResult Function() pionMoved,
    required TResult Function() bombThrowed,
    required TResult Function() endOfTurn,
  }) {
    return pionChosen();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? waitForTurn,
    TResult Function()? onTurn,
    TResult Function()? diceRolled,
    TResult Function()? pionChosen,
    TResult Function()? strategyChosen,
    TResult Function()? pionMoved,
    TResult Function()? bombThrowed,
    TResult Function()? endOfTurn,
  }) {
    return pionChosen?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? waitForTurn,
    TResult Function()? onTurn,
    TResult Function()? diceRolled,
    TResult Function()? pionChosen,
    TResult Function()? strategyChosen,
    TResult Function()? pionMoved,
    TResult Function()? bombThrowed,
    TResult Function()? endOfTurn,
    required TResult orElse(),
  }) {
    if (pionChosen != null) {
      return pionChosen();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_WaitForTurn value) waitForTurn,
    required TResult Function(_OnTurn value) onTurn,
    required TResult Function(_RollDice value) diceRolled,
    required TResult Function(_PionChosen value) pionChosen,
    required TResult Function(_StrategyChosen value) strategyChosen,
    required TResult Function(_PionMoved value) pionMoved,
    required TResult Function(_BombThrowed value) bombThrowed,
    required TResult Function(_EndOfTurn value) endOfTurn,
  }) {
    return pionChosen(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_WaitForTurn value)? waitForTurn,
    TResult Function(_OnTurn value)? onTurn,
    TResult Function(_RollDice value)? diceRolled,
    TResult Function(_PionChosen value)? pionChosen,
    TResult Function(_StrategyChosen value)? strategyChosen,
    TResult Function(_PionMoved value)? pionMoved,
    TResult Function(_BombThrowed value)? bombThrowed,
    TResult Function(_EndOfTurn value)? endOfTurn,
  }) {
    return pionChosen?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_WaitForTurn value)? waitForTurn,
    TResult Function(_OnTurn value)? onTurn,
    TResult Function(_RollDice value)? diceRolled,
    TResult Function(_PionChosen value)? pionChosen,
    TResult Function(_StrategyChosen value)? strategyChosen,
    TResult Function(_PionMoved value)? pionMoved,
    TResult Function(_BombThrowed value)? bombThrowed,
    TResult Function(_EndOfTurn value)? endOfTurn,
    required TResult orElse(),
  }) {
    if (pionChosen != null) {
      return pionChosen(this);
    }
    return orElse();
  }
}

abstract class _PionChosen implements PlayerState {
  const factory _PionChosen() = _$_PionChosen;
}

/// @nodoc
abstract class _$StrategyChosenCopyWith<$Res> {
  factory _$StrategyChosenCopyWith(
          _StrategyChosen value, $Res Function(_StrategyChosen) then) =
      __$StrategyChosenCopyWithImpl<$Res>;
}

/// @nodoc
class __$StrategyChosenCopyWithImpl<$Res>
    extends _$PlayerStateCopyWithImpl<$Res>
    implements _$StrategyChosenCopyWith<$Res> {
  __$StrategyChosenCopyWithImpl(
      _StrategyChosen _value, $Res Function(_StrategyChosen) _then)
      : super(_value, (v) => _then(v as _StrategyChosen));

  @override
  _StrategyChosen get _value => super._value as _StrategyChosen;
}

/// @nodoc

class _$_StrategyChosen implements _StrategyChosen {
  const _$_StrategyChosen();

  @override
  String toString() {
    return 'PlayerState.strategyChosen()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _StrategyChosen);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() waitForTurn,
    required TResult Function() onTurn,
    required TResult Function() diceRolled,
    required TResult Function() pionChosen,
    required TResult Function() strategyChosen,
    required TResult Function() pionMoved,
    required TResult Function() bombThrowed,
    required TResult Function() endOfTurn,
  }) {
    return strategyChosen();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? waitForTurn,
    TResult Function()? onTurn,
    TResult Function()? diceRolled,
    TResult Function()? pionChosen,
    TResult Function()? strategyChosen,
    TResult Function()? pionMoved,
    TResult Function()? bombThrowed,
    TResult Function()? endOfTurn,
  }) {
    return strategyChosen?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? waitForTurn,
    TResult Function()? onTurn,
    TResult Function()? diceRolled,
    TResult Function()? pionChosen,
    TResult Function()? strategyChosen,
    TResult Function()? pionMoved,
    TResult Function()? bombThrowed,
    TResult Function()? endOfTurn,
    required TResult orElse(),
  }) {
    if (strategyChosen != null) {
      return strategyChosen();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_WaitForTurn value) waitForTurn,
    required TResult Function(_OnTurn value) onTurn,
    required TResult Function(_RollDice value) diceRolled,
    required TResult Function(_PionChosen value) pionChosen,
    required TResult Function(_StrategyChosen value) strategyChosen,
    required TResult Function(_PionMoved value) pionMoved,
    required TResult Function(_BombThrowed value) bombThrowed,
    required TResult Function(_EndOfTurn value) endOfTurn,
  }) {
    return strategyChosen(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_WaitForTurn value)? waitForTurn,
    TResult Function(_OnTurn value)? onTurn,
    TResult Function(_RollDice value)? diceRolled,
    TResult Function(_PionChosen value)? pionChosen,
    TResult Function(_StrategyChosen value)? strategyChosen,
    TResult Function(_PionMoved value)? pionMoved,
    TResult Function(_BombThrowed value)? bombThrowed,
    TResult Function(_EndOfTurn value)? endOfTurn,
  }) {
    return strategyChosen?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_WaitForTurn value)? waitForTurn,
    TResult Function(_OnTurn value)? onTurn,
    TResult Function(_RollDice value)? diceRolled,
    TResult Function(_PionChosen value)? pionChosen,
    TResult Function(_StrategyChosen value)? strategyChosen,
    TResult Function(_PionMoved value)? pionMoved,
    TResult Function(_BombThrowed value)? bombThrowed,
    TResult Function(_EndOfTurn value)? endOfTurn,
    required TResult orElse(),
  }) {
    if (strategyChosen != null) {
      return strategyChosen(this);
    }
    return orElse();
  }
}

abstract class _StrategyChosen implements PlayerState {
  const factory _StrategyChosen() = _$_StrategyChosen;
}

/// @nodoc
abstract class _$PionMovedCopyWith<$Res> {
  factory _$PionMovedCopyWith(
          _PionMoved value, $Res Function(_PionMoved) then) =
      __$PionMovedCopyWithImpl<$Res>;
}

/// @nodoc
class __$PionMovedCopyWithImpl<$Res> extends _$PlayerStateCopyWithImpl<$Res>
    implements _$PionMovedCopyWith<$Res> {
  __$PionMovedCopyWithImpl(_PionMoved _value, $Res Function(_PionMoved) _then)
      : super(_value, (v) => _then(v as _PionMoved));

  @override
  _PionMoved get _value => super._value as _PionMoved;
}

/// @nodoc

class _$_PionMoved implements _PionMoved {
  const _$_PionMoved();

  @override
  String toString() {
    return 'PlayerState.pionMoved()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _PionMoved);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() waitForTurn,
    required TResult Function() onTurn,
    required TResult Function() diceRolled,
    required TResult Function() pionChosen,
    required TResult Function() strategyChosen,
    required TResult Function() pionMoved,
    required TResult Function() bombThrowed,
    required TResult Function() endOfTurn,
  }) {
    return pionMoved();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? waitForTurn,
    TResult Function()? onTurn,
    TResult Function()? diceRolled,
    TResult Function()? pionChosen,
    TResult Function()? strategyChosen,
    TResult Function()? pionMoved,
    TResult Function()? bombThrowed,
    TResult Function()? endOfTurn,
  }) {
    return pionMoved?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? waitForTurn,
    TResult Function()? onTurn,
    TResult Function()? diceRolled,
    TResult Function()? pionChosen,
    TResult Function()? strategyChosen,
    TResult Function()? pionMoved,
    TResult Function()? bombThrowed,
    TResult Function()? endOfTurn,
    required TResult orElse(),
  }) {
    if (pionMoved != null) {
      return pionMoved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_WaitForTurn value) waitForTurn,
    required TResult Function(_OnTurn value) onTurn,
    required TResult Function(_RollDice value) diceRolled,
    required TResult Function(_PionChosen value) pionChosen,
    required TResult Function(_StrategyChosen value) strategyChosen,
    required TResult Function(_PionMoved value) pionMoved,
    required TResult Function(_BombThrowed value) bombThrowed,
    required TResult Function(_EndOfTurn value) endOfTurn,
  }) {
    return pionMoved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_WaitForTurn value)? waitForTurn,
    TResult Function(_OnTurn value)? onTurn,
    TResult Function(_RollDice value)? diceRolled,
    TResult Function(_PionChosen value)? pionChosen,
    TResult Function(_StrategyChosen value)? strategyChosen,
    TResult Function(_PionMoved value)? pionMoved,
    TResult Function(_BombThrowed value)? bombThrowed,
    TResult Function(_EndOfTurn value)? endOfTurn,
  }) {
    return pionMoved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_WaitForTurn value)? waitForTurn,
    TResult Function(_OnTurn value)? onTurn,
    TResult Function(_RollDice value)? diceRolled,
    TResult Function(_PionChosen value)? pionChosen,
    TResult Function(_StrategyChosen value)? strategyChosen,
    TResult Function(_PionMoved value)? pionMoved,
    TResult Function(_BombThrowed value)? bombThrowed,
    TResult Function(_EndOfTurn value)? endOfTurn,
    required TResult orElse(),
  }) {
    if (pionMoved != null) {
      return pionMoved(this);
    }
    return orElse();
  }
}

abstract class _PionMoved implements PlayerState {
  const factory _PionMoved() = _$_PionMoved;
}

/// @nodoc
abstract class _$BombThrowedCopyWith<$Res> {
  factory _$BombThrowedCopyWith(
          _BombThrowed value, $Res Function(_BombThrowed) then) =
      __$BombThrowedCopyWithImpl<$Res>;
}

/// @nodoc
class __$BombThrowedCopyWithImpl<$Res> extends _$PlayerStateCopyWithImpl<$Res>
    implements _$BombThrowedCopyWith<$Res> {
  __$BombThrowedCopyWithImpl(
      _BombThrowed _value, $Res Function(_BombThrowed) _then)
      : super(_value, (v) => _then(v as _BombThrowed));

  @override
  _BombThrowed get _value => super._value as _BombThrowed;
}

/// @nodoc

class _$_BombThrowed implements _BombThrowed {
  const _$_BombThrowed();

  @override
  String toString() {
    return 'PlayerState.bombThrowed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _BombThrowed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() waitForTurn,
    required TResult Function() onTurn,
    required TResult Function() diceRolled,
    required TResult Function() pionChosen,
    required TResult Function() strategyChosen,
    required TResult Function() pionMoved,
    required TResult Function() bombThrowed,
    required TResult Function() endOfTurn,
  }) {
    return bombThrowed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? waitForTurn,
    TResult Function()? onTurn,
    TResult Function()? diceRolled,
    TResult Function()? pionChosen,
    TResult Function()? strategyChosen,
    TResult Function()? pionMoved,
    TResult Function()? bombThrowed,
    TResult Function()? endOfTurn,
  }) {
    return bombThrowed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? waitForTurn,
    TResult Function()? onTurn,
    TResult Function()? diceRolled,
    TResult Function()? pionChosen,
    TResult Function()? strategyChosen,
    TResult Function()? pionMoved,
    TResult Function()? bombThrowed,
    TResult Function()? endOfTurn,
    required TResult orElse(),
  }) {
    if (bombThrowed != null) {
      return bombThrowed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_WaitForTurn value) waitForTurn,
    required TResult Function(_OnTurn value) onTurn,
    required TResult Function(_RollDice value) diceRolled,
    required TResult Function(_PionChosen value) pionChosen,
    required TResult Function(_StrategyChosen value) strategyChosen,
    required TResult Function(_PionMoved value) pionMoved,
    required TResult Function(_BombThrowed value) bombThrowed,
    required TResult Function(_EndOfTurn value) endOfTurn,
  }) {
    return bombThrowed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_WaitForTurn value)? waitForTurn,
    TResult Function(_OnTurn value)? onTurn,
    TResult Function(_RollDice value)? diceRolled,
    TResult Function(_PionChosen value)? pionChosen,
    TResult Function(_StrategyChosen value)? strategyChosen,
    TResult Function(_PionMoved value)? pionMoved,
    TResult Function(_BombThrowed value)? bombThrowed,
    TResult Function(_EndOfTurn value)? endOfTurn,
  }) {
    return bombThrowed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_WaitForTurn value)? waitForTurn,
    TResult Function(_OnTurn value)? onTurn,
    TResult Function(_RollDice value)? diceRolled,
    TResult Function(_PionChosen value)? pionChosen,
    TResult Function(_StrategyChosen value)? strategyChosen,
    TResult Function(_PionMoved value)? pionMoved,
    TResult Function(_BombThrowed value)? bombThrowed,
    TResult Function(_EndOfTurn value)? endOfTurn,
    required TResult orElse(),
  }) {
    if (bombThrowed != null) {
      return bombThrowed(this);
    }
    return orElse();
  }
}

abstract class _BombThrowed implements PlayerState {
  const factory _BombThrowed() = _$_BombThrowed;
}

/// @nodoc
abstract class _$EndOfTurnCopyWith<$Res> {
  factory _$EndOfTurnCopyWith(
          _EndOfTurn value, $Res Function(_EndOfTurn) then) =
      __$EndOfTurnCopyWithImpl<$Res>;
}

/// @nodoc
class __$EndOfTurnCopyWithImpl<$Res> extends _$PlayerStateCopyWithImpl<$Res>
    implements _$EndOfTurnCopyWith<$Res> {
  __$EndOfTurnCopyWithImpl(_EndOfTurn _value, $Res Function(_EndOfTurn) _then)
      : super(_value, (v) => _then(v as _EndOfTurn));

  @override
  _EndOfTurn get _value => super._value as _EndOfTurn;
}

/// @nodoc

class _$_EndOfTurn implements _EndOfTurn {
  const _$_EndOfTurn();

  @override
  String toString() {
    return 'PlayerState.endOfTurn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _EndOfTurn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() waitForTurn,
    required TResult Function() onTurn,
    required TResult Function() diceRolled,
    required TResult Function() pionChosen,
    required TResult Function() strategyChosen,
    required TResult Function() pionMoved,
    required TResult Function() bombThrowed,
    required TResult Function() endOfTurn,
  }) {
    return endOfTurn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? waitForTurn,
    TResult Function()? onTurn,
    TResult Function()? diceRolled,
    TResult Function()? pionChosen,
    TResult Function()? strategyChosen,
    TResult Function()? pionMoved,
    TResult Function()? bombThrowed,
    TResult Function()? endOfTurn,
  }) {
    return endOfTurn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? waitForTurn,
    TResult Function()? onTurn,
    TResult Function()? diceRolled,
    TResult Function()? pionChosen,
    TResult Function()? strategyChosen,
    TResult Function()? pionMoved,
    TResult Function()? bombThrowed,
    TResult Function()? endOfTurn,
    required TResult orElse(),
  }) {
    if (endOfTurn != null) {
      return endOfTurn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_WaitForTurn value) waitForTurn,
    required TResult Function(_OnTurn value) onTurn,
    required TResult Function(_RollDice value) diceRolled,
    required TResult Function(_PionChosen value) pionChosen,
    required TResult Function(_StrategyChosen value) strategyChosen,
    required TResult Function(_PionMoved value) pionMoved,
    required TResult Function(_BombThrowed value) bombThrowed,
    required TResult Function(_EndOfTurn value) endOfTurn,
  }) {
    return endOfTurn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_WaitForTurn value)? waitForTurn,
    TResult Function(_OnTurn value)? onTurn,
    TResult Function(_RollDice value)? diceRolled,
    TResult Function(_PionChosen value)? pionChosen,
    TResult Function(_StrategyChosen value)? strategyChosen,
    TResult Function(_PionMoved value)? pionMoved,
    TResult Function(_BombThrowed value)? bombThrowed,
    TResult Function(_EndOfTurn value)? endOfTurn,
  }) {
    return endOfTurn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_WaitForTurn value)? waitForTurn,
    TResult Function(_OnTurn value)? onTurn,
    TResult Function(_RollDice value)? diceRolled,
    TResult Function(_PionChosen value)? pionChosen,
    TResult Function(_StrategyChosen value)? strategyChosen,
    TResult Function(_PionMoved value)? pionMoved,
    TResult Function(_BombThrowed value)? bombThrowed,
    TResult Function(_EndOfTurn value)? endOfTurn,
    required TResult orElse(),
  }) {
    if (endOfTurn != null) {
      return endOfTurn(this);
    }
    return orElse();
  }
}

abstract class _EndOfTurn implements PlayerState {
  const factory _EndOfTurn() = _$_EndOfTurn;
}
