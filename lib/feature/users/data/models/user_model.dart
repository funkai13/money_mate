import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entity/app_user.dart';

class UserModel extends AppUser {
  UserModel({
    required super.firstName,
    required super.lastName,
    required super.age,
    required super.email,
  });

  factory UserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserModel(
      firstName: data?['first_name'],
      lastName: data?['last_name'],
      age: data?['age'],
      email: data?['email'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "age": age,
      "email": email,
    };
  }
}
