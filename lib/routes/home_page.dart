import 'package:flutter/material.dart';

import '../widgets/feature_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _navISExpanded = false;
  int _navIndex = 0;
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
    var naviRail = NavigationRail(
      leading: Row(
        children: [
          IconButton(
            onPressed:
                () => setState(() {
                  _navISExpanded = !_navISExpanded;
                }),
            icon: Icon(Icons.menu),
          ),
        ],
      ),
      destinations: [
        NavigationRailDestination(
          icon: Icon(Icons.transcribe),
          label: Text('Transcription'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.text_fields),
          label: Text('OCR'),
        ),
      ],
      selectedIndex: 0,
    );
    return Scaffold(
      body: Row(
        children: [
          naviRail,
          Expanded(child: CustomScrollView(slivers: [appBar, body])),
        ],
      ),
    );
  }
}
