part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}



class HomeMenuDrawerOpen extends HomeState {}

class HomeProfileDrawerOpen extends HomeState {}




class LogoutLoading extends HomeState {}

class LogoutSuccess extends HomeState {}

class LogoutFailure extends HomeState {
  final String errMessage;
  LogoutFailure({required this.errMessage});
}
