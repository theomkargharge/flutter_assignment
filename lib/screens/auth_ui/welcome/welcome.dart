import 'package:e_commerce_app/constants/assets_images.dart';
import 'package:e_commerce_app/constants/routes.dart';
import 'package:e_commerce_app/screens/auth_ui/login/login.dart';
import 'package:e_commerce_app/screens/auth_ui/signup/singup.dart';
import 'package:e_commerce_app/widgets/primary_buttons/primary_button.dart';
import 'package:e_commerce_app/widgets/top_titles/top_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 600;

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const TopTiles(
              subtitle: "Buy any item from using app",
              title: "Welcome",
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Image.asset(
                AssetsImages.instance.welcomeImage,
                width: 250,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.zero,
                    child: Icon(
                      Icons.facebook,
                      color: Colors.blue,
                      size: 70,
                    ),
                  ),
                ),
                CupertinoButton(
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.zero,
                    child: Image.asset(
                      AssetsImages.instance.googleImage,
                      width: 100,
                      scale: 30,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            PrimaryButton(
                onPressed: () {
                  Routes.instance.push(Login(), context);
                },
                title: 'Login'),
            const SizedBox(
              height: 20,
            ),
            PrimaryButton(
                onPressed: () {
                  Routes.instance.push(const SignUp(), context);
                },
                title: "Sign Up")
          ]),
        ),
      ),
    );
  }
}
