import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_mate/feature/Transactions/data/services/income_service.dart';
import 'package:money_mate/feature/Transactions/domain/repositories/income_repository.dart';

final incomeServiceProvider = Provider<IncomeRepository>(
    (_) => IncomeService(FirebaseFirestore.instance));

final selectedAccountProvider = StateProvider<String?>((ref) => null);
final selectedCategoryProvider = StateProvider<String?>((ref) => null);
final selectedLabelProvider = StateProvider<String?>((ref) => null);
final selectedNoteProvider = StateProvider<String?>((ref) => null);
final selectedStatusProvider = StateProvider<String?>((ref) => null);
