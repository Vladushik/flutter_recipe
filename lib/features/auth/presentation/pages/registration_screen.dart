import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_recipe/features/auth/presentation/widgets/constants.dart';
import 'package:flutter_recipe/features/auth/presentation/widgets/rounded_button.dart';
import 'package:flutter_recipe/features/recipes/presentation/pages/recipes_page.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool showSpinner = false;
  late String email;
  late String password;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                  child: Hero(
                      tag: 'logo',
                      child: Container(
                          height: 200,
                          child: Image.asset('assets/images/logo.png')))),
              SizedBox(height: 48),
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(height: 8),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password'),
              ),
              SizedBox(height: 8),
              RoundedButton(Colors.blueAccent, 'Registration', () async {
                setState(() {
                  showSpinner = true;
                });
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  if (newUser != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RecipesPage()),
                    );
                  }
                  setState(() {
                    showSpinner = false;
                  });
                } catch (e) {}
              }),
            ],
          ),
        ),
      ),
    );
  }
}
