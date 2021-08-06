import 'package:isval_test/Interfaces/i_record_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'JSON/user.g.dart';

@JsonSerializable()
class User implements IRecord {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'firstName')
  String firstName;
  @JsonKey(name: 'lastName')
  String lastName;
  @JsonKey(name: 'username')
  String username;
  @JsonKey(name: 'email')
  String email;

  User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.username,
      required this.email});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  Map<String, String> getAttributes() {
    return {
      "id": this.id,
      "firstName": this.firstName,
      "lastName": this.lastName,
      "username": this.username,
      "email": this.email,
    };
  }

  @override
  String getRecordName() {
    return username;
  }

  static User nullUser() =>
      User(id: '', firstName: '', username: '', lastName: '', email: '');
}
