import 'package:flutter/material.dart';

class ChatListPage extends StatelessWidget {
  ChatListPage({super.key});

  final List<Map<String, String>> chats = [
    {
      'name': 'Nike Official',
      'message': 'Segera Pesan Sebelum Kehabisan',
      'time': '12:30',
      'avatar': 'images/7.jpg',
    },
    {
      'name': 'Expander',
      'message': 'Halo, Selamat Datang di Nike Official.',
      'time': '12:05',
      'avatar': 'images/5.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'List Chat',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Color(0xFF4C53A5),
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xFF4C53A5)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            // Baris Filter Tombol
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 8),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Semua',
                      style: TextStyle(
                        color: Color(0xFF4C53A5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Belum Dibaca',
                      style: TextStyle(
                        color: Color.fromARGB(255, 114, 123, 216),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Daftar Chat
            Expanded(
              child: ListView.builder(
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  final chat = chats[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(chat['avatar']!),
                      radius: 25,
                    ),
                    title: Text(
                      chat['name']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(chat['message']!),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          chat['time']!,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        if (index == 0) // Lencana notifikasi untuk pesan belum dibaca
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: const Text(
                              '1',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                      ],
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        "ChatDetail",
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}