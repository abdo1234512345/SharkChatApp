// ignore_for_file: use_full_hex_values_for_flutter_colors, must_be_immutable, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shark/helper/show_snack_bar.dart';
import 'package:shark/screens/chat_page.dart';
import 'package:shark/widgets/custom_bottom.dart';
import 'package:shark/widgets/custom_textfield.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({
    super.key,
    this.email,
    this.password,
  });
  String? email;
  String? password;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                  text: 'Username',
                  icon: const Icon(Icons.account_circle_outlined),
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
                  text: 'Regsiter',
                  onTap: () async {
                    if (formkey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await registerUser();
                        Navigator.pushNamed(context, ChatPage.id,
                            arguments: email);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          SnackbarMessage(context, 'Weak Password');
                          isLoading = false;
                          setState(() {});
                        } else if (e.code == 'email-already-in-use') {
                          SnackbarMessage(context, 'Email Already Exist');
                          isLoading = false;
                          setState(() {});
                        } else {
                          SnackbarMessage(context, 'Check Your Connetion');
                          isLoading = false;
                          setState(() {});
                        }
                        isLoading = false;
                        setState(() {});
                      }
                      isLoading = false;
                      setState(() {});
                    }
                    isLoading = false;
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have account?'),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        setState(() {});
                      },
                      child: const Text(
                        ' Login',
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

  Future<void> registerUser() async {
    // ignore: unused_local_variable
    UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
