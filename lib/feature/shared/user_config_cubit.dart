import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/user_config.dart';
import '../../domain/repository/user_config_repo.dart';

class UserConfigCubit extends Cubit<UserConfig>{

  final UserConfigRepo userConfigRepo;

  UserConfigCubit(this.userConfigRepo) : super(UserConfig()) {
    loadUserConfig();
  }

  // Load
  void loadUserConfig() {
    emit(userConfigRepo.getUserConfig());
  }

  // Update Locale
  void updateLocale(Locale? newLocale) {
    userConfigRepo.setLocale(newLocale);
    loadUserConfig();
  }

  // Reset Locale to system
  void clearLocale() {
    userConfigRepo.clearLocale();
    loadUserConfig();
  }

}
