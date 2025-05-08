import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/shared/todate_cubit.dart';
import '../../domain/models/todate.dart';
import '../../domain/repository/todate_repo.dart';
import 'todate_rootview.dart';
import 'app.dart';

class TodateProvider extends StatelessWidget {

  final TodateRepo todateRepo;

  const TodateProvider({
    super.key,
    required this.todateRepo,
  });


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodateCubit(todateRepo),
      child: const MyApp(),
    );
  }
}