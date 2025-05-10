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
    setLocale(userConfig.locale);
  }

  @override
  void setLocale(Locale? locale) {
    config.locale = locale;
  }

  @override
  void clearUserConfig() {
    clearLocale();
  }

  @override
  void clearLocale() {
    config.locale = null;
  }

}