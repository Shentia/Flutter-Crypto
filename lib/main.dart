import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            const SizedBox(
              width: 8,
            ),
            Image.asset("assets/images/icon.png"),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Crypto Price",
                style: TextStyle(color: Colors.black),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/images/menu.png"),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 16.0),
              child: Row(
                children: [
                  Image.asset("assets/images/faq.png"),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text("Crypto Price"),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Text(
                "The prices are real and you should try and search in my app every minutes ",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
