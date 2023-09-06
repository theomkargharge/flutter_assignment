// import 'package:e_commerce_app/constants/constants.dart';
// import 'package:e_commerce_app/constants/routes.dart';
// import 'package:e_commerce_app/models/product_models/product_models.dart';
// import 'package:e_commerce_app/provdier/app_provider.dart';
// import 'package:e_commerce_app/screens/cart_screen/cart_screen.dart';
// import 'package:e_commerce_app/screens/favourite_screen/favourite_screen_item.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ProductDetails extends StatefulWidget {
//   final ProductModel singleProduct;
//   const ProductDetails({super.key, required this.singleProduct});

//   @override
//   State<ProductDetails> createState() => _ProductDetailsState();
// }

// class _ProductDetailsState extends State<ProductDetails> {
//   int qty = 1;
//   @override
//   Widget build(BuildContext context) {
//     AppProvider appProvider = Provider.of<AppProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//               onPressed: () {
//                 Routes.instance.push(const CartScreen(), context);
//               },
//               icon: const Icon(Icons.shopping_cart))
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.only(left: 12.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: Image.network(
//                   widget.singleProduct.image,
//                   height: 400,
//                   width: 400,
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     widget.singleProduct.name,
//                     style: const TextStyle(
//                         fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   IconButton(
//                     onPressed: () {
//                       setState(() {
//                         widget.singleProduct.isFav =
//                             !widget.singleProduct.isFav;
//                       });
//                       if (widget.singleProduct.isFav) {
//                         appProvider.addFavouriteProduct(widget.singleProduct);
//                       } else {
//                         appProvider
//                             .removeFavouriteProduct(widget.singleProduct);
//                       }
//                     },
//                     icon: Icon(appProvider.getFavouriteProductList
//                             .contains(widget.singleProduct)
//                         ? Icons.favorite
//                         : Icons.favorite_border),
//                   ),
//                 ],
//               ),
//               Text(
//                 widget.singleProduct.description,
//                 style: const TextStyle(fontWeight: FontWeight.w500),
//               ),
//               const SizedBox(
//                 height: 11,
//               ),
//               Row(
//                 // crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   CupertinoButton(
//                     onPressed: () {
//                       setState(() {
//                         if (qty >= 1) {
//                           qty--;
//                         }
//                       });
//                     },
//                     child: const CircleAvatar(
//                       maxRadius: 12,
//                       child: Icon(
//                         Icons.remove,
//                       ),
//                     ),
//                   ),
//                   Text(
//                     qty.toString(),
//                     style: const TextStyle(
//                         fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   CupertinoButton(
//                     onPressed: () {
//                       setState(() {
//                         qty++;
//                       });
//                     },
//                     child: const CircleAvatar(
//                       maxRadius: 12,
//                       child: Icon(
//                         Icons.add,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   OutlinedButton(
//                     onPressed: () {
//                       ProductModel productModel =
//                           widget.singleProduct.copyWith(qty: qty);
//                       appProvider.addCartProduct(productModel);
//                       showMessage('Added to Cart');
//                     },
//                     style: OutlinedButton.styleFrom(
//                         side: const BorderSide(color: Colors.red)),
//                     child: const Text(
//                       'ADD TO CART',
//                       style: TextStyle(color: Colors.red),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 100,
//                   ),
//                   SizedBox(
//                     height: 39,
//                     width: 130,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Routes.instance.push(const FavouriteScreen(), context);
//                       },
//                       child: const Text('BUY'),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 50,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:e_commerce_app/constants/constants.dart';
import 'package:e_commerce_app/constants/routes.dart';
import 'package:e_commerce_app/models/product_models/product_models.dart';
import 'package:e_commerce_app/provdier/app_provider.dart';
import 'package:e_commerce_app/screens/cart_screen/cart_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel singleProduct;
  const ProductDetails({Key? key, required this.singleProduct})
      : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int qty = 1;

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Routes.instance.push(const CartScreen(), context);
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  widget.singleProduct.image,
                  height: 400,
                  width: 400,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.singleProduct.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        widget.singleProduct.isFav =
                            !widget.singleProduct.isFav;
                      });
                      if (widget.singleProduct.isFav) {
                        appProvider.addFavouriteProduct(widget.singleProduct);
                      } else {
                        appProvider
                            .removeFavouriteProduct(widget.singleProduct);
                      }
                    },
                    icon: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          appProvider.getFavouriteProductList
                                  .contains(widget.singleProduct)
                              ? Icons.favorite
                              : Icons.favorite_border,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                widget.singleProduct.description,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CupertinoButton(
                    onPressed: () {
                      setState(() {
                        if (qty >= 1) {
                          qty--;
                        }
                      });
                    },
                    child: const CircleAvatar(
                      maxRadius: 12,
                      child: Icon(
                        Icons.remove,
                      ),
                    ),
                  ),
                  Text(
                    qty.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CupertinoButton(
                    onPressed: () {
                      setState(() {
                        qty++;
                      });
                    },
                    child: const CircleAvatar(
                      maxRadius: 12,
                      child: Icon(
                        Icons.add,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      ProductModel productModel =
                          widget.singleProduct.copyWith(qty: qty);
                      appProvider.addCartProduct(productModel);
                      showMessage('Added to Cart');
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.red),
                    ),
                    child: const Text(
                      'ADD TO CART',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  SizedBox(
                    height: 39,
                    width: 130,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('BUY'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
