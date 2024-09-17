class EndPoint {
  static String baseUrl = "http://10.0.2.2:8000/api/";
//static String baseUrl = "http://127.0.0.1:8000/api/";
  static String signin = "login?=";
  static String signup = "register";
  static String deletpost(int id) {
    return "blogs/$id";
  }

  static String imagepath =
      "http://10.0.2.2/blog-api-project-main/storage/app/public/uploads/";
  static String getUserPosts = "myblogs";
  static String logout = "logout";
  static String getallPosts = "blogs";
  static String createPost = "blogs";

    static String updateUserInfo(int id) {
    return "user/$id";
  }


    static String updateUserPosts(int id_post) {
    return "blogs/update/$id_post";
  }
}

class ApiKey {
  static String status = "status";
  static String message = "message";

  //sign up
  static String user = "user";
  static String id = "id";
  static String first_name = "first_name";
  static String last_name = "last_name";
  static String email = "email";
  static String job_title = "job_title"; //null
  static String created_at = "created_at"; // null
  static String password = "password";
  static String password_confirmation = "password_confirmation";
  static String updated_at = "updated_at"; //null
  static String token = "token";

//login

  static String email_verified_at = "email_verified_at";

  static String image = "image";
  static String image_path = "image_path";

// add post
  static String content = "content";

// user info

  static String phone = "phone";
  //static String confirmPassword = "confirmPassword";
  static String location = "location";
  static String profilePic = "profilePic";

  //get all posts
  static String data = "data";
  static String title = "title";
  static String description = "description";
  static String user_id = "user_id";
}
