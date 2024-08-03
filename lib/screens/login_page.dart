// ignore_for_file: use_full_hex_values_for_flutter_colors, must_be_immutable, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shark/helper/show_snack_bar.dart';
import 'package:shark/screens/chat_page.dart';

import 'package:shark/widgets/custom_bottom.dart';
import 'package:shark/widgets/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    super.key,
    this.email,
    this.password,
  });
  String? email;
  String? password;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  String? email;
  String? password;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: const Color(0xfffffffff),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Form(
            key: formkey,
            child: ListView(
              children: [
                Container(
                  height: 80,
                  alignment: Alignment.topLeft,
                  child: Image.asset('assets/1.jpg'),
                ),
                const SizedBox(
                  height: 100,
                ),
                const Center(
                  child: Text(
                    'SHARK',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormfield(
                  text: 'Email',
                  icon: const Icon(Icons.email_outlined),
                  onchanged: (data) {
                    email = data;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormfield(
                  text: 'password',
                  icon: const Icon(Icons.password_rounded),
                  onchanged: (data) {
                    password = data;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomBottom(
                  text: 'Login',
                  onTap: () async {
                    if (formkey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await loginuser();
                        Navigator.pushNamed(context, ChatPage.id,
                            arguments: email);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          SnackbarMessage(context, "Sorry User don't exist");
                          isLoading = false;
                          setState(() {});
                        } else if (e.code == 'wrong-password') {
                          SnackbarMessage(context, 'Wrong Password');
                          isLoading = false;
                          setState(() {});
                        } else {
                          isLoading = false;
                          setState(() {});
                        }
                        isLoading = false;
                        setState(() {});
                      }
                      isLoading = false;
                      setState(() {});
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Dosen't have email"),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'RegisterPage');
                      },
                      child: const Text(
                        ' Signup?',
                        style: TextStyle(
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginuser() async {
    // ignore: unused_local_variable
    UserCredential user =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
