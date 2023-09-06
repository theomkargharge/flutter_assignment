// import 'package:e_commerce_app/constants/constants.dart';
// import 'package:e_commerce_app/constants/routes.dart';
// import 'package:e_commerce_app/firebase_helper/firebase_auth/firebase_auth_helper.dart';
// import 'package:e_commerce_app/screens/auth_ui/login/login.dart';
// import 'package:e_commerce_app/widgets/primary_buttons/primary_button.dart';
// import 'package:e_commerce_app/widgets/top_titles/top_title.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({super.key});

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   TextEditingController email = TextEditingController();
//   TextEditingController phone = TextEditingController();
//   TextEditingController password = TextEditingController();
//   TextEditingController name = TextEditingController();
//   bool isShowPassword = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const TopTiles(
//                   subtitle: 'Welcome to World of E-commerce!',
//                   title: 'Create Account'),
//               const SizedBox(
//                 height: 15,
//               ),
//               const Center(
//                   child: Icon(
//                 Icons.account_circle_rounded,
//                 size: 80,
//                 color: Colors.redAccent,
//               )),
//               const SizedBox(
//                 height: 35,
//               ),
//               TextFormField(
//                 controller: name,
//                 keyboardType: TextInputType.name,
//                 decoration: const InputDecoration(
//                     prefixIcon: Icon(Icons.person), hintText: 'Enter Name'),
//               ),
//               const SizedBox(
//                 height: 20.0,
//               ),
//               TextFormField(
//                 controller: email,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: const InputDecoration(
//                     prefixIcon: Icon(Icons.email_outlined), hintText: 'E-mail'),
//               ),
//               const SizedBox(
//                 height: 20.0,
//               ),
//               TextFormField(
//                 controller: phone,
//                 keyboardType: TextInputType.number,
//                 decoration: const InputDecoration(
//                     prefixIcon: const Icon(Icons.mobile_friendly_outlined),
//                     hintText: 'Enter Mobile No'),
//               ),
//               const SizedBox(
//                 height: 25.0,
//               ),
//               TextFormField(
//                 controller: password,
//                 obscureText: isShowPassword,
//                 decoration: InputDecoration(
//                     prefixIcon: const Icon(Icons.password),
//                     suffixIcon: GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           isShowPassword = !isShowPassword;
//                         });
//                       },
//                       child: const Icon(Icons.visibility),
//                     ),
//                     hintText: 'Enter Your  Password'),
//               ),
//               const SizedBox(
//                 height: 25.0,
//               ),
//               PrimaryButton(
//                   onPressed: () async {
//                     bool isValidated = signupValidation(
//                         email.text, password.text, name.text, phone.text);
//                     if (isValidated) {
//                       bool isSignedUp = await FirebaseAuthHelper.authHelper
//                           .signup(
//                               name.text, email.text, password.text, context);
//                       if (isSignedUp) {
//                         Fluttertoast.showToast(msg: 'Registerd Successfully');
//                         Routes.instance.push(Login(), context);
//                       }
//                     }
//                   },
//                   title: 'Sign Up'),
//               const SizedBox(
//                 height: 15.0,
//               ),
//               const Center(
//                 child: Text("Already have an account?"),
//               ),
//               const SizedBox(
//                 height: 12.0,
//               ),
//               Center(
//                 child: TextButton(
//                   onPressed: () {
//                     Routes.instance.push(Login(), context);
//                   },
//                   child: Text(
//                     'Go to  Login',
//                     style: TextStyle(color: Theme.of(context).primaryColor),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:e_commerce_app/constants/constants.dart';
import 'package:e_commerce_app/constants/routes.dart';
import 'package:e_commerce_app/firebase_helper/firebase_auth/firebase_auth_helper.dart';
import 'package:e_commerce_app/screens/auth_ui/login/login.dart';
import 'package:e_commerce_app/widgets/primary_buttons/primary_button.dart';
import 'package:e_commerce_app/widgets/top_titles/top_title.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController name = TextEditingController();
  bool isShowPassword = true;

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always, // Enable auto validation
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopTiles(
                    subtitle: 'Welcome to World of E-commerce!',
                    title: 'Create Account'),
                const SizedBox(
                  height: 15,
                ),
                const Center(
                    child: Icon(
                  Icons.account_circle_rounded,
                  size: 80,
                  color: Colors.redAccent,
                )),
                const SizedBox(
                  height: 35,
                ),
                TextFormField(
                  controller: name,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person), hintText: 'Enter Name'),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      hintText: 'E-mail'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email address';
                    } else if (!isValidEmail(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: phone,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      prefixIcon: const Icon(Icons.mobile_friendly_outlined),
                      hintText: 'Enter Mobile No'),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: password,
                  obscureText: isShowPassword,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isShowPassword = !isShowPassword;
                          });
                        },
                        child: const Icon(Icons.visibility),
                      ),
                      hintText: 'Enter Your  Password'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 6 || value.length > 10) {
                      return 'Password must be 6 to 10 characters long';
                    } else if (!RegExp(
                            r'^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+])[a-zA-Z0-9!@#$%^&*()_+]+$')
                        .hasMatch(value)) {
                      return 'Password must contain at least one digit, one special character, and letters';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const SizedBox(
                  height: 25.0,
                ),
                PrimaryButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      bool isValidated = signupValidation(
                        email.text,
                        password.text,
                        name.text,
                        phone.text,
                      );
                      if (isValidated) {
                        bool isSignedUp = await FirebaseAuthHelper.authHelper
                            .signup(
                                name.text, email.text, password.text, context);
                        if (isSignedUp) {
                          Fluttertoast.showToast(
                              msg: 'Registered Successfully');
                          Routes.instance.push(Login(), context);
                        }
                      }
                    }
                  },
                  title: 'Sign Up',
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Center(
                  child: Text("Already have an account?"),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Routes.instance.push(Login(), context);
                    },
                    child: Text(
                      'Go to  Login',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
