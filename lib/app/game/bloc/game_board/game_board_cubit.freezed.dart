// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'game_board_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GameBoardStateTearOff {
  const _$GameBoardStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Loading loading() {
    return const _Loading();
  }

  _Error error() {
    return const _Error();
  }

  _SelectedTiles selectedTiles(int index) {
    return _SelectedTiles(
      index,
    );
  }

  _SelectedTileDest selectedTileDest(int index) {
    return _SelectedTileDest(
      index,
    );
  }

  _UpdateBoard updateBoard() {
    return const _UpdateBoard();
  }
}

/// @nodoc
const $GameBoardState = _$GameBoardStateTearOff();

/// @nodoc
mixin _$GameBoardState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(int index) selectedTiles,
    required TResult Function(int index) selectedTileDest,
    required TResult Function() updateBoard,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(int index)? selectedTiles,
    TResult Function(int index)? selectedTileDest,
    TResult Function()? updateBoard,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(int index)? selectedTiles,
    TResult Function(int index)? selectedTileDest,
    TResult Function()? updateBoard,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_SelectedTiles value) selectedTiles,
    required TResult Function(_SelectedTileDest value) selectedTileDest,
    required TResult Function(_UpdateBoard value) updateBoard,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_SelectedTiles value)? selectedTiles,
    TResult Function(_SelectedTileDest value)? selectedTileDest,
    TResult Function(_UpdateBoard value)? updateBoard,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_SelectedTiles value)? selectedTiles,
    TResult Function(_SelectedTileDest value)? selectedTileDest,
    TResult Function(_UpdateBoard value)? updateBoard,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameBoardStateCopyWith<$Res> {
  factory $GameBoardStateCopyWith(
          GameBoardState value, $Res Function(GameBoardState) then) =
      _$GameBoardStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$GameBoardStateCopyWithImpl<$Res>
    implements $GameBoardStateCopyWith<$Res> {
  _$GameBoardStateCopyWithImpl(this._value, this._then);

  final GameBoardState _value;
  // ignore: unused_field
  final $Res Function(GameBoardState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$GameBoardStateCopyWithImpl<$Res>
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
    return 'GameBoardState.initial()';
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
    required TResult Function() error,
    required TResult Function(int index) selectedTiles,
    required TResult Function(int index) selectedTileDest,
    required TResult Function() updateBoard,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(int index)? selectedTiles,
    TResult Function(int index)? selectedTileDest,
    TResult Function()? updateBoard,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(int index)? selectedTiles,
    TResult Function(int index)? selectedTileDest,
    TResult Function()? updateBoard,
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
    required TResult Function(_Error value) error,
    required TResult Function(_SelectedTiles value) selectedTiles,
    required TResult Function(_SelectedTileDest value) selectedTileDest,
    required TResult Function(_UpdateBoard value) updateBoard,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_SelectedTiles value)? selectedTiles,
    TResult Function(_SelectedTileDest value)? selectedTileDest,
    TResult Function(_UpdateBoard value)? updateBoard,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_SelectedTiles value)? selectedTiles,
    TResult Function(_SelectedTileDest value)? selectedTileDest,
    TResult Function(_UpdateBoard value)? updateBoard,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements GameBoardState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$GameBoardStateCopyWithImpl<$Res>
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
    return 'GameBoardState.loading()';
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
    required TResult Function() error,
    required TResult Function(int index) selectedTiles,
    required TResult Function(int index) selectedTileDest,
    required TResult Function() updateBoard,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(int index)? selectedTiles,
    TResult Function(int index)? selectedTileDest,
    TResult Function()? updateBoard,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(int index)? selectedTiles,
    TResult Function(int index)? selectedTileDest,
    TResult Function()? updateBoard,
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
    required TResult Function(_Error value) error,
    required TResult Function(_SelectedTiles value) selectedTiles,
    required TResult Function(_SelectedTileDest value) selectedTileDest,
    required TResult Function(_UpdateBoard value) updateBoard,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_SelectedTiles value)? selectedTiles,
    TResult Function(_SelectedTileDest value)? selectedTileDest,
    TResult Function(_UpdateBoard value)? updateBoard,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_SelectedTiles value)? selectedTiles,
    TResult Function(_SelectedTileDest value)? selectedTileDest,
    TResult Function(_UpdateBoard value)? updateBoard,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements GameBoardState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$GameBoardStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error();

  @override
  String toString() {
    return 'GameBoardState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Error);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(int index) selectedTiles,
    required TResult Function(int index) selectedTileDest,
    required TResult Function() updateBoard,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(int index)? selectedTiles,
    TResult Function(int index)? selectedTileDest,
    TResult Function()? updateBoard,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(int index)? selectedTiles,
    TResult Function(int index)? selectedTileDest,
    TResult Function()? updateBoard,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_SelectedTiles value) selectedTiles,
    required TResult Function(_SelectedTileDest value) selectedTileDest,
    required TResult Function(_UpdateBoard value) updateBoard,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_SelectedTiles value)? selectedTiles,
    TResult Function(_SelectedTileDest value)? selectedTileDest,
    TResult Function(_UpdateBoard value)? updateBoard,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_SelectedTiles value)? selectedTiles,
    TResult Function(_SelectedTileDest value)? selectedTileDest,
    TResult Function(_UpdateBoard value)? updateBoard,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements GameBoardState {
  const factory _Error() = _$_Error;
}

