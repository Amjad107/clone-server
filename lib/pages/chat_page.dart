
import 'package:flutter/material.dart';
import '../services/gpt_service.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController questionController = TextEditingController();
  String response = "";

  void askGPT() async {
    String answer = await GPTService.ask(questionController.text);
    setState(() {
      response = answer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ask AI')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: questionController, decoration: InputDecoration(labelText: 'Enter your question')),
            SizedBox(height: 20),
            ElevatedButton(onPressed: askGPT, child: Text('Ask')),
            SizedBox(height: 20),
            Text('AI: $response'),
          ],
        ),
      ),
    );
  }
}
