import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:project_api2/Model%20View/userposts/userpostsmodel.dart';
import 'package:project_api2/repositories/user_repository.dart';
import 'package:path/path.dart' as path;
part 'userpost_state.dart';

class UserpostCubit extends Cubit<UserpostState> {
  UserpostCubit(this.userrepo2) : super(UserpostInitial());


  final userRepo userrepo2;

  Future<void> getaUserPosts() async {
    emit(GetPostsLoading());
    final data = await userrepo2.getUserPosts();
    data.fold((errormessage) {
      emit(GetPostsFailure(errMessage: errormessage));
    }, (posts) {
      emit(GetPostsSuccess(Profile: posts));
    });
  }



    String filename = "";

  void getname_of_image(String fullPath) {
    //print(fullPath);
    //  String fullPath = "/storage/uploads/1723429015.jpg";
    filename = path.basename(fullPath);
    //  print(filename);
    //return filename;
    // Output: 1723429015.jpg
  }

  String formatDateTime(String isoDate) {
    // Parse the ISO date string to a DateTime object
    DateTime dateTime = DateTime.parse(isoDate);

    // Define formats for date and time separately
    final DateFormat dateFormatter = DateFormat('yyyy-MM-dd');
    final DateFormat timeFormatter = DateFormat('HH:mm:ss');

    // Format the DateTime object to strings
    String formattedDate = dateFormatter.format(dateTime);
    String formattedTime = timeFormatter.format(dateTime);

    // Return formatted date and time with newline character
    return '$formattedDate\n$formattedTime';
  }
}
