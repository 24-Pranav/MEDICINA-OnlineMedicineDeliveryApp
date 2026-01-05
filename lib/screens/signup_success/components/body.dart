import 'package:flutter/material.dart';
import 'package:medicina/components/default_button.dart';
import 'package:medicina/screens/home/home_screen.dart';
import 'package:medicina/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Text(
            "Sign Up Successful!",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(28),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          Image.asset(
            "assets/images/success.png",
            height: SizeConfig.screenHeight! * 0.4, //40%
          ),
          const Spacer(),
          SizedBox(
            width: SizeConfig.screenWidth! * 0.6,
            child: DefaultButton(
              text: "Back to home",
              press: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
