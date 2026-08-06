import 'package:flutter/material.dart';

class TaskCountByStatus extends StatelessWidget {
  final int count;
  final String title;
  const TaskCountByStatus({
    super.key, required this.count, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
        child: Column(
          children: [
            Text(count.toString(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}