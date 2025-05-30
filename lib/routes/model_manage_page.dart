import 'package:flutter/material.dart';

import '../api/hugging_face.dart';
import '../widgets/model_list_tile.dart';

class ModelManagePage extends StatefulWidget {
  const ModelManagePage({super.key});

  @override
  State<StatefulWidget> createState() => _ModelManagePageState();
}

class _ModelManagePageState extends State<ModelManagePage> {
  Map<HuggingFaceModel, bool> modelsState = {};
  void initModelsState() async {
    var result = await HuggingFaceApi().checkModelExists();
    setState(() {
      modelsState = result;
    });
  }

  @override
  void initState() {
    super.initState();
    initModelsState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Model Manager"),
        actions: [
          IconButton(
            onPressed: () => initModelsState(),
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: ListView.separated(
        itemBuilder:
            (context, index) =>
                ModelListTile(model: HuggingFaceModel.values[index]),
        separatorBuilder: (context, index) => Divider(),
        itemCount: modelsState.length,
      ),
    );
  }
}
