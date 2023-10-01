import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tryfirst/widgets/custom_button.dart';
import 'package:tryfirst/widgets/custom_textfield.dart';
import 'home_screen.dart';
import 'signup_screen.dart'; // Import the signup screen.

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    try {
      final String apiUrl =
          'http://192.168.1.65:8000/api/login/'; // Replace with your API endpoint.

      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'email': _emailController.text.trim(),
          'password': _passwordController.text,
        },
      );
      print(response);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        // Handle the response, e.g., navigate to another screen.
        // final userData = responseData['user'];
        final username = responseData['user_name'];

        // Navigate to the home screen and pass user data
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(
              username: username,
              // userData: userData,
            ),
          ),
        );
        print('User logged in: $responseData');
      } else {
        // Handle errors, e.g., show an error message.
        print('Error during login: ${response.body}');
      }
    } catch (e) {
      print('Error : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
              text: 'Login',
              onPressed: _login,
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Navigate to the signup screen.
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
              child: Text('Don\'t have an account? Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
