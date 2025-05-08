import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'router.dart';
import 'todate_provider.dart';
import 'todate_cubit.dart';
import '../../domain/models/todate.dart';

class Rootview extends StatelessWidget {
  const Rootview({
    super.key,
    required this.child,
    this.currentIndex,
  });

  final Widget child;
  final int? currentIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodateCubit, List<Todate>>(
      builder: (context, todateList) {
        return child;
      }
    );
  }
}