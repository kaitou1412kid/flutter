import 'package:flutter/material.dart';

class MyItemsScreen extends StatelessWidget {
  final List<dynamic>? userItems; // Use List<dynamic>?

  MyItemsScreen({required this.userItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Items'),
      ),
      body: userItems != null && userItems!.isNotEmpty
          ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 items per row
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
              itemCount: userItems?.length,
              itemBuilder: (BuildContext context, int index) {
                final item = userItems?[index];
                final itemName = item['name'] ?? '';
                final itemPrice = item['price'] ?? '';

                return Card(
                  elevation: 4.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Image.network(
                        item['image'] ?? '', // Use default image URL if null
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              itemName,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '\$$itemPrice', // Format price as needed
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          : Center(
              child: Text(
                  'No items found'), // Handle the case when userItems is null or empty
            ),
    );
  }
}
