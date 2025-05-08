import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/todate.dart';
import '../../domain/repository/todate_repo.dart';

class TodateCubit extends Cubit<List<Todate>>{

  final TodateRepo todateRepo;

  TodateCubit(this.todateRepo) : super([]) {
    loadTodates();
  }

  // Load
  Future<void> loadTodates() async {
    final List<Todate> todateList = await todateRepo.getTodates();
    // DEBUG
    print("--- Dump start ---");
    for(var item in todateList) {
      print("${item.id}, ${item.date}, ${item.title}, ${item.memo}");
    }
    print("--- Dump end ---");
    // End of DEBUG
    emit(todateList);
  }

  // Add
  Future<void> addTodate(Todate newTodate) async {
    await todateRepo.addTodate(newTodate);
    await loadTodates();
  }

  // Update
  Future<void> updateTodate(Todate newTodate) async {
    await todateRepo.updateTodate(newTodate);
    await loadTodates();
  }

  // Delete
  Future<void> deleteTodate(Todate deletedTodate) async {
    await todateRepo.deleteTodate(deletedTodate);
    await loadTodates();
  }
}