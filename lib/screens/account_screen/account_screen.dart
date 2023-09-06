import 'package:e_commerce_app/firebase_helper/firebase_auth/firebase_auth_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provdier/app_provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    String imageURl = appProvider.getUserInformation.image ??
        'https://fastly.picsum.photos/id/237/200/300.jpg?hmac=TmmQSbShHz9CdQm0NkEjx1Dyh_Y984R9LpNrpvH2D_U';
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Account",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: Column(
              children: [
                imageURl.isEmpty
                    ? const Icon(
                        Icons.person_outline,
                        size: 120,
                      )
                    : CircleAvatar(
                        backgroundImage: NetworkImage(imageURl),
                        radius: 70,
                      ),
                Text(
                  '${appProvider.getUserInformation.name}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text('${appProvider.getUserInformation.email}'),
                const SizedBox(
                  height: 13,
                ),
              ],
            ),
          )),
          Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.shopping_bag_outlined),
                      title: const Text('Your Orders'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.favorite_outline),
                      title: const Text('Favourite'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.info_outline),
                      title: const Text('About us'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.support_outlined),
                      title: const Text('Support'),
                    ),
                    ListTile(
                      onTap: () {
                        FirebaseAuthHelper.authHelper.signOut();
                        setState(() {});
                      },
                      leading: const Icon(Icons.logout_outlined),
                      title: const Text('Log out'),
                    ),
                    const Text('Version 1.0.0')
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