/// @nodoc
abstract class _$SelectedTilesCopyWith<$Res> {
  factory _$SelectedTilesCopyWith(
          _SelectedTiles value, $Res Function(_SelectedTiles) then) =
      __$SelectedTilesCopyWithImpl<$Res>;
  $Res call({int index});
}

/// @nodoc
class __$SelectedTilesCopyWithImpl<$Res>
    extends _$GameBoardStateCopyWithImpl<$Res>
    implements _$SelectedTilesCopyWith<$Res> {
  __$SelectedTilesCopyWithImpl(
      _SelectedTiles _value, $Res Function(_SelectedTiles) _then)
      : super(_value, (v) => _then(v as _SelectedTiles));

  @override
  _SelectedTiles get _value => super._value as _SelectedTiles;

  @override
  $Res call({
    Object? index = freezed,
  }) {
    return _then(_SelectedTiles(
      index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SelectedTiles implements _SelectedTiles {
  const _$_SelectedTiles(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'GameBoardState.selectedTiles(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SelectedTiles &&
            const DeepCollectionEquality().equals(other.index, index));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(index));

  @JsonKey(ignore: true)
  @override
  _$SelectedTilesCopyWith<_SelectedTiles> get copyWith =>
      __$SelectedTilesCopyWithImpl<_SelectedTiles>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(int index) selectedTiles,
    required TResult Function(int index) selectedTileDest,
    required TResult Function() updateBoard,
  }) {
    return selectedTiles(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(int index)? selectedTiles,
    TResult Function(int index)? selectedTileDest,
    TResult Function()? updateBoard,
  }) {
    return selectedTiles?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(int index)? selectedTiles,
    TResult Function(int index)? selectedTileDest,
    TResult Function()? updateBoard,
    required TResult orElse(),
  }) {
    if (selectedTiles != null) {
      return selectedTiles(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_SelectedTiles value) selectedTiles,
    required TResult Function(_SelectedTileDest value) selectedTileDest,
    required TResult Function(_UpdateBoard value) updateBoard,
  }) {
    return selectedTiles(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_SelectedTiles value)? selectedTiles,
    TResult Function(_SelectedTileDest value)? selectedTileDest,
    TResult Function(_UpdateBoard value)? updateBoard,
  }) {
    return selectedTiles?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_SelectedTiles value)? selectedTiles,
    TResult Function(_SelectedTileDest value)? selectedTileDest,
    TResult Function(_UpdateBoard value)? updateBoard,
    required TResult orElse(),
  }) {
    if (selectedTiles != null) {
      return selectedTiles(this);
    }
    return orElse();
  }
}

abstract class _SelectedTiles implements GameBoardState {
  const factory _SelectedTiles(int index) = _$_SelectedTiles;

