import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Message> _messages = [
    Message(text: 'Hello', isMe: false),
    Message(text: 'Hi there!', isMe: true),
    Message(text: 'How are you?', isMe: false),
    Message(text: 'I\'m good. How about you?', isMe: true),
    // Add more messages as needed
  ];

  final TextEditingController _textEditingController = TextEditingController();

  void _sendMessage(String text) {
    setState(() {
      _messages.add(Message(text: text, isMe: true));
      _textEditingController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Screen'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: message.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: message.isMe ? Colors.blue : Colors.grey[300],
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          message.text,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: message.isMe ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    if (_textEditingController.text.isNotEmpty) {
                      _sendMessage(_textEditingController.text);
                    }
                  },
                  child: Text('Send'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final bool isMe;

  Message({required this.text, required this.isMe});
}
