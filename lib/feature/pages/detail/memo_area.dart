import 'package:flutter/material.dart';

class MemoArea extends StatelessWidget {
  const MemoArea({super.key, this.memoText});

  final String? memoText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 32, 16, 0),
      //margin: EdgeInsets.all(24.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
            child: Text(
              "Memo",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Container(
            //color: Colors.grey[500],
            padding: EdgeInsets.all(8.0),
            width: double.infinity,
            constraints: BoxConstraints(
              minHeight: Theme.of(context).textTheme.bodyLarge!.fontSize! * 5 + 16.0,
            ),
            decoration: BoxDecoration(
              //color: Theme.of(context).hoverColor,
              border: Border.all(
                color: Colors.grey[400]!,
              ),
            ),
            child: Text(
              memoText ?? "",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}