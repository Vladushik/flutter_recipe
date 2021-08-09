import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_recipe/features/auth/presentation/widgets/constants.dart';
import 'package:flutter_recipe/features/auth/presentation/widgets/rounded_button.dart';
import 'package:flutter_recipe/features/recipes/presentation/pages/recipes_page.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
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
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your email')),
              SizedBox(height: 8),
              TextField(
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your password')),
              SizedBox(height: 8),
              RoundedButton(Colors.lightBlueAccent, 'Log In', () async {
                setState(() {
                  showSpinner = true;
                });
                try {
                  final user = await _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  if (user != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RecipesPage()),
                    );

                    //Navigator.pushNamed(context, ChatScreen.id);
                  }
                  setState(() {
                    showSpinner = false;
                  });
                } catch (e) {
                  print(e);
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
