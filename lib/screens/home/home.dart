// import 'package:e_commerce_app/constants/routes.dart';
// import 'package:e_commerce_app/firebase_helper/firebase_firestroe/firebase_firestroe.dart';
// import 'package:e_commerce_app/models/category_model/category_model.dart';
// import 'package:e_commerce_app/models/product_models/product_models.dart';
// import 'package:e_commerce_app/provdier/app_provider.dart';
// import 'package:e_commerce_app/screens/category_view/category_view.dart';
// import 'package:e_commerce_app/screens/product_details/product_details.dart';
// import 'package:e_commerce_app/widgets/top_titles/top_title.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   List<CategoryModel> categoriesList = [];
//   List<ProductModel> productList = [];
//   bool isLoading = false;
//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       AppProvider appProvider =
//           Provider.of<AppProvider>(context, listen: false);
//       appProvider.getUserInforFirebase();
//       getCategoryList();
//       getProductList();
//     });

//     super.initState();
//   }

//   void getCategoryList() async {
//     setState(() {
//       isLoading = true;
//     });
//     categoriesList = await FirebaseFiresotreHelper.instance.getCategories();
//     setState(() {
//       isLoading = false;
//     });
//   }

//   void getProductList() async {
//     setState(() {
//       isLoading = true;
//     });
//     productList = await FirebaseFiresotreHelper.instance.getBestProducts();
//     productList.shuffle();
//     debugPrint(productList.toString());
//     setState(() {
//       isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return isLoading
//         ? Center(
//             child: Container(
//               height: 100,
//               width: 100,
//               alignment: Alignment.center,
//               child: const CircularProgressIndicator(),
//             ),
//           )
//         : Scaffold(
//             body: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const TopTiles(subtitle: '', title: 'E Commerce'),
//                         TextFormField(
//                           decoration:
//                               const InputDecoration(hintText: 'Search..'),
//                         )
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.all(12.0),
//                     child: Text(
//                       "Categories",
//                       style: TextStyle(
//                           fontSize: 18.0, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   categoriesList.isEmpty
//                       ? const Text('Categories are empty')
//                       : SingleChildScrollView(
//                           scrollDirection: Axis.horizontal,
//                           child: Row(
//                             children: categoriesList
//                                 .map(
//                                   (e) => Padding(
//                                     padding: const EdgeInsets.only(left: 8.0),
//                                     child: CupertinoButton(
//                                       padding: EdgeInsets.zero,
//                                       onPressed: () {
//                                         Routes.instance.push(
//                                             CategoryView(categoryModel: e),
//                                             context);
//                                       },
//                                       child: Card(
//                                         color: Colors.white,
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(20),
//                                         ),
//                                         elevation: 3.0,
//                                         child: SizedBox(
//                                           height: 100,
//                                           width: 100,
//                                           child: Image.network(e.image),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                                 .toList(),
//                           ),
//                         ),
//                   const Padding(
//                     padding: EdgeInsets.only(top: 15.0, right: 16.0, left: 12),
//                     child: Text(
//                       "Best Products",
//                       style: TextStyle(
//                           fontSize: 18.0, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 12.0,
//                   ),
//                   // productList.isEmpty
//                   //     ? Text('Product list is empty')
//                   //     :
//                   productList.isEmpty
//                       ? const Center(
//                           child: Text('Prodcut list is empty'),
//                         )
//                       : Padding(
//                           padding: const EdgeInsets.all(12.0),
//                           child: GridView.builder(
//                             padding: const EdgeInsets.only(bottom: 60),
//                             shrinkWrap: true,
//                             primary: false,
//                             itemCount: productList.length,
//                             gridDelegate:
//                                 const SliverGridDelegateWithFixedCrossAxisCount(
//                                     mainAxisSpacing: 20,
//                                     crossAxisSpacing: 20,
//                                     childAspectRatio: 0.7,
//                                     crossAxisCount: 2),
//                             itemBuilder: (context, index) {
//                               ProductModel singleProduct = productList[index];
//                               return Container(
//                                 decoration: BoxDecoration(
//                                     color: Colors.red.withOpacity(0.15),
//                                     borderRadius: BorderRadius.circular(10)),
//                                 child: Column(
//                                   children: [
//                                     const SizedBox(
//                                       height: 7,
//                                     ),
//                                     Image.network(
//                                       singleProduct.image,
//                                       height: 100,
//                                       width: 150,
//                                     ),
//                                     const SizedBox(
//                                       height: 5.0,
//                                     ),
//                                     Center(
//                                       child: Text(
//                                         singleProduct.name,
//                                         style: const TextStyle(
//                                             fontSize: 18.0,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                     ),
//                                     Text('Price \$ ${singleProduct.price}'),
//                                     const SizedBox(
//                                       height: 12,
//                                     ),
//                                     SizedBox(
//                                       height: 45,
//                                       width: 100,
//                                       child: OutlinedButton(
//                                         onPressed: () {
//                                           Routes.instance.push(
//                                               ProductDetails(
//                                                   singleProduct: singleProduct),
//                                               context);
//                                         },
//                                         style: OutlinedButton.styleFrom(
//                                             foregroundColor: Colors.red,
//                                             side: const BorderSide(
//                                                 color: Colors.redAccent,
//                                                 width: 2)),
//                                         child: const Text(
//                                           'Buy',
//                                           style: TextStyle(color: Colors.red),
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                   // const SizedBox(
//                   //   height: 80,
//                   // )
//                 ],
//               ),
//             ),
//           );
//   }
// }

