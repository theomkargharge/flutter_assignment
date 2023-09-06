// import 'package:e_commerce_app/constants/constants.dart';
// import 'package:e_commerce_app/constants/routes.dart';
// import 'package:e_commerce_app/firebase_helper/firebase_auth/firebase_auth_helper.dart';
// import 'package:e_commerce_app/screens/auth_ui/signup/singup.dart';
// import 'package:e_commerce_app/screens/custom_bottom_bar/custom_bottom.dart';
// import 'package:e_commerce_app/widgets/primary_buttons/primary_button.dart';
// import 'package:e_commerce_app/widgets/top_titles/top_title.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class Login extends StatefulWidget {
//   const Login({super.key});
//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   TextEditingController email1 = TextEditingController();
//   TextEditingController password1 = TextEditingController();
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
//                   subtitle: 'Welcome Back to E-Commerce App', title: 'Login'),
//               const SizedBox(
//                 height: 55,
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
//                 keyboardType: TextInputType.emailAddress,
//                 controller: email1,
//                 decoration: const InputDecoration(
//                     prefixIcon: Icon(Icons.email_outlined),
//                     hintText: 'Enter Registered Email'),
//               ),
//               const SizedBox(
//                 height: 20.0,
//               ),
//               TextFormField(
//                 controller: password1,
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
//                     hintText: 'Enter Your Password'),
//               ),
//               const SizedBox(
//                 height: 25.0,
//               ),
//               PrimaryButton(
//                   onPressed: () async {
//                     bool isValidated =
//                         loginValidation(email1.text, password1.text);
//                     if (isValidated) {
//                       bool isLogined = await FirebaseAuthHelper.authHelper
//                           .login(email1.text, password1.text, context);
//                       if (isLogined) {
//                         Fluttertoast.showToast(msg: "Login Successfully");
//                         Routes.instance
//                             .pushandRemoveUntil(CusttomBottomBar(), context);
//                       }
//                     }
//                   },
//                   title: 'Login'),
//               const SizedBox(
//                 height: 15.0,
//               ),
//               const Center(
//                 child: Text("Don't have an account?"),
//               ),
//               const SizedBox(
//                 height: 12.0,
//               ),
//               Center(
//                 child: TextButton(
//                   onPressed: () {
//                     Routes.instance.push(const SignUp(), context);
//                   },
//                   child: Text(
//                     'Create an account',
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

// import 'package:flutter/material.dart';

// class Login extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: LoginScreen(),
//     );
//   }
// }

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   String? _email;
//   String? _password;
//   bool isShowPassword = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Form(
//         key: _formKey,
//         autovalidateMode:
//             AutovalidateMode.always, // Enable real-time validation
//         child: SingleChildScrollView(
//           padding: EdgeInsets.all(12.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // ... your existing widgets ...

//               TextFormField(
//                 keyboardType: TextInputType.emailAddress,
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.email_outlined),
//                   hintText: 'Enter Registered Email',
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter your email address';
//                   } else if (!isValidEmail(value)) {
//                     return 'Please enter a valid email address';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _email = value;
//                 },
//               ),
//               SizedBox(
//                 height: 20.0,
//               ),
//               TextFormField(
//                 controller: _passwordController,
//                 obscureText: isShowPassword,
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.password),
//                   suffixIcon: GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         isShowPassword = !isShowPassword;
//                       });
//                     },
//                     child: Icon(Icons.visibility),
//                   ),
//                   hintText: 'Enter Your Password',
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter your password';
//                   } else if (value.length < 6) {
//                     return 'Password must be at least 6 characters';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _password = value;
//                 },
//               ),

//               // ... your existing widgets ...

//               ElevatedButton(
//                 onPressed: () async {
//                   if (_formKey.currentState!.validate()) {
//                     _formKey.currentState!.save();
//                     // Perform login with _email and _password
//                     // For example, you can use Firebase Authentication here
//                     print('Email: $_email');
//                     print('Password: $_password');
//                   }
//                 },
//                 child: Text('Login'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   bool isValidEmail(String email) {
//     // Simple email validation using regex
//     final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
//     return emailRegex.hasMatch(email);
//   }
// }

// import 'package:e_commerce_app/constants/constants.dart';
import 'package:e_commerce_app/constants/routes.dart';
import 'package:e_commerce_app/firebase_helper/firebase_auth/firebase_auth_helper.dart';
import 'package:e_commerce_app/screens/auth_ui/signup/singup.dart';
import 'package:e_commerce_app/screens/custom_bottom_bar/custom_bottom.dart';
import 'package:e_commerce_app/widgets/primary_buttons/primary_button.dart';
import 'package:e_commerce_app/widgets/top_titles/top_title.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController email1 = TextEditingController();
  TextEditingController password1 = TextEditingController();
  bool isShowPassword = true;

  bool isValidEmail(String email) {
    // Simple email validation using regex
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
                    subtitle: 'Welcome Back to E-Commerce App', title: 'Login'),
                const SizedBox(
                  height: 55,
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
                  keyboardType: TextInputType.emailAddress,
                  controller: email1,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      hintText: 'Enter Registered Email'),
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
                  controller: password1,
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
                      hintText: 'Enter Your Password'),
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
                  height: 25.0,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25.0,
                ),
                PrimaryButton(
                    onPressed: () async {
                      // Validate the form before performing login
                      if (_formKey.currentState!.validate()) {
                        bool isLogined = await FirebaseAuthHelper.authHelper
                            .login(email1.text, password1.text, context);
                        if (isLogined) {
                          Fluttertoast.showToast(msg: "Login Successfully");
                          Routes.instance
                              .pushandRemoveUntil(CusttomBottomBar(), context);
                        }
                      }
                    },
                    title: 'Login'),
                const SizedBox(
                  height: 15.0,
                ),
                const Center(
                  child: Text("Don't have an account?"),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Routes.instance.push(const SignUp(), context);
                    },
                    child: Text(
                      'Create an account',
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
