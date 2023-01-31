import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/controllers/data_create_controller.dart';
import 'package:shopping/controllers/image_controller.dart';
import 'package:shopping/widgets/reuse_textfield.dart';

class AddProducts extends StatelessWidget {
  AddProducts({Key? key}) : super(key: key);
  final datacreatecontroller = Get.find<DataCreateController>();
  final imagecontroller = Get.find<ImageController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Products"),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ReuseTextfield(datacreatecontroller.productname, "Name"),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ReuseTextfield(
                    datacreatecontroller.productdescription, "Description"),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child:
                    ReuseTextfield(datacreatecontroller.productprice, "Price"),
              ),
              InkWell(
                onTap: () {
                  imagecontroller.selectImage();
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF),
                      border: Border.all(
                        width: 1,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Obx((() => (imagecontroller.picture.value == true)
                            ? Expanded(
                                child: Image.file(
                                    imagecontroller.Productpic.value))
                            : Container())),
                        const Icon(Icons.photo_camera),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text("Image Picker"),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                color: Colors.yellow,
                child: const Text("Add Product"),
                onPressed: () {
                  imagecontroller.uploadImage();
                  //datacreatecontroller.createData();
                  datacreatecontroller.productname.clear();
                  datacreatecontroller.productdescription.clear();
                  datacreatecontroller.productprice.clear();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
