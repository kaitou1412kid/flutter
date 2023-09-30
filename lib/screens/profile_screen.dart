import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String username; // User's username
  final String profileImage; // URL to the user's profile image

  // Constructor to receive the username and profile image URL
  ProfileScreen({this.username = 'John Doe', required this.profileImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20),
          CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(
                profileImage ?? ''), // Use the provided profile image URL
            backgroundColor: Colors.grey, // Fallback background color
          ),
          SizedBox(height: 20),
          Text(
            username,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Implement settings screen navigation here
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // Implement logout logic here
              // You can navigate back to the login screen or perform other logout actions
            },
          ),
        ],
      ),
    );
  }
}
