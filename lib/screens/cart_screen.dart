import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> cartItems = [];
  double total = 0.0;

  @override
  void initState() {
    super.initState();
    _loadCartItems();
  }

  void _loadCartItems() {
    // Simulated API response (replace with actual API integration)
    final List<Map<String, dynamic>> apiResponse = [
      {
        'name': 'Item 1',
        'price': 10.0,
        'image': 'https://th.bing.com/th/id/OIG.8VANpfZ_zdrP60qeAcme?pid=ImgGn',
      },
      {
        'name': 'Item 2',
        'price': 20.0,
        'image': 'https://th.bing.com/th/id/OIG._acFirRQ7WHftahXkDrE?pid=ImgGn',
      },
    ];

    setState(() {
      cartItems = apiResponse;
      _calculateTotal();
    });
  }

  void _calculateTotal() {
    double newTotal = 0.0;
    for (var item in cartItems) {
      newTotal += item['price'];
    }
    setState(() {
      total = newTotal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (BuildContext context, int index) {
          final item = cartItems[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Image.network(
                  item['image'],
                  width: double.infinity,
                  height: 200, // Adjust the image height as needed
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
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Total: \$${total.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement the checkout logic here
              },
              child: Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
