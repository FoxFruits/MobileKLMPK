import 'package:flutter/material.dart';
import 'dart:math';
import 'package:demomodul1pemmob/models/message.dart';

class ChatBoxScreen extends StatefulWidget {
  final String sender;
  final String profilePicUrl;

  ChatBoxScreen({required this.sender, required this.profilePicUrl});

  @override
  _ChatBoxScreenState createState() => _ChatBoxScreenState();
}

class _ChatBoxScreenState extends State<ChatBoxScreen> {
  List<Message> messages = [];
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    messages.add(Message(
        sender: widget.sender,
        text: 'Hi there!',
        time: '10:00 AM',
        isMe: false,
        profilePicUrl: widget.profilePicUrl
    ));
  }

  void _sendMessage(String text) {
    if (text.isNotEmpty) {
      setState(() {
        messages.add(Message(
            sender: 'Me',
            text: text,
            time: _getCurrentTime(),
            isMe: true,
            profilePicUrl: ''
        ));
      });
      _controller.clear();
      _simulateResponse();
    }
  }

  void _simulateResponse() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        messages.add(Message(
            sender: widget.sender,
            text: _getRandomResponse(),
            time: _getCurrentTime(),
            isMe: false,
            profilePicUrl: widget.profilePicUrl
        ));
      });
    });
  }

  String _getCurrentTime() {
    final now = DateTime.now();
    return '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
  }

  String _getRandomResponse() {
    final responses = [
      "That's interesting!",
      "Tell me more about it.",
      "I see, go on...",
      "Really? Wow!",
      "Hmm, I'm not sure about that.",
      "That's cool!",
    ];
    return responses[Random().nextInt(responses.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.profilePicUrl),
              child: widget.profilePicUrl.isEmpty ? Text(widget.sender[0]) : null,
            ),
            SizedBox(width: 10),
            Text(widget.sender),
          ],
        ),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return Align(
                  alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: message.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!message.isMe) ...[
                          CircleAvatar(
                            backgroundImage: NetworkImage(message.profilePicUrl),
                            radius: 16,
                            child: message.profilePicUrl.isEmpty ? Text(message.sender[0]) : null,
                          ),
                          SizedBox(width: 5),
                        ],
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: message.isMe ? Colors.green[300] : Colors.grey[300],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  message.text,
                                  style: TextStyle(color: Colors.black)),
                              Text(message.time, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                            ],
                          ),
                        ),
                        if (message.isMe) ...[
                          SizedBox(width: 5),
                          CircleAvatar(
                            backgroundColor: Colors.green[300],
                            radius: 16,
                            child: Text('Me'),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ChatBoxIcon(
                  icon: Icons.emoji_emotions,
                  onPressed: () {
                    // Handle emoji button press
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                ChatBoxIcon(
                  icon: Icons.upload_file,
                  onPressed: () {
                    // Handle pin button press
                  },
                ),
                ChatBoxIcon(
                  icon: Icons.camera_alt,
                  onPressed: () {
                    // Handle camera button press
                  },
                ),
                ChatBoxIcon(
                  icon: Icons.send,
                  onPressed: () => _sendMessage(_controller.text),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ChatBoxIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  ChatBoxIcon({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
    );
  }
}