import 'package:flutter/material.dart';
import 'package:referral/pages/auth/input_field.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sign up'),
      ),
      body: Form(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: InputField(
                        labelText: 'First Name',
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: InputField(
                        labelText: 'Last Name',
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: InputField(
                        labelText: 'Email',
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      flex: 1,
                      child: InputField(
                        labelText: 'Phone Number',
                      ),
                    ),
                  ],
                ),
                Center(child: Text('Gender')),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Radio(value: 2, groupValue: 1, onChanged: (value) {}),
                      Text('Female'),
                      SizedBox(width: 20),
                      Radio(value: 1, groupValue: 1, onChanged: (value) {}),
                      Text('Male'),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: InputField(
                        labelText: 'Referral Code',
                      ),
                    ),
                    OutlineButton(
                      child: Text('Check Availability'),
                      borderSide: BorderSide(color: Colors.blue),
                      onPressed: () {},
                    ),
                  ],
                ),
                InputField(
                  labelText: 'Password',
                ),
                Center(
                  child: RaisedButton(
                    child: Text('Sign Up'),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
