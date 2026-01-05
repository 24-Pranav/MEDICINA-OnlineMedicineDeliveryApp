import 'package:flutter/material.dart';

import 'components/body.dart';

class SignUpSuccessScreen extends StatelessWidget {
  const SignUpSuccessScreen({Key? key}) : super(key: key);
  static String routeName = "/signup_success";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text("Sign Up Success"),
      ),
      body: const Body(),
    );
  }
}