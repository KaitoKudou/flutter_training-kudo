// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_forecast_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WeatherForecastViewState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(WeatherData value) success,
    required TResult Function(String exceptionMessage) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(WeatherData value)? success,
    TResult? Function(String exceptionMessage)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(WeatherData value)? success,
    TResult Function(String exceptionMessage)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(WeatherForecastSuccessState value) success,
    required TResult Function(WeatherForecastFailureState value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(WeatherForecastSuccessState value)? success,
    TResult? Function(WeatherForecastFailureState value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(WeatherForecastSuccessState value)? success,
    TResult Function(WeatherForecastFailureState value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherForecastViewStateCopyWith<$Res> {
  factory $WeatherForecastViewStateCopyWith(WeatherForecastViewState value,
          $Res Function(WeatherForecastViewState) then) =
      _$WeatherForecastViewStateCopyWithImpl<$Res, WeatherForecastViewState>;
}

/// @nodoc
class _$WeatherForecastViewStateCopyWithImpl<$Res,
        $Val extends WeatherForecastViewState>
    implements $WeatherForecastViewStateCopyWith<$Res> {
  _$WeatherForecastViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$WeatherForecastViewStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'WeatherForecastViewState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(WeatherData value) success,
    required TResult Function(String exceptionMessage) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(WeatherData value)? success,
    TResult? Function(String exceptionMessage)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(WeatherData value)? success,
    TResult Function(String exceptionMessage)? failure,
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
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(WeatherForecastSuccessState value) success,
    required TResult Function(WeatherForecastFailureState value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(WeatherForecastSuccessState value)? success,
    TResult? Function(WeatherForecastFailureState value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(WeatherForecastSuccessState value)? success,
    TResult Function(WeatherForecastFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements WeatherForecastViewState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$WeatherForecastViewStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'WeatherForecastViewState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(WeatherData value) success,
    required TResult Function(String exceptionMessage) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(WeatherData value)? success,
    TResult? Function(String exceptionMessage)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(WeatherData value)? success,
    TResult Function(String exceptionMessage)? failure,
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
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(WeatherForecastSuccessState value) success,
    required TResult Function(WeatherForecastFailureState value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(WeatherForecastSuccessState value)? success,
    TResult? Function(WeatherForecastFailureState value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(WeatherForecastSuccessState value)? success,
    TResult Function(WeatherForecastFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements WeatherForecastViewState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$WeatherForecastSuccessStateImplCopyWith<$Res> {
  factory _$$WeatherForecastSuccessStateImplCopyWith(
          _$WeatherForecastSuccessStateImpl value,
          $Res Function(_$WeatherForecastSuccessStateImpl) then) =
      __$$WeatherForecastSuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({WeatherData value});

  $WeatherDataCopyWith<$Res> get value;
}

/// @nodoc
class __$$WeatherForecastSuccessStateImplCopyWithImpl<$Res>
    extends _$WeatherForecastViewStateCopyWithImpl<$Res,
        _$WeatherForecastSuccessStateImpl>
    implements _$$WeatherForecastSuccessStateImplCopyWith<$Res> {
  __$$WeatherForecastSuccessStateImplCopyWithImpl(
      _$WeatherForecastSuccessStateImpl _value,
      $Res Function(_$WeatherForecastSuccessStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$WeatherForecastSuccessStateImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as WeatherData,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $WeatherDataCopyWith<$Res> get value {
    return $WeatherDataCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc

class _$WeatherForecastSuccessStateImpl implements WeatherForecastSuccessState {
  const _$WeatherForecastSuccessStateImpl(this.value);

  @override
  final WeatherData value;

  @override
  String toString() {
    return 'WeatherForecastViewState.success(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherForecastSuccessStateImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherForecastSuccessStateImplCopyWith<_$WeatherForecastSuccessStateImpl>
      get copyWith => __$$WeatherForecastSuccessStateImplCopyWithImpl<
          _$WeatherForecastSuccessStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(WeatherData value) success,
    required TResult Function(String exceptionMessage) failure,
  }) {
    return success(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(WeatherData value)? success,
    TResult? Function(String exceptionMessage)? failure,
  }) {
    return success?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(WeatherData value)? success,
    TResult Function(String exceptionMessage)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(WeatherForecastSuccessState value) success,
    required TResult Function(WeatherForecastFailureState value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(WeatherForecastSuccessState value)? success,
    TResult? Function(WeatherForecastFailureState value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(WeatherForecastSuccessState value)? success,
    TResult Function(WeatherForecastFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class WeatherForecastSuccessState implements WeatherForecastViewState {
  const factory WeatherForecastSuccessState(final WeatherData value) =
      _$WeatherForecastSuccessStateImpl;

  WeatherData get value;
  @JsonKey(ignore: true)
  _$$WeatherForecastSuccessStateImplCopyWith<_$WeatherForecastSuccessStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WeatherForecastFailureStateImplCopyWith<$Res> {
  factory _$$WeatherForecastFailureStateImplCopyWith(
          _$WeatherForecastFailureStateImpl value,
          $Res Function(_$WeatherForecastFailureStateImpl) then) =
      __$$WeatherForecastFailureStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String exceptionMessage});
}

/// @nodoc
class __$$WeatherForecastFailureStateImplCopyWithImpl<$Res>
    extends _$WeatherForecastViewStateCopyWithImpl<$Res,
        _$WeatherForecastFailureStateImpl>
    implements _$$WeatherForecastFailureStateImplCopyWith<$Res> {
  __$$WeatherForecastFailureStateImplCopyWithImpl(
      _$WeatherForecastFailureStateImpl _value,
      $Res Function(_$WeatherForecastFailureStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exceptionMessage = null,
  }) {
    return _then(_$WeatherForecastFailureStateImpl(
      null == exceptionMessage
          ? _value.exceptionMessage
          : exceptionMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WeatherForecastFailureStateImpl implements WeatherForecastFailureState {
  const _$WeatherForecastFailureStateImpl(this.exceptionMessage);

  @override
  final String exceptionMessage;

  @override
  String toString() {
    return 'WeatherForecastViewState.failure(exceptionMessage: $exceptionMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherForecastFailureStateImpl &&
            (identical(other.exceptionMessage, exceptionMessage) ||
                other.exceptionMessage == exceptionMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exceptionMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherForecastFailureStateImplCopyWith<_$WeatherForecastFailureStateImpl>
      get copyWith => __$$WeatherForecastFailureStateImplCopyWithImpl<
          _$WeatherForecastFailureStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(WeatherData value) success,
    required TResult Function(String exceptionMessage) failure,
  }) {
    return failure(exceptionMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(WeatherData value)? success,
    TResult? Function(String exceptionMessage)? failure,
  }) {
    return failure?.call(exceptionMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(WeatherData value)? success,
    TResult Function(String exceptionMessage)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(exceptionMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(WeatherForecastSuccessState value) success,
    required TResult Function(WeatherForecastFailureState value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(WeatherForecastSuccessState value)? success,
    TResult? Function(WeatherForecastFailureState value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(WeatherForecastSuccessState value)? success,
    TResult Function(WeatherForecastFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class WeatherForecastFailureState implements WeatherForecastViewState {
  const factory WeatherForecastFailureState(final String exceptionMessage) =
      _$WeatherForecastFailureStateImpl;

  String get exceptionMessage;
  @JsonKey(ignore: true)
  _$$WeatherForecastFailureStateImplCopyWith<_$WeatherForecastFailureStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
