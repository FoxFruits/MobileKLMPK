/*import 'package:flutter/material.dart';

class StoryScreen extends StatefulWidget {
  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cerita'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Tambahkan kode untuk menampilkan cerita
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StoryDetailScreen()),
                );
              },
              child: Text('Tampilkan Cerita'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Tambahkan kode untuk membuat cerita baru
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateStoryScreen()),
                );
              },
              child: Text('Buat Cerita Baru'),
            ),
          ],
        ),
      ),
    );
  }
}

class StoryDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Cerita'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text('Halaman detail cerita'),
      ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tambahkan kode untuk membuat cerita baru
        },
        child: Icon(Icons.add, size: 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}*/