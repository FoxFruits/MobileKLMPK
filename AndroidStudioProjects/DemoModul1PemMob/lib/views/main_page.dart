// main_page.dart
import 'package:flutter/material.dart';
import 'package:demomodul1pemmob/views/settings_screen.dart';
import 'chat_box_screen.dart';
import 'package:demomodul1pemmob/models/message.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1; // Default to "Pesan"

  // List of widgets for each tab
  final List<Widget> _widgetOptions = [
    CommunityScreen(),
    ChatScreen(),
    StoryScreen(), // Use the correct StoryScreen widget
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp UI'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Komunitas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Pesan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: 'Cerita',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  final List<Message> messages = [
    Message(sender: 'Alice', text: 'Hi there!', time: '10:00 AM', isMe: false, profilePicUrl: 'assets/alice.jpg'),
    Message(sender: 'Bob',  text: 'Hi There!', time: '10:00 AM', isMe: false, profilePicUrl: 'assets/bob.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(message.profilePicUrl),
            child: message.profilePicUrl.isEmpty ? Text(message.sender[0]) : null,
          ),
          title: Text(message.sender),
          subtitle: Text(message.text),
          trailing: Text(message.time),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatBoxScreen(sender: message.sender, profilePicUrl: message.profilePicUrl),
              ),
            );
          },
        );
      },
    );
  }
}

class CommunityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Halaman Komunitas'),
    );
  }
}

class StoryScreen extends StatefulWidget {
  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Text('Halaman cerita'),
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateStoryScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class CreateStoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buat Cerita Baru'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text('Halaman buat cerita baru'),
      ),
    );
  }
}