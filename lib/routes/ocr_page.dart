import 'package:flutter/material.dart';

class OcrPage extends StatefulWidget {
  const OcrPage({super.key});

  @override
  State<StatefulWidget> createState() => _OcrPageState();
}

class _OcrPageState extends State<OcrPage> {
  var _selectedMode = {'picture'};

  @override
  Widget build(BuildContext context) {
    var appBar = SliverAppBar(
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(title: Text('Ocr')),
    );

    var switcher = SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: SegmentedButton(
          segments: [
            ButtonSegment(
              value: 'picture',
              label: Text('Picture'),
              icon: Icon(Icons.photo),
            ),
            ButtonSegment(
              value: 'text',
              label: Text('Text'),
              icon: Icon(Icons.text_fields),
            ),
          ],
          selected: _selectedMode,
          onSelectionChanged:
              (value) => setState(() {
                _selectedMode = value;
              }),
        ),
      ),
    );

    return Scaffold(body: CustomScrollView(slivers: [appBar, switcher]));
  }
}
