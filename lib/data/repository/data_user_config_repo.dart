import 'package:flutter/material.dart';

import '../../domain/models/user_config.dart';
import '../../domain/repository/user_config_repo.dart';

class UserConfigRepoData implements UserConfigRepo {

  UserConfig config = UserConfig();

  @override
  UserConfig getUserConfig() {
    return config;
  }

  @override
  void setUserConfig(UserConfig userConfig) {
    config = config.copyWith();
  }

  @override
  void setLocale(Locale? locale) {
    if (locale == null) { // system default
      clearLocale();
    } else {
      config = config.copyWith(locale:locale);
    }
    print("in updateLocale : $config");
  }

  @override
  void clearUserConfig() {
    config = UserConfig();
  }

  @override
  void clearLocale() {
    config = config.copyWith(localeNull: true);
  }

}