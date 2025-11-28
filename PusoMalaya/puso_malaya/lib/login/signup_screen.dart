import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puso_malaya/service/login_service.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({
    super.key,
    required this.successRegister,
    required this.cancelRegister,
  });

  final void Function(String) successRegister;
  final void Function() cancelRegister;

  @override
  State<StatefulWidget> createState() {
    return _SignupScreenState();
  }
}

class _SignupScreenState extends State<SignupScreen> {
  final loginService = LoginService();
  final formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  var enteredUsername = '';
  var enteredPassword = '';
  var enteredEmail = '';
  var isSending = false;

  void register() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isSending = true;
      });

      formKey.currentState!.save();

      final newUser = await loginService.register(
        context: context,
        username: enteredUsername,
        password: enteredPassword,
        email: enteredEmail,
      );

      // var newUser = 'ewa';
      setState(() {
        isSending = false;
      });

      if (newUser != null) {
      // if (newUser != '') {
        widget.successRegister(newUser);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/signup_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
            ),
          ),

          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 60),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Text(
                        "Puso Malaya",
                        style:
                            Theme.of(
                              context,
                            ).textTheme.titleLarge!.copyWith(
                              color: Colors.white,
                              fontFamily: GoogleFonts.khand().fontFamily,
                            ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 300),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                      child: Container(
                        padding: EdgeInsets.all(25),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                          ),
                        ),
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Sign Up",
                                style:
                                    Theme.of(
                                      context,
                                    ).textTheme.titleMedium!.copyWith(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Create account to continue.",
                                style:
                                    Theme.of(
                                      context,
                                    ).textTheme.titleSmall!.copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                          
                              SizedBox(height: 25),
                          
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.25),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: TextFormField(
                                  textAlignVertical: TextAlignVertical(y: 0.1),
                                  style: Theme.of(context).textTheme.titleSmall!
                                      .copyWith(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                    hintText: "Username",
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          color: Colors.white.withOpacity(
                                            0.7,
                                          ),
                                          fontSize: 18,
                                        ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter your username';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    enteredUsername = value!;
                                  },
                                ),
                              ),
                          
                              SizedBox(height: 15),
                          
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.25),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: TextFormField(
                                  textAlignVertical: TextAlignVertical(y: 0.1),
                                  style: Theme.of(context).textTheme.titleSmall!
                                      .copyWith(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.mail,
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                    hintText: "Email",
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          color: Colors.white.withOpacity(
                                            0.7,
                                          ),
                                          fontSize: 18,
                                        ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter your email';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    enteredEmail = value!;
                                  },
                                ),
                              ),
                          
                              SizedBox(height: 15),
                          
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.25),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: TextFormField(
                                  textAlignVertical: TextAlignVertical(y: 0.1),
                                  obscureText: !_isPasswordVisible,
                                  style: Theme.of(context).textTheme.titleSmall!
                                      .copyWith(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                    hintText: "Password",
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          color: Colors.white.withOpacity(
                                            0.7,
                                          ),
                                          fontSize: 18,
                                        ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _isPasswordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isPasswordVisible =
                                              !_isPasswordVisible;
                                        });
                                      },
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter your password';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    enteredPassword = value!;
                                  },
                                ),
                              ),
                          
                              SizedBox(height: 10),
                          
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: isSending ? null : register,
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 12,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        15,
                                      ),
                                    ),
                                  ),
                                  child: isSending
                                      ? SizedBox(
                                          height: 16,
                                          width: 16,
                                          child: CircularProgressIndicator(),
                                        )
                                      : Text(
                                          "Sign up",
                                          style: Theme.of(
                                            context,
                                          ).textTheme.titleMedium,
                                  ),
                                ),
                              ),
                          
                              SizedBox(height: 10),
                          
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Already have an account? Go to ",
                                    style: Theme.of(context).textTheme.titleSmall!
                                        .copyWith(color: Colors.white70),
                                  ),
                                  TextButton(
                                    onPressed: isSending
                                        ? null
                                        : widget.cancelRegister,
                                    child: Text(
                                      "Login",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
