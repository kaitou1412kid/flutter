import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tryfirst/widgets/custom_button.dart';
import 'package:tryfirst/widgets/custom_textfield.dart';
import 'login_screen.dart'; // Import the login screen.

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signUp() async {
    final String apiUrl =
        'https://your-backend-api.com/register'; // Replace with your API endpoint.

    final response = await http.post(
      Uri.parse(apiUrl),
      body: {
        'email': _emailController.text.trim(),
        'password': _passwordController.text,
      },
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      // Handle the response, e.g., navigate to another screen.
      print('User registered: $responseData');
    } else {
      // Handle errors, e.g., show an error message.
      print('Error during sign-up: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logoshop.png', // Path to your image asset
              width: 200, // Adjust the width as needed
              height: 200, // Adjust the height as needed
            ),
            CustomTextField(
              controller: _emailController,
              hintText: 'Email',
            ),
            CustomTextField(
              controller: _passwordController,
              hintText: 'Password',
              obscureText: true,
            ),
            CustomButton(
              text: 'Sign Up',
              onPressed: _signUp,
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Navigate to the login screen.
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }
}