  int get index;
  @JsonKey(ignore: true)
  _$SelectedTilesCopyWith<_SelectedTiles> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SelectedTileDestCopyWith<$Res> {
  factory _$SelectedTileDestCopyWith(
          _SelectedTileDest value, $Res Function(_SelectedTileDest) then) =
      __$SelectedTileDestCopyWithImpl<$Res>;
  $Res call({int index});
}

/// @nodoc
class __$SelectedTileDestCopyWithImpl<$Res>
    extends _$GameBoardStateCopyWithImpl<$Res>
    implements _$SelectedTileDestCopyWith<$Res> {
  __$SelectedTileDestCopyWithImpl(
      _SelectedTileDest _value, $Res Function(_SelectedTileDest) _then)
      : super(_value, (v) => _then(v as _SelectedTileDest));

  @override
  _SelectedTileDest get _value => super._value as _SelectedTileDest;

  @override
  $Res call({
    Object? index = freezed,
  }) {
    return _then(_SelectedTileDest(
      index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SelectedTileDest implements _SelectedTileDest {
  const _$_SelectedTileDest(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'GameBoardState.selectedTileDest(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SelectedTileDest &&
            const DeepCollectionEquality().equals(other.index, index));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(index));

  @JsonKey(ignore: true)
  @override
  _$SelectedTileDestCopyWith<_SelectedTileDest> get copyWith =>
      __$SelectedTileDestCopyWithImpl<_SelectedTileDest>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(int index) selectedTiles,
    required TResult Function(int index) selectedTileDest,
    required TResult Function() updateBoard,
  }) {
    return selectedTileDest(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(int index)? selectedTiles,
    TResult Function(int index)? selectedTileDest,
    TResult Function()? updateBoard,
  }) {
    return selectedTileDest?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(int index)? selectedTiles,
    TResult Function(int index)? selectedTileDest,
    TResult Function()? updateBoard,
    required TResult orElse(),
  }) {
    if (selectedTileDest != null) {
      return selectedTileDest(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_SelectedTiles value) selectedTiles,
    required TResult Function(_SelectedTileDest value) selectedTileDest,
    required TResult Function(_UpdateBoard value) updateBoard,
  }) {
    return selectedTileDest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_SelectedTiles value)? selectedTiles,
    TResult Function(_SelectedTileDest value)? selectedTileDest,
    TResult Function(_UpdateBoard value)? updateBoard,
  }) {
    return selectedTileDest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_SelectedTiles value)? selectedTiles,
    TResult Function(_SelectedTileDest value)? selectedTileDest,
    TResult Function(_UpdateBoard value)? updateBoard,
    required TResult orElse(),
  }) {
    if (selectedTileDest != null) {
      return selectedTileDest(this);
    }
    return orElse();
  }
}

abstract class _SelectedTileDest implements GameBoardState {
  const factory _SelectedTileDest(int index) = _$_SelectedTileDest;

  int get index;
  @JsonKey(ignore: true)
  _$SelectedTileDestCopyWith<_SelectedTileDest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UpdateBoardCopyWith<$Res> {
  factory _$UpdateBoardCopyWith(
          _UpdateBoard value, $Res Function(_UpdateBoard) then) =
      __$UpdateBoardCopyWithImpl<$Res>;
}

/// @nodoc
class __$UpdateBoardCopyWithImpl<$Res>
    extends _$GameBoardStateCopyWithImpl<$Res>
    implements _$UpdateBoardCopyWith<$Res> {
  __$UpdateBoardCopyWithImpl(
      _UpdateBoard _value, $Res Function(_UpdateBoard) _then)
      : super(_value, (v) => _then(v as _UpdateBoard));

  @override
  _UpdateBoard get _value => super._value as _UpdateBoard;
}

/// @nodoc

class _$_UpdateBoard implements _UpdateBoard {
  const _$_UpdateBoard();

  @override
  String toString() {
    return 'GameBoardState.updateBoard()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _UpdateBoard);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(int index) selectedTiles,
    required TResult Function(int index) selectedTileDest,
    required TResult Function() updateBoard,
  }) {
    return updateBoard();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(int index)? selectedTiles,
    TResult Function(int index)? selectedTileDest,
    TResult Function()? updateBoard,
  }) {
    return updateBoard?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(int index)? selectedTiles,
    TResult Function(int index)? selectedTileDest,
    TResult Function()? updateBoard,
    required TResult orElse(),
  }) {
    if (updateBoard != null) {
      return updateBoard();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_SelectedTiles value) selectedTiles,
    required TResult Function(_SelectedTileDest value) selectedTileDest,
    required TResult Function(_UpdateBoard value) updateBoard,
  }) {
    return updateBoard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_SelectedTiles value)? selectedTiles,
    TResult Function(_SelectedTileDest value)? selectedTileDest,
    TResult Function(_UpdateBoard value)? updateBoard,
  }) {
    return updateBoard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_SelectedTiles value)? selectedTiles,
    TResult Function(_SelectedTileDest value)? selectedTileDest,
    TResult Function(_UpdateBoard value)? updateBoard,
    required TResult orElse(),
  }) {
    if (updateBoard != null) {
      return updateBoard(this);
    }
    return orElse();
  }
}

abstract class _UpdateBoard implements GameBoardState {
  const factory _UpdateBoard() = _$_UpdateBoard;
}
