import 'package:flutter/material.dart';
import 'messages_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreenContent(),
    const MessageScreen(),
    const Placeholder(),
    const ProfileScreen(),
    const Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        title: Text(
          _currentIndex == 0
              ? 'Welcome William'
              : _currentIndex == 1
              ? 'Messages'
              : _currentIndex == 3
              ? 'Profile'
              : 'Welcome',
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: _screens[_currentIndex], // Ganti body sesuai index
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Messages"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Courses"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        ],
      ),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner Image
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(height: 16),

          // "Keep Moving Up" Section
          const Text(
            "Keep Moving Up",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          const SizedBox(height: 8),
          const Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),

          // Categories Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "See All",
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ),
            ],
          ),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: const [
              CategoryChip(label: "Development"),
              CategoryChip(label: "IT & Software"),
              CategoryChip(label: "UI/UX D"),
              CategoryChip(label: "Business"),
              CategoryChip(label: "Finance & Business"),
              CategoryChip(label: "Personal"),
            ],
          ),
          const SizedBox(height: 16),

          // Top Courses Section
          const Text(
            "Top Courses",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(right: 8.0),
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;
  const CategoryChip({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.blue[50],
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    );
  }
}
