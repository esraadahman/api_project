part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}



final class SignUpSuccess extends SignupState {
  final String message;

  SignUpSuccess({required this.message});
}

final class SignUpLoading extends SignupState {}

final class SignUpFailure extends SignupState {
  final String errMessage;

  SignUpFailure({required this.errMessage});
}
