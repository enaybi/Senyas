import 'package:flutter/material.dart';

void main() {
  runApp(const ChatpadApp());
}

class ChatpadApp extends StatelessWidget {
  const ChatpadApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatpad',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Chatpad(),
    );
  }
}

class Chatpad extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  Chatpad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 127, 216, 189),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Chatpad'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: _textEditingController,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          style: const TextStyle(
            fontFamily: 'Courier New',
            fontSize: 20,
          ),
          decoration: const InputDecoration(
            hintText: 'Start typing...',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(16.0),
          ),
        ),
      ),
    );
  }
}
