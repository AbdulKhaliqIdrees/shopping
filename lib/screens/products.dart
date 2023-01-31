import 'package:flutter/material.dart';
import 'package:shopping/screens/botom_navigation_bar.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Products"),
          backgroundColor: Colors.green,
        ),
        body: Column(
          children: [
            Expanded(child: Container()),
            const BotomNavigationBar(),
          ],
        ),
      ),
    );
  }
}
