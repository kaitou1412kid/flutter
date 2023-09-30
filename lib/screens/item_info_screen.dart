import 'package:flutter/material.dart';

class ItemInfoScreen extends StatelessWidget {
  final Map<String, dynamic> item;

  ItemInfoScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    if (item == null) {
      // Handle the case where 'item' is null
      return Scaffold(
        appBar: AppBar(
          title: Text('Item Information'),
        ),
        body: Center(
          child: Text('Item not found.'),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Information'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Display the item image (make it big)
            Image.network(
              item['image'],
              height: 300.0, // Adjust the image height as needed
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Product Name
                  Text(
                    item['name'],
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Price and Availability
                  Text(
                    'Price: \$${item['price'].toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    'Availability: ${item['availability']}',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  // Condition
                  Text(
                    'Condition: ${item['condition']}',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  // Description
                  SizedBox(height: 16.0),
                  Text(
                    'Description:',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    item['description'],
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  // Add to Cart Button
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      // Implement your add to cart logic here
                      // You can update a cart state or perform any desired action
                      // For simplicity, you can navigate back to the previous screen
                      Navigator.pop(context);
                    },
                    child: Text('Add to Cart'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
