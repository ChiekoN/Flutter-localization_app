import 'package:flutter/material.dart';

import '../../../domain/models/todate.dart';

class DateArea extends StatelessWidget {
  const DateArea({super.key, required this.todate});

  final Todate todate;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          // Title
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
            child: Text(
              todate.title,
              style: Theme.of(context).textTheme.displaySmall,
              textAlign: TextAlign.center,
            ),
          ),
          // Date
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 32),
            child: Text(
              todate.dateString,
              style: Theme.of(context).textTheme.titleLarge!.apply(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
      ],
    );
  }
}