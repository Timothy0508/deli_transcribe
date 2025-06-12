import 'dart:io';
import 'dart:ui';

import 'package:textify/textify.dart';

class TextRecognition {
  Future<String> extractText(String imagePath) async {
    var image = await File(imagePath).readAsBytes();
    ImmutableBuffer buffer = await ImmutableBuffer.fromUint8List(image);
    ImageDescriptor descriptor = await ImageDescriptor.encoded(buffer);
    Codec codec = await descriptor.instantiateCodec();
    FrameInfo frameInfo = await codec.getNextFrame();
    var inputImage = frameInfo.image;
    Textify textify = await Textify().init();
    String text = await textify.getTextFromImage(image: inputImage);
    return text;
  }
}
