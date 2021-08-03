class LoginResponseModel {
  final String token;
  final String error;

  LoginResponseModel({required this.token,required this.error});

  factory LoginResponseModel.fromJson(Map<String,dynamic> json){ 
    return LoginResponseModel(token: json["authenticationToken"] != null ? json["error"] : "", error: json["error"] != null ? json["error"] : "");
  }
}

class LoginRequestModel {
  String username;
  String password;

LoginRequestModel({required this.username, required this.password});

  Map<String, String> toJson() {
    Map<String, String> map = {
      'username': "'${username.trim()}'",
      'password': "'${password.trim()}'"
    };
    return map;
  }

}
