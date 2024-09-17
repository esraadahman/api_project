part of 'userpost_cubit.dart';

@immutable
sealed class UserpostState {}

final class UserpostInitial extends UserpostState {}
class GetPostsSuccess extends UserpostState {
final  UserPostModel Profile;
  GetPostsSuccess({required this.Profile});
}

class GetPostsLoading extends UserpostState {}

class GetPostsFailure extends UserpostState {
  final String errMessage;
  GetPostsFailure({required this.errMessage});
}
