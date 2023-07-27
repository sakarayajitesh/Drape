import 'dart:io';

import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';

final available = ["Shorts", "Shoe", "Shirt"];

Future<String> labelImage(File file) async {
  final InputImage inputImage = InputImage.fromFile(file);
  final ImageLabelerOptions options =
      ImageLabelerOptions(confidenceThreshold: 0.5);
  final imageLabeler = ImageLabeler(options: options);
  final List<ImageLabel> labels = await imageLabeler.processImage(inputImage);
  imageLabeler.close();

  if (labels.isNotEmpty) {
    for (ImageLabel label in labels) {
      final String text = label.label;
      if (available.contains(text)) {
        return text;
      }
      // final int index = label.index;
      // final double confidence = label.confidence;
    }
  }

  return "";
}
