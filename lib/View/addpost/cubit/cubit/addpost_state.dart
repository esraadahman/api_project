part of 'addpost_cubit.dart';

@immutable
sealed class AddpostState {}

final class AddpostInitial extends AddpostState {}



final class NotAddPost extends AddpostState {}


final class AddPostdata extends AddpostState {}
