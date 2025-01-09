import 'package:flutter/material.dart';
import 'welcome_screen.dart'; // Import WelcomeScreen untuk navigasi

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 30),
          const Center(
            child: Text(
              "Profile",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          const Center(
            child: CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 50),
            ),
          ),
          const SizedBox(height: 20),
          const Divider(thickness: 1, color: Colors.grey),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                _buildSection("Video preference", [
                  "Download Option",
                  "Video playback options",
                ]),
                _buildSection("Account Settings", [
                  "Account Security",
                  "Email Notification Preferences",
                  "Learning Reminders",
                ]),
                _buildSection("About Learnout", [
                  "Frequently Asked Questions",
                  "Share the Learnout App",
                ]),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Center(
              child: TextButton(
                onPressed: () {
                  _showLogoutDialog(context); // Menampilkan pop-up konfirmasi
                },
                child: const Text(
                  "Log Out",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...items.map((item) => ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(item),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            // Tambahkan aksi di sini
          },
        )),
        const SizedBox(height: 16),
      ],
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Confirm Logout"),
          content: const Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Tutup pop-up jika tekan "Cancel"
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Tutup pop-up
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                ); // Navigasi ke Welcome Screen
              },
              child: const Text(
                "Log Out",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
