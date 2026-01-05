import 'package:flutter/widgets.dart';
import 'package:medicina/screens/authentication/auth_screen.dart';
import 'package:medicina/screens/complete_profile/complete_profile_screen.dart';
import 'package:medicina/screens/forgot_password/forgot_password_Screen.dart';
import 'package:medicina/screens/home/home_screen.dart';
import 'package:medicina/screens/login_success/login_success_screen.dart';
import 'package:medicina/screens/otp/otp_screen.dart';
import 'package:medicina/screens/sign_in/sign_in_screen.dart';
import 'package:medicina/screens/sign_up/sign_up_screen.dart';
import 'package:medicina/screens/signup_success/signup_success_screen.dart';
import 'package:medicina/screens/splash/splash_screen.dart';
import 'package:medicina/screens/upload_image/upload_image_screen.dart';

// We use name route
// All our routes will be available in here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  UploadImageScreen.routeName: (context) => const UploadImageScreen(),
  OtpScreen.routeName: (context) => const OtpScreen(),
  SignUpSuccessScreen.routeName: (context) => const SignUpSuccessScreen(),
  AuthScreen.routeName: (context) => const AuthScreen(),
};
