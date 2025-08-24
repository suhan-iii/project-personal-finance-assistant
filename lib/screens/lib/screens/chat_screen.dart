import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  String _reply = "";

  Future<void> _sendMessage() async {
    final response = await http.post(
      Uri.parse("https://<your-cloud-function-url>/finGenieAI"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"prompt": _controller.text}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _reply = data["reply"];
      });
    } else {
      setState(() {
        _reply = "Error: ${response.body}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AI Chatbot")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _controller, decoration: const InputDecoration(labelText: "Ask AI")),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: _sendMessage, child: const Text("Send")),
            const SizedBox(height: 20),
            Text("AI Reply: $_reply"),
          ],
        ),
      ),
    );
  }
}
