import 'package:json_annotation/json_annotation.dart';

part 'JSON/login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  @JsonKey(name: 'authenticationToken')
  final String token;

  LoginResponseModel({required this.token});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
        token: json["authenticationToken"] != null
            ? json["authenticationToken"]
            : "");
  }
}
