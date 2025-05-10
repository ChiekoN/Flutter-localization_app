import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/shared/todate_cubit.dart';
import '../../domain/models/todate.dart';
import '../../domain/repository/todate_repo.dart';
import '../../domain/repository/user_config_repo.dart';
import 'todate_rootview.dart';
import 'user_config_cubit.dart';
import 'app.dart';

class TodateProvider extends StatelessWidget {

  final TodateRepo todateRepo;
  final UserConfigRepo userConfigRepo;

  const TodateProvider({
    super.key,
    required this.todateRepo,
    required this.userConfigRepo,
  });


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodateCubit>(
          create: (context) => TodateCubit(todateRepo),
        ),
        BlocProvider<UserConfigCubit>(
          create: (context) => UserConfigCubit(userConfigRepo),
        ),
      ],
      child: const MyApp(),
    );
  }
}