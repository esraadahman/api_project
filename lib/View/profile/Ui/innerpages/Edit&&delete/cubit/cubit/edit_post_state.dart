part of 'edit_post_cubit.dart';

@immutable
sealed class EditPostState {}

final class EditPostInitial extends EditPostState {}

final class getdatafordeleteSuccess extends EditPostState {}

final class getdatafordeleteloading extends EditPostState {}

final class getdatafordeletefail extends EditPostState {}

final class deletepostloadding extends EditPostState {}

final class deletepostfail extends EditPostState {
final String errormessage;

  deletepostfail({required this.errormessage});

}

final class deletepostSuccess extends EditPostState {
  final deletepostModel data;

  deletepostSuccess({required this.data});
}


final class editpostloadding extends EditPostState {}

final class editpostfail extends EditPostState {
  final String errormessage;

  editpostfail({required this.errormessage});
}

final class editpostSuccess extends EditPostState {
  final Editpost data;

  editpostSuccess({required this.data});
}
