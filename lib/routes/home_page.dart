import 'package:flutter/material.dart';

import '../widgets/feature_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var appBar = SliverAppBar(
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(title: Text('Deli Transcribe')),
    );
    var body = SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) => FeatureCard(feature: AppFeatures.values[index]),
        childCount: AppFeatures.values.length,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3.5,
      ),
    );
    return Scaffold(body: CustomScrollView(slivers: [appBar, body]));
  }
}
