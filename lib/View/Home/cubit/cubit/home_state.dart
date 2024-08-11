part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}



class HomeMenuDrawerOpen extends HomeState {}

class HomeProfileDrawerOpen extends HomeState {}
