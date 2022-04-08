import 'package:json_annotation/json_annotation.dart';

part 'appuser.g.dart';

// ignore: deprecated_member_use
@JsonSerializable(nullable: false)
class AppUser {
  String? firstName;
  String? lastName;
  String? fullName;
  String? status;
  String? id;
  String? email;
  bool? isEmailVerified = false;
  String? dob;
  String? profilePicture;





  AppUser(
      {

      this.firstName,
      this.lastName,
      this.fullName,
      this.id,
      this.email,
      this.isEmailVerified,
      this.dob,
      this.profilePicture,
});

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
  Map<String, dynamic> toJson() => _$AppUserToJson(this);
}
