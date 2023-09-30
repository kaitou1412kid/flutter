import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'profile_screen.dart';
import 'cart_screen.dart';
import 'item_info_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> items = [
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
    {
      "name": "Item 4",
      "price": 49.99,
      "image":
          "https://image.lexica.art/full_jpg/18afdb93-faf4-4d4a-8275-e9c8ad21313a",
      "availability": "yes",
      "condition": "new"
    },
    {
      "name": "Item 5",
      "price": 9.99,
      "image":
          "https://image.lexica.art/full_jpg/a31fdd71-85e6-45e9-b571-92ff34cbdf9c",
      "availability": "yes",
      "condition": "new"
    },
    {
      "name": "Item 6",
      "price": 39.95,
      "image":
          "https://image.lexica.art/full_jpg/03ddee15-c4cf-4eb6-953f-ec7aa0c7754e",
      "availability": "yes",
      "condition": "new"
    },
    {
      "name": "Item 7",
      "price": 24.99,
      "image":
          "https://image.lexica.art/full_jpg/79c57209-7d5f-4318-a702-61129e001e46",
      "availability": "yes",
      "condition": "new"
    },
    {
      "name": "Item 8",
      "price": 17.99,
      "image":
          "https://image.lexica.art/full_jpg/1f9c072d-cd3d-427c-bc68-6f04c99ec058",
      "availability": "yes",
      "condition": "new"
    },
    {
      "name": "Item 9",
      "price": 11.50,
      "image":
          "https://image.lexica.art/full_jpg/8bbf2498-ebbb-466c-be3c-a67bfbed247e",
      "availability": "yes",
      "condition": "new"
    },
    {
      "name": "Item 10",
      "price": 34.99,
      "image": "https://th.bing.com/th/id/OIG.xUQHoNet2pG_PpObGAHC?pid=ImgGn",
      "availability": "yes",
      "condition": "new"
    }
  ]; // List to store items from the API

  @override
  void initState() {
    super.initState();
    // Load items from the API when the page loads
    _loadItems();
  }

  Future<void> _loadItems() async {
    final String apiUrl =
        'https://your-backend-api.com/items'; // Replace with your API endpoint.

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      setState(() {
        // items = responseData['items'];
      });
    } else {
      // Handle errors, e.g., show an error message.
      print('Error loading items: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item List'),
        actions: <Widget>[
          // Add an IconButton for navigating to the cart screen
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to the cart screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(),
                ),
              );
            },
          ),
        ],
      ),
      // body: ListView.builder(
      //   itemCount: items.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     final item = items[index];
      //     return Card(
      //       margin: EdgeInsets.all(10),
      //       child: ListTile(
      //         title: Text(item['name']),
      //         subtitle: Text(item['description']),
      //         // Add more item details as needed
      //       ),
      //     );
      //   },
      // ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two columns
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final itemnit = items[index];
          Map<String, dynamic> item = itemnit is Map<String, dynamic>
              ? itemnit
              : {
                  'name': itemnit['name'],
                  'price': itemnit['price'],
                  'image': itemnit['image'],
                  'availability': itemnit['availability'],
                  'condition': itemnit['condition'],
                  'description': "This is description"
                };
          print(item);
          return GestureDetector(
              onTap: () {
                // Navigate to the item information screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemInfoScreen(item: item),
                  ),
                );
              },
              child: Card(
                elevation: 4.0,
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Image.network(
                      item['image'],
                      height: 125, // Adjust the image height as needed
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            item['name'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$${item['price'].toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Items',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User Profile',
          ),
        ],
        onTap: (index) {
          // Handle navigation between tabs
          if (index == 0) {
            // Navigate to the items screen
            // You can use Navigator.push or other navigation methods here
          } else if (index == 1) {
            // Navigate to the user profile screen
            // You can use Navigator.push or other navigation methods here
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileScreen(
                  username: 'John Doe', // Replace with the actual username
                  profileImage:
                      'https://example.com/profile.jpg', // Replace with the actual profile image URL
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
