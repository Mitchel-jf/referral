import 'package:flutter/material.dart';

import 'input_field.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text('Login'),
      ),
      body: ListView(
        children: [
          SizedBox(height: 20),
          InputField(
            labelText: 'Email',
          ),
          SizedBox(height: 20),
          InputField(
            labelText: 'Password',
          ),
          Center(
            child: OutlineButton(
              borderSide: BorderSide(color: Colors.blue),
              child: Text('Forgot password'),
              onPressed: () {},
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text('Login'),
                onPressed: () {},
              ),
              SizedBox(width: 20),
              RaisedButton(
                child: Text('Sign Up'),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
