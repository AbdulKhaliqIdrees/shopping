import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class ImageController extends GetxController {
  // ignore: non_constant_identifier_names
  String downloadurl = '';
  // ignore: non_constant_identifier_names
  var Productpic = File('').obs;
  var picture = false.obs;
  selectImage() async {
    try {
      XFile? selectedimage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (selectedimage != null) {
        File convertedfile = File(selectedimage.path);
        picture.value = true;
        Productpic.value = convertedfile;
        log("Image Selected");
      } else {
        log("No Image Selected!");
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  uploadImage() async {
    try {
      UploadTask uploadtask = FirebaseStorage.instance
          .ref()
          .child("Product Picture")
          .child(const Uuid().v1())
          .putFile(Productpic.value);
      TaskSnapshot taskSnapshot = await uploadtask;
      downloadurl = await taskSnapshot.ref.getDownloadURL();
      FirebaseFirestore.instance.collection("Productpic").add({
        "Productpic": downloadurl,
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
