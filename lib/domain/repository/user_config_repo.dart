import 'package:flutter/material.dart';

import '../models/user_config.dart';

abstract class UserConfigRepo {
  
  /*
  Future<UserConfig> getUserConfig();

  Future<void> setUserConfig(UserConfig userConfig);

  Future<void> setLocale(String locale);

  Future<void> clearUserConfig(UserConfig userConfig);

  Future<void> clearLocale(String locale);
  */
  UserConfig getUserConfig();
  
  void setUserConfig(UserConfig userConfig);

  void setLocale(Locale? locale);

  void clearUserConfig();
  
  void clearLocale();
}

