import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'router.dart';
import '../../l10n/app_localizations.dart';
import '../pages/settings/settings.dart';

class ScaffoldWithBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Widget child;

  const ScaffoldWithBottomNavBar({
    super.key, 
    required this.currentIndex,
    required this.child
  });

  String pageLabel(String label, BuildContext context) {
    if(label == 'home') {
      return AppLocalizations.of(context)!.routerHome;
    }
    else if (label == 'history') {
      return AppLocalizations.of(context)!.routerHistory;
    }
    else {
      return "DEV:ERROR"; // DEBUG
    }
  }

  @override
  Widget build(BuildContext context) {
    String pageTitle = currentIndex == 0 ? 
      AppLocalizations.of(context)!.bottomNavbarHomeTitle : AppLocalizations.of(context)!.bottomNavbarHistoryTitle ;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          pageTitle,
          //style: Theme.of(context).textTheme.headlineLarge, 
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed:
              //context.go(AppRoutes.settings);
              () => showDialog(
                context: context,
                builder:
                  (BuildContext context) => Dialog.fullscreen(
                    insetAnimationDuration: Duration(milliseconds: 1000),
                    child: SettingsPage(),
                    
                  ),
              ),
            
          )
        ]
      ),
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        destinations: destinations.map(
          (dest) => NavigationDestination(
            icon: dest.icon, 
            // label: dest.label
            label: pageLabel(dest.label, context),
          )
        ).toList(),
        onDestinationSelected: (int index) {
          context.go(destinations[index].route);
        },
      ),
      floatingActionButton: currentIndex == 0 ? FloatingActionButton(
        onPressed: () {
          context.go('/${AppRoutes.add}');
        },
        child: const Icon(Icons.add),
      ) : null,
    );
  }
}
