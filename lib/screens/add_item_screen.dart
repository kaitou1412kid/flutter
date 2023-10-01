import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // Import the File class

class AddItemScreen extends StatefulWidget {
  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  File? _selectedImage; // Define a File variable to store the selected image

  // Function to open the image picker
  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  // Function to handle adding an item with the selected image
  void _addItemWithImage() {
    // Implement item addition logic here
    // You can use _selectedImage to access the selected image file
    // and handle it according to your requirements
    
    // For example, you can upload the image to a server, save it locally, or use it for display.
    
    // Once you've handled the image, you can navigate back to the previous screen.
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Item Name'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Description'),
              maxLines: 4,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Condition'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Availability'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image'),
            ),
            SizedBox(height: 16.0),
            if (_selectedImage != null)
              Image.file(
                _selectedImage!,
                height: 150,
                fit: BoxFit.cover,
              ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _addItemWithImage,
              child: Text('Add Item with Image'),
            ),
          ],
        ),
      ),
    );
  }
}
