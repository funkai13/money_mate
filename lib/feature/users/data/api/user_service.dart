import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:money_mate/feature/users/data/models/user_model.dart';
import 'package:money_mate/feature/users/domain/entity/app_user.dart';
import 'package:money_mate/feature/users/domain/repositories/user_repository.dart';

class UserService implements UserRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;
  UserService(this._firestore, this._firebaseAuth);
  @override
  Future<AppUser> createUser({
    required String firstName,
    required String lastName,
    required double age,
    required String? email,
  }) async {
    String uid = _firebaseAuth.currentUser!.uid;
    String? email = _firebaseAuth.currentUser!.email;
    UserModel userModel = UserModel(
      firstName: firstName,
      lastName: lastName,
      age: age,
      email: email,
    );
    try {
      await _firestore
          .collection('users')
          .doc(uid)
          .set(userModel.toFirestore());
      DocumentReference financesRef = _firestore
          .collection('users')
          .doc(uid)
          .collection('finances')
          .doc(uid);
      await financesRef.set({
        'creation_date': FieldValue.serverTimestamp(),
      });

      DocumentReference accountsRef = financesRef.collection('accounts').doc();
      await accountsRef.set({
        'creation_date': FieldValue.serverTimestamp(),
        'title': 'my account',
        'balance': 0.0,
        'update_date': FieldValue.serverTimestamp(),
      });
      await accountsRef
          .collection('incomes')
          .doc()
          .set({'creation_date': FieldValue.serverTimestamp()});
      await accountsRef
          .collection('expenses')
          .doc()
          .set({'creation_date': FieldValue.serverTimestamp()});

      return AppUser(
          firstName: firstName, lastName: lastName, email: email, age: age);
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
