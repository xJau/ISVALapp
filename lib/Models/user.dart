import 'package:isval_test/Models/customer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'JSON/user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'authenticationToken')
  final String authenticationToken;
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'firstName')
  final String firstName;
  @JsonKey(name: 'lastName')
  final String lastName;
  @JsonKey(name: 'userName')
  final String userName;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'roleName')
  final String role;
  @JsonKey(name: 'customers')
  final List<Customer> customers;

  User(
      {required this.authenticationToken,
      required this.id,
      required this.firstName,
      required this.lastName,
      required this.userName,
      required this.email,
      required this.role,
      required this.customers});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  static User nullUser() => User(
      authenticationToken: '',
      id: '',
      firstName: '',
      userName: '',
      lastName: '',
      email: '',
      role: '',
      customers: []);
}
