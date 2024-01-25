part of 'reg_bloc.dart';

@freezed
class RegState with _$RegState {
  const factory RegState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
  }) = _RegState;

  const RegState._();
}
