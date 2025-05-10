import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class UserConfig extends Equatable {
  const UserConfig({ 
    this.locale,
  }) ;

  final Locale? locale;

  @override
  List<Object?> get props => [locale];

  UserConfig copyWith({
    Locale? locale,
    bool localeNull = false, 
  }) {
    if (localeNull) {
      return UserConfig(
        locale: null,
      );
    }
    return UserConfig(
      locale: locale ?? this.locale,
    );
  }
}
