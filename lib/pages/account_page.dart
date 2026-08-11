import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Account')),
      body: Center(child: Text('Welcome to your account!')),
    );
  }
}

Widget _buildProfileSection() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withValues(alpha: 0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    padding: const EdgeInsets.all(20),
    child: Row(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('assets/images/profile.jpg'),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'John Doe',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text('Email: johndoe@example.com', style: TextStyle(fontSize: 16)),
          ],
        ),
      ],
    ),
  );
}

Widget _buildSettingItem(
  BuildContext context, {
  required IconData icon,
  required String title,
  required VoidCallback onTap,
}) {
  return Card(
    elevation: 4,
    margin: const EdgeInsets.symmetric(vertical: 10),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: ListTile(
      leading: Icon(icon, color: Theme.of(context).primaryColor),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    ),
  );
}

Widget _buildSettingSection(BuildContext context) {
  return Column(
    children: [
      _buildSettingItem(
        context,
        icon: Icons.person,
        title: 'Profile',
        onTap: () {
          Navigator.pushNamed(context, '/accountPage');
        },
      ),
      _buildSettingItem(
        context,
        icon: Icons.lock,
        title: 'Change Password',
        onTap: () {
          Navigator.pushNamed(context, '/changePassword');
        },
      ),
      _buildSettingItem(
        context,
        icon: Icons.notifications,
        title: 'Notifications',
        onTap: () {
          Navigator.pushNamed(context, '/notifications');
        },
      ),
      _buildSettingItem(
        context,
        icon: Icons.help,
        title: 'Help & Support',
        onTap: () {
          Navigator.pushNamed(context, '/help');
        },
      ),
      _buildSettingItem(
        context,
        icon: Icons.logout,
        title: 'Logout',
        onTap: () {
          _showLogoutDialog(context);
        },
      ),
    ],
  );
}

void _showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushReplacementNamed(context, 'LoginPage');
            },
            child: const Text('Logout'),
          ),
        ],
      );
    },
  );
}

