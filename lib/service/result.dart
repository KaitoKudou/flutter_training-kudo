import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<S, E> with _$Result<S, E> {
  const factory Result.success(S value) = Success<S, E>;
  const factory Result.failure(E exceptionMessage) = Failure<S, E>;
}
