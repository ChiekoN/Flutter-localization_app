import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../shared/router.dart';
import '../../../domain/models/todate.dart';
import '../../shared/todate_cubit.dart';
import '../../shared/user_config_cubit.dart';

import '../../../l10n/app_localizations.dart';


class HistoryListPage extends StatelessWidget {
  const HistoryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodateCubit, List<Todate>>(
      builder: (context, todates) {
        // Filter to show only future dates including today 
        DateTime now = DateTime.now();
        DateTime today = DateTime(now.year, now.month, now.day);
        List<Todate> futureTodates = todates.where(
          (todate) => todate.date.isBefore(today)
        ).toList();

        if(futureTodates.isEmpty) {
          return Padding( 
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.historyListEmpty,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          );
        }
        return ListView.builder(  
          itemCount: futureTodates.length,
          itemBuilder: (context, index) {
            final item = futureTodates[index];
            // To get current locale's DateFormat, this gets state watcher for UserConfig
            //  and the locale in State is passed to DateFormat later in Dismissible.
            // First I tried cascading BlocBuilders for UserConfig and Todate and used ARB,
            //  but it sometimes didin't work well.
            // This solution worked well and was more stable.
            final userConfigState = context.watch<UserConfigCubit>().state;

            return Dismissible(
              key: ValueKey<Todate>(item),
              direction: DismissDirection.endToStart, // Only allow to swipe right-to-left
              dismissThresholds: {
                DismissDirection.endToStart: 0.3,
              },
              onDismissed: (direction) {                
                context.read<TodateCubit>().deleteTodate(item);
                ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('${item.title} dismissed')));
              },
              background: Container(
                color: Colors.red,
                child: Icon(Icons.delete, color: Colors.white),
              ),
              child: ListTile(
                leading: Icon(
                    Icons.history,
                  ),
                title: Text(item.title,
                  style: Theme.of(context).textTheme.titleMedium,         
                ),
                subtitle: Text(
                  item.getDateWeekStringShort(userConfigState.locale),
                ),
                onTap:() {
                  context.go('${AppRoutes.history}/${AppRoutes.historyDetail}/${item.id}');
                }
              ),
            );
          }
        );
      }
    );
  }
}