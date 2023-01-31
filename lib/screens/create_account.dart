import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/controllers/account_create_controller.dart';
import 'package:shopping/controllers/data_create_controller.dart';
import 'package:shopping/controllers/image_controller.dart';
import 'package:shopping/screens/login_account.dart';
import 'package:shopping/screens/reset_password_screen.dart';
import 'package:shopping/widgets/reuse_textfield.dart';

class CreateAccount extends StatelessWidget {
  CreateAccount({Key? key}) : super(key: key);
  final createcontroller = Get.put(CreateController());
  final datacreatecontroller = Get.put(DataCreateController());
  final imagecontroller = Get.put(ImageController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Create Account"),
          backgroundColor: Colors.green,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ReuseTextfield(createcontroller.emailcontroller, "Email"),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Password must be greater than 6 digits and should be strong like this ---> AB1.2dulK.65haLI..Q",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ReuseTextfield(
                  createcontroller.passwordcontroller, "Password"),
            ),
            const SizedBox(
              height: 15,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: ((context) {
                    return ReSetPassWord();
                  })),
                );
              },
              child: const Text(
                "Reset Password",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  color: Colors.yellow,
                  child: const Text("Create Account"),
                  onPressed: () {
                    createcontroller.createAccount();
                    createcontroller.emailcontroller.clear();
                    createcontroller.passwordcontroller.clear();
                  },
                ),
                MaterialButton(
                  color: Colors.yellow,
                  child: const Text("Login Screen"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: ((context) {
                        return LoginAccount();
                      })),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
