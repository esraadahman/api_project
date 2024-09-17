part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class UploadProfilePic extends ProfileState {}

final class GetuserSuccess extends ProfileState {
  final Map<String , dynamic> data;

  GetuserSuccess({required this.data});
}



final class GetUserLoading extends ProfileState {}

final class GetUserFailure extends ProfileState {
  final String errMessage;

  GetUserFailure({required this.errMessage});
}


class ProfileToggleState extends ProfileState {}



final class updateuserdataSuccess extends ProfileState {
  final ProfileModel data;

  updateuserdataSuccess({required this.data});
}



final class updateuserdataLoading extends ProfileState {}

final class updateuserdataFailure extends ProfileState {
  final String errMessage;

  updateuserdataFailure({required this.errMessage});
}
