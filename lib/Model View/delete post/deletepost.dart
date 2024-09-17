class deletepostModel {
  final String message;

  deletepostModel({required this.message});

  factory deletepostModel.fromJson(Map<String, dynamic> json) {
    return deletepostModel(
      message: json['message'],
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }
}
