import 'dart:convert';

class UserModel {
  final String userName;
  final String emailAddress;
  final String uid;

  UserModel({
    required this.userName,
    required this.emailAddress,
    required this.uid,
  });

 Map<String,dynamic> modelToJson() =>
      {'userName': userName, 'emailAddress': emailAddress, 'uid': uid};
}
