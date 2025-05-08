import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';

import '../../shared/router.dart';
import '../../shared/todate_cubit.dart';
import '../../../domain/models/todate.dart';
import 'memo_area.dart';
import 'date_area.dart';


class DateDetailPage extends StatelessWidget {
  final String? id;
  const DateDetailPage({this.id, super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodateCubit, List<Todate>>(
      builder: (context, todates) {
        Todate? item = todates.firstWhereOrNull(
          (todate) => todate.id == id, 
        );
        List<Widget> children = [
          Text(
            "INTERNAL ERROR: Date not found for $id.}",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ];
        if(item != null) {
          children = [
            // Date info
            DateArea(todate: item),
            // Memo
            MemoArea(memoText: item.memo),
          ];
        }
        return Scaffold(
          appBar: AppBar(),
          body: SizedBox(
            //width: double.infinity,
            child:
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: children,
                ),
              ),
            ),
          );
      }
    );
  }
}
