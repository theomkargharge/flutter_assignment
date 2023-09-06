import 'package:e_commerce_app/constants/theme.dart';
import 'package:e_commerce_app/firebase_helper/firebase_auth/firebase_auth_helper.dart';
import 'package:e_commerce_app/provdier/app_provider.dart';
import 'package:e_commerce_app/screens/auth_ui/welcome/welcome.dart';
import 'package:e_commerce_app/screens/custom_bottom_bar/custom_bottom.dart';
import 'package:e_commerce_app/screens/home/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  // Corrected invocation
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await Firebase.initializeApp(options: DefaultFirebaseConfig.platformOptions);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (create) => AppProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter',
        theme: themeData,
        home: StreamBuilder(
          stream: FirebaseAuthHelper.authHelper.getAuthChange,
          builder: (context, sanpshot) {
            if (sanpshot.hasData) {
              return const CusttomBottomBar();
            }
            return const Welcome();
          },
        ),
      ),
    );
  }
}
