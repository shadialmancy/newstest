import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController search1Controller = TextEditingController();
  TextEditingController search2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: search1Controller,
            ),
            TextField(
              controller: search2Controller,
            ),
          ],
        ),
      ),
    );
  }
}
