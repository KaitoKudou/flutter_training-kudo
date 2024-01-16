// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Result<S, E> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(S value) success,
    required TResult Function(E exceptionMessage) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(S value)? success,
    TResult? Function(E exceptionMessage)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(S value)? success,
    TResult Function(E exceptionMessage)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<S, E> value) success,
    required TResult Function(Failure<S, E> value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<S, E> value)? success,
    TResult? Function(Failure<S, E> value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<S, E> value)? success,
    TResult Function(Failure<S, E> value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<S, E, $Res> {
  factory $ResultCopyWith(
          Result<S, E> value, $Res Function(Result<S, E>) then) =
      _$ResultCopyWithImpl<S, E, $Res, Result<S, E>>;
}

/// @nodoc
class _$ResultCopyWithImpl<S, E, $Res, $Val extends Result<S, E>>
    implements $ResultCopyWith<S, E, $Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<S, E, $Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl<S, E> value, $Res Function(_$SuccessImpl<S, E>) then) =
      __$$SuccessImplCopyWithImpl<S, E, $Res>;
  @useResult
  $Res call({S value});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<S, E, $Res>
    extends _$ResultCopyWithImpl<S, E, $Res, _$SuccessImpl<S, E>>
    implements _$$SuccessImplCopyWith<S, E, $Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl<S, E> _value, $Res Function(_$SuccessImpl<S, E>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$SuccessImpl<S, E>(
      freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as S,
    ));
  }
}

/// @nodoc

class _$SuccessImpl<S, E> implements Success<S, E> {
  const _$SuccessImpl(this.value);

  @override
  final S value;

  @override
  String toString() {
    return 'Result<$S, $E>.success(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl<S, E> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<S, E, _$SuccessImpl<S, E>> get copyWith =>
      __$$SuccessImplCopyWithImpl<S, E, _$SuccessImpl<S, E>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(S value) success,
    required TResult Function(E exceptionMessage) failure,
  }) {
    return success(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(S value)? success,
    TResult? Function(E exceptionMessage)? failure,
  }) {
    return success?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(S value)? success,
    TResult Function(E exceptionMessage)? failure,
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
    required TResult Function(Success<S, E> value) success,
    required TResult Function(Failure<S, E> value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<S, E> value)? success,
    TResult? Function(Failure<S, E> value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<S, E> value)? success,
    TResult Function(Failure<S, E> value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success<S, E> implements Result<S, E> {
  const factory Success(final S value) = _$SuccessImpl<S, E>;

  S get value;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<S, E, _$SuccessImpl<S, E>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<S, E, $Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl<S, E> value, $Res Function(_$FailureImpl<S, E>) then) =
      __$$FailureImplCopyWithImpl<S, E, $Res>;
  @useResult
  $Res call({E exceptionMessage});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<S, E, $Res>
    extends _$ResultCopyWithImpl<S, E, $Res, _$FailureImpl<S, E>>
    implements _$$FailureImplCopyWith<S, E, $Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl<S, E> _value, $Res Function(_$FailureImpl<S, E>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exceptionMessage = freezed,
  }) {
    return _then(_$FailureImpl<S, E>(
      freezed == exceptionMessage
          ? _value.exceptionMessage
          : exceptionMessage // ignore: cast_nullable_to_non_nullable
              as E,
    ));
  }
}

/// @nodoc

class _$FailureImpl<S, E> implements Failure<S, E> {
  const _$FailureImpl(this.exceptionMessage);

  @override
  final E exceptionMessage;

  @override
  String toString() {
    return 'Result<$S, $E>.failure(exceptionMessage: $exceptionMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl<S, E> &&
            const DeepCollectionEquality()
                .equals(other.exceptionMessage, exceptionMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(exceptionMessage));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<S, E, _$FailureImpl<S, E>> get copyWith =>
      __$$FailureImplCopyWithImpl<S, E, _$FailureImpl<S, E>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(S value) success,
    required TResult Function(E exceptionMessage) failure,
  }) {
    return failure(exceptionMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(S value)? success,
    TResult? Function(E exceptionMessage)? failure,
  }) {
    return failure?.call(exceptionMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(S value)? success,
    TResult Function(E exceptionMessage)? failure,
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
    required TResult Function(Success<S, E> value) success,
    required TResult Function(Failure<S, E> value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<S, E> value)? success,
    TResult? Function(Failure<S, E> value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<S, E> value)? success,
    TResult Function(Failure<S, E> value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Failure<S, E> implements Result<S, E> {
  const factory Failure(final E exceptionMessage) = _$FailureImpl<S, E>;

  E get exceptionMessage;
  @JsonKey(ignore: true)
  _$$FailureImplCopyWith<S, E, _$FailureImpl<S, E>> get copyWith =>
      throw _privateConstructorUsedError;
}
