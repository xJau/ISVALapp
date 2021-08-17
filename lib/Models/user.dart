import 'package:isval_test/Models/customer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'JSON/user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'authenticationToken')
  final String authToken;
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'firstName')
  final String firstName;
  @JsonKey(name: 'lastName')
  final String lastName;
  @JsonKey(name: 'userName')
  final String username;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'roleName')
  final String role;
  @JsonKey(name: 'customers')
  final List<Customer> customers;

  User(
      {required this.authToken,
      required this.id,
      required this.firstName,
      required this.lastName,
      required this.username,
      required this.email,
      required this.role,
      required this.customers});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  static User nullUser() => User(
      authToken: '',
      id: '',
      firstName: '',
      username: '',
      lastName: '',
      email: '',
      role: '',
      customers: []);
}
