import 'package:flutter/material.dart';

import '../widgets/add_project_dialog.dart';
import '../widgets/transcription_project_pane.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool _navISExpanded = false;
  int _navIndex = 0;
  late AnimationController _menuAnimationController;

  @override
  void initState() {
    _menuAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    super.initState();
  }

  @override
  void dispose() {
    _menuAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var body = TranscriptionProjectPane();
    var naviRail = NavigationRail(
      leading: Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
        alignment: Alignment.centerLeft,
        child: Column(
          spacing: 10,
          children: [
            IconButton(
              onPressed: () {
                if (_navISExpanded) {
                  _menuAnimationController.reverse();
                } else {
                  _menuAnimationController.forward();
                }
                setState(() {
                  _navISExpanded = !_navISExpanded;
                });
              },
              icon: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                progress: _menuAnimationController,
              ),
            ),
            FloatingActionButton(
              elevation: 0,
              onPressed: () => showAddProjectDialog(context),
              isExtended: _navISExpanded,
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
      destinations: [
        NavigationRailDestination(
          icon: Icon(Icons.transcribe_outlined),
          selectedIcon: Icon(Icons.transcribe),
          label: Text('Transcription'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.document_scanner_outlined),
          selectedIcon: Icon(Icons.document_scanner),
          label: Text('OCR'),
        ),
      ],
      onDestinationSelected:
          (index) => setState(() {
            _navIndex = index;
          }),
      selectedIndex: _navIndex,
      labelType: NavigationRailLabelType.all,
    );
    return Scaffold(body: Row(children: [naviRail, Expanded(child: body)]));
  }
}
