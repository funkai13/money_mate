import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_mate/feature/balance/data/services/balance_service.dart';
import 'package:money_mate/feature/balance/domain/repositories/balance_repository.dart';

final balanceServiceProvider = Provider<BalanceRepository>(
    (_) => BalanceService(FirebaseFirestore.instance, FirebaseAuth.instance));
