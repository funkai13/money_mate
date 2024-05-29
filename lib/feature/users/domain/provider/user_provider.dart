import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/api/user_service.dart';
import '../repositories/user_repository.dart';

final userServiceProvider = Provider<UserRepository>(
    (_) => UserService(FirebaseFirestore.instance, FirebaseAuth.instance));
