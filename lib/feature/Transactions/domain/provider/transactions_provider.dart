import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_mate/feature/Transactions/data/services/income_service.dart';
import 'package:money_mate/feature/Transactions/domain/repositories/income_repository.dart';

final incomeServiceProvider = Provider<IncomeRepository>(
    (_) => IncomeService(FirebaseFirestore.instance));