// // List<String> categoriesList = [
// //   "https://cdn.dxomark.com/wp-content/uploads/medias/post-39867/apple_iphone_11.jpg",
// //   "https://media-ik.croma.com/prod/https://media.croma.com/image/upload/v1685969130/Croma%20Assets/Computers%20Peripherals/Laptop/Images/256606_ufqgl3.png?tr=w-640",
// //   "https://support.apple.com/library/APPLE/APPLECARE_ALLGEOS/SP789/imac-4k-21in-2019.png",
// //   "https://media-ik.croma.com/prod/https://media.croma.com/image/upload/v1685965880/Croma%20Assets/Computers%20Peripherals/Tablets%20and%20iPads/Images/264336_lik291.png?tr=w-640",
// //   "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/airpods-max-select-pink-202011?wid=470&hei=556&fmt=png-alpha&.v=1604022365000",
// // ];

// // List<ProductModel> bestProducts = [
// //   ProductModel(
// //     image:
// //         "https://m.media-amazon.com/images/I/71E5zB1qbIL._AC_UF1000,1000_QL80_.jpg",
// //     id: '1',
// //     name: 'I Phone',
// //     price: '999',
// //     description:
// //         "I PhoneI PhoneI PhoneI PhoneI PhoneI PhoneI PhoneI PhoneI PhoneI Phone",
// //     status: 'pending',
// //     isFavourites: false,
// //   ),
// //   ProductModel(
// //     image:
// //         "https://rukminim2.flixcart.com/image/850/1000/kg8avm80/mobile/j/f/9/apple-iphone-12-dummyapplefsn-original-imafwg8dkyh2zgrh.jpeg?q=90",
// //     id: '2',
// //     name: 'I Phone',
// //     price: '999',
// //     description:
// //         "I PhoneI PhoneI PhoneI PhoneI PhoneI PhoneI PhoneI PhoneI PhoneI Phone",
// //     status: 'pending',
// //     isFavourites: false,
// //   ),
// //   ProductModel(
// //     image: "https://www.i-mob.gr/photos/iPhone11Yellow_1.jpg",
// //     id: '3',
// //     name: 'I Phone',
// //     price: '999',
// //     description:
// //         "I PhoneI PhoneI PhoneI PhoneI PhoneI PhoneI PhoneI PhoneI PhoneI Phone",
// //     status: 'pending',
// //     isFavourites: false,
// //   ),
// //   ProductModel(
// //     image:
// //         "https://stall.pk/wp-content/uploads/2022/02/apple-iphone-11-Pakistan-Stall.pk_.jpg",
// //     id: '4',
// //     name: 'I Phone',
// //     price: '999',
// //     description:
// //         "I PhoneI PhoneI PhoneI PhoneI PhoneI PhoneI PhoneI PhoneI PhoneI Phone",
// //     status: 'pending',
// //     isFavourites: false,
// //   ),
// //   ProductModel(
// //     image:
// //         "https://rukminim1.flixcart.com/image/850/1000/xif0q/mobile/k/s/t/-original-imaghxengzjc2djt.jpeg?q=90",
// //     id: '5',
// //     name: 'I Phone',
// //     price: '999',
// //     description:
// //         "I PhoneI PhoneI PhoneI PhoneI PhoneI PhoneI PhoneI PhoneI PhoneI Phone",
// //     status: 'pending',
// //     isFavourites: false,
// //   ),
// //   ProductModel(
// //     image:
// //         "https://cdn.jagofon.com/model/dtfR5n1utnrdtgXgusrHQvfY30uX6rtqxWS8PpQU.jpg",
// //     id: '6',
// //     name: 'I Phone',
// //     price: '999',
// //     description:
// //         "I PhoneI PhoneI PhoneI PhoneI PhoneI PhoneI PhoneI PhoneI PhoneI Phone",
// //     status: 'pending',
// //     isFavourites: false,
// //   ),
// // ];

