import 'package:flutter/material.dart';
import 'package:hive_text_project/db/usrelist.dart';
import 'package:hive_text_project/maodal/textmodal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final textController = TextEditingController();
  String receivedValue = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(children: [
        const SizedBox(
          width: 10,
          height: 10,
        ),
        TextField(
          controller: textController,
          decoration: const InputDecoration(
              hintText: 'enter text', border: OutlineInputBorder()),
        ),
        const SizedBox(
          width: 10,
          height: 10,
        ),
        ElevatedButton(
            onPressed: () {
              final obj = TextModal(name: textController.text);
              addText(obj);
            },
            child: const Text("insert")),
        const SizedBox(
          width: 10,
          height: 10,
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                final value = getText();
                value.then((value) => receivedValue = value);
              });
            },
            child: const Text("show")),
        Text(receivedValue.toString()),
      ]),
    ));
  }
}
