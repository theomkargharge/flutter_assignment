import 'package:e_commerce_app/provdier/app_provider.dart';
import 'package:e_commerce_app/screens/cart_screen/widgets/single_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int qty = 1;
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart Screen",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: appProvider.getCartProductList.isEmpty
          ? const Center(child: Text('Data is Empty'))
          : ListView.builder(
              itemCount: appProvider.getCartProductList.length,
              padding: const EdgeInsets.all(12),
              itemBuilder: (context, index) {
                return SingleCartItem(
                  sigleProduct: appProvider.getCartProductList[index],
                );
              },
            ),
    );
  }
}
