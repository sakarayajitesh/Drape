import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

Future<List<XFile>> openImagesPicker() async =>
    await ImagePicker().pickMultiImage(imageQuality: 10);

Future<String> storeImage(Directory dir, XFile image) async {
  final filePath = path.join(dir.path, path.basename(image.path));
  await File(filePath).writeAsBytes(await image.readAsBytes());
  return filePath;
}
