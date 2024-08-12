class EndPoint {
  static String baseUrl = "http://10.0.2.2:8000/api/";
//static String baseUrl = "http://127.0.0.1:8000/api/";
  static String signin = "login?=";
  static String signup = "register";
  static String getuserDataEndPoint(String id) {
    print("enter method");
    return "ENDPOINT/$id";
  }

  static String logout = "logout";
  static String getallPosts = "posts";
  static String createPost = "blogs";
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

// add post
  static String content = "content";

// user info

  static String phone = "phone";
  //static String confirmPassword = "confirmPassword";
  static String location = "location";
  static String profilePic = "profilePic";

  //get all posts
  static String title = "title";
  static String description = "description";
  static String user_id = "user_id";
}
