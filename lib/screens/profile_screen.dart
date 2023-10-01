import 'package:flutter/material.dart';

import 'my_items.screen.dart';

class ProfileScreen extends StatelessWidget {
  final String username; // User's username
  final String profileImage; // URL to the user's profile image

  // Constructor to receive the username and profile image URL
  ProfileScreen(
      {this.username = 'John Doe',
      this.profileImage =
          "https://th.bing.com/th/id/OIG.9UruK5kMssCBj9z.Fumk?pid=ImgGn"});
  List<dynamic> userItems = [
    {
      "name": "Item 1",
      "price": 19.99,
      "image": "https://th.bing.com/th/id/OIG.8VANpfZ_zdrP60qeAcme?pid=ImgGn",
      "availability": "yes",
      "condition": "new"
    },
    {
      "name": "Item 2",
      "price": 29.99,
      "image": "https://th.bing.com/th/id/OIG._acFirRQ7WHftahXkDrE?pid=ImgGn",
      "availability": "yes",
      "condition": "new"
    },
    {
      "name": "Item 3",
      "price": 14.95,
      "image": "https://th.bing.com/th/id/OIG.frnbzu6e2vKR_nDXlLCU?pid=ImgGn",
      "availability": "yes",
      "condition": "new"
    },
  ];
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
          ListTile(
            leading: Icon(Icons.shopping_basket),
            title: Text('My Items'),
            onTap: () {
              // Navigate to the "My Items" screen when tapped
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyItemsScreen(userItems: userItems),
                ),
              );
            },
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
