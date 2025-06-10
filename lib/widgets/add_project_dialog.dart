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
    return AlertDialog(
      title: Text('Create new project'),
      content: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(20),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3,
          ),
          children: List.generate(
            AppFeatures.values.length,
            (index) => FeatureCard(feature: AppFeatures.values[index]),
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
      ],
    );
  }
}