import 'package:e_commerce_app/constants/routes.dart';
import 'package:e_commerce_app/firebase_helper/firebase_firestroe/firebase_firestroe.dart';
import 'package:e_commerce_app/models/category_model/category_model.dart';
import 'package:e_commerce_app/models/product_models/product_models.dart';
import 'package:e_commerce_app/provdier/app_provider.dart';
import 'package:e_commerce_app/screens/category_view/category_view.dart';
import 'package:e_commerce_app/screens/product_details/product_details.dart';
import 'package:e_commerce_app/widgets/top_titles/top_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
// Import the Swiper package

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categoriesList = [];
  List<ProductModel> productList = [];
  bool isLoading = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      AppProvider appProvider =
          Provider.of<AppProvider>(context, listen: false);
      appProvider.getUserInforFirebase();
      getCategoryList();
      getProductList();
    });

    super.initState();
  }

  void getCategoryList() async {
    setState(() {
      isLoading = true;
    });
    categoriesList = await FirebaseFiresotreHelper.instance.getCategories();
    setState(() {
      isLoading = false;
    });
  }

  void getProductList() async {
    setState(() {
      isLoading = true;
    });
    productList = await FirebaseFiresotreHelper.instance.getBestProducts();
    productList.shuffle();
    debugPrint(productList.toString());
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: Container(
              height: 100,
              width: 100,
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TopTiles(subtitle: '', title: 'E Commerce'),
                        TextFormField(
                          decoration:
                              const InputDecoration(hintText: 'Search..'),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Categories",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  categoriesList.isEmpty
                      ? const Text('Categories are empty')
                      : VxSwiper.builder(
                          autoPlay: true,
                          aspectRatio: 16 / 4,
                          height: 200, // Use the Swiper widget here
                          itemCount: categoriesList.length,
                          itemBuilder: (context, index) {
                            CategoryModel category = categoriesList[index];
                            return Container(
                              height: 500,
                              width: 300,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(.15),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.red)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    Routes.instance.push(
                                        CategoryView(categoryModel: category),
                                        context);
                                  },
                                  child: Image.network(
                                    category.image,
                                    // height: 400,
                                    // width: 200,
                                    fit: BoxFit.fill,
                                  )
                                      .box
                                      .clip(Clip.antiAlias)
                                      .color(Colors.white)
                                      .make(),
                                ),
                              ),
                            );
                          },
                        ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0, right: 16.0, left: 12),
                    child: Text(
                      "Best Products",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  productList.isEmpty
                      ? const Center(
                          child: Text('Prodcut list is empty'),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: GridView.builder(
                            padding: const EdgeInsets.only(bottom: 60),
                            shrinkWrap: true,
                            primary: false,
                            itemCount: productList.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 20,
                                    crossAxisSpacing: 20,
                                    childAspectRatio: 0.7,
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              ProductModel singleProduct = productList[index];
                              return Container(
                                decoration: BoxDecoration(
                                    color: Colors.red.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Image.network(
                                      singleProduct.image,
                                      height: 100,
                                      width: 150,
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    Center(
                                      child: Text(
                                        singleProduct.name,
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text('Price \$ ${singleProduct.price}'),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    SizedBox(
                                      height: 45,
                                      width: 100,
                                      child: OutlinedButton(
                                        onPressed: () {
                                          Routes.instance.push(
                                              ProductDetails(
                                                  singleProduct: singleProduct),
                                              context);
                                        },
                                        style: OutlinedButton.styleFrom(
                                            foregroundColor: Colors.red,
                                            side: const BorderSide(
                                                color: Colors.redAccent,
                                                width: 2)),
                                        child: const Text(
                                          'Buy',
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                ],
              ),
            ),
          );
  }
}
