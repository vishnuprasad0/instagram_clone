import "package:flutter/material.dart";
import "package:image_picker/image_picker.dart";
import "package:instagram_clone/constants/colors.dart";

// for picking up image
pickImage(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: source);
  if (file != null) {
    return await file.readAsBytes();
  }
}

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
    content,
    style: const TextStyle(color: blueColor, backgroundColor: primaryColor),
  )));
}
