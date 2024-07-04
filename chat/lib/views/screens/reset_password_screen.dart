import 'package:chat/services/firebase_auth_services.dart';
import 'package:chat/views/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  final firebaseAuthServices = FirebaseAuthServices();
  String? emailError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reset password"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200.h,
              width: 200.h,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/logo.png"))),
            ),
            SizedBox(height: 50.h),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "Email",
                  errorText: emailError),
            ),
            SizedBox(height: 30.h),
            FilledButton(
              onPressed: () {
                if (emailController.text.isEmpty) {
                  emailError = "Input Email";
                  setState(() {});
                } else {
                  firebaseAuthServices.resetPasword(emailController.text);
                  showDialog(
                    // ignore: use_build_context_synchronously
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        title: const Text(
                            "We have sent a link to reset your password to your email"),
                        content: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ));
                            },
                            child: Text("Back")),
                      );
                    },
                  );
                }
              },
              style: FilledButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10)),
              child: Text(
                "Reset Password",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.h,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
