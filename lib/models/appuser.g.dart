// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appuser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  return AppUser(
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
    fullName: json['fullName'] as String?,
    id: json['id'] as String?,
    email: json['email'] as String?,
    isEmailVerified: json['isEmailVerified'] as bool?,
    dob: json['dob'] as String?,
    profilePicture: json['profilePicture'] as String?,
  );
}

Map<String, dynamic> _$AppUserToJson(AppUser instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'fullName': instance.fullName,
      'id': instance.id,
      'email': instance.email,
      'isEmailVerified': instance.isEmailVerified,
      'dob': instance.dob,
      'profilePicture': instance.profilePicture,
    };
