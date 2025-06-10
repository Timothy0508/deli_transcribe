import 'package:flutter/material.dart';

import 'feature_card.dart';

showAddProjectDialog(BuildContext context) {
  showDialog(context: context, builder: (context) => AddProjectDialog());
}

class AddProjectDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddProjectDialogState();
}

class _AddProjectDialogState extends State<AddProjectDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          children: List.generate(
            AppFeatures.values.length,
            (index) => FeatureCard(feature: AppFeatures.values[index]),
          ),
        ),
      ),
    );
  }
}
