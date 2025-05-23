import 'package:flutter/material.dart';

import '../models/user_config.dart';

abstract class UserConfigRepo {
  
  UserConfig getUserConfig();
  
  void setUserConfig(UserConfig userConfig);

  void setLocale(Locale? locale);

  void clearUserConfig();
  
  void clearLocale();
}

