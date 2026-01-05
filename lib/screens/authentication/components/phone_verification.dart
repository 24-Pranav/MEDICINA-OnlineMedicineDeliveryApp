import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicina/components/custom_surffix_icon.dart';
import 'package:medicina/screens/home/home_screen.dart';

class PhoneVerification extends StatefulWidget {
  const PhoneVerification({Key? key}) : super(key: key);

  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  String? smsCode;
  String? verificationCode;
  String? number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 100, 10, 10),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Text(
                  "Enter your Phone Number",
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20,
                  ),
                ),
              ),
              TextField(
                onChanged: (val) {
                  number = val;
                },
                decoration: const InputDecoration(
                  labelText: "Phone Number",
                  hintText: "Enter your phone number",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 5.0, horizontal: 16.0),
                margin: const EdgeInsets.only(
                    top: 30, left: 20.0, right: 20.0, bottom: 20.0),
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.orange, Colors.orange],
                    ),
                    borderRadius: BorderRadius.circular(20.0)),
                child: TextButton(
                  onPressed: () {
                    if (number != null && number!.isNotEmpty) {
                      _submit();
                    }
                  },
                  child: const Text(
                    "Send Code",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submit() async {
    if (number == null) return;

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: number!,
      timeout: const Duration(seconds: 5),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false);
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verId, int? resendToken) {
        verificationCode = verId;
        smsCodeDialog(context);
      },
      codeAutoRetrievalTimeout: (String verId) {
        verificationCode = verId;
      },
    );
  }

  Future<void> smsCodeDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Enter Code",
              style: TextStyle(
                color: Colors.orange[900],
              ),
            ),
            content: TextField(
              onChanged: (value) {
                smsCode = value;
              },
            ),
            contentPadding: const EdgeInsets.all(10),
            actions: <Widget>[
              TextButton(
                  child: Text(
                    "Verify",
                    style: TextStyle(
                      color: Colors.orange[900],
                    ),
                  ),
                  onPressed: () async {
                    try {
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: verificationCode!,
                              smsCode: smsCode!);
                      await FirebaseAuth.instance
                          .signInWithCredential(credential);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()),
                          (route) => false);
                    } catch (e) {
                      print(e);
                    }
                  })
            ],
          );
        });
  }
}
