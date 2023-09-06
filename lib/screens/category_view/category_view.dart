import 'package:e_commerce_app/constants/routes.dart';
import 'package:e_commerce_app/firebase_helper/firebase_firestroe/firebase_firestroe.dart';
import 'package:e_commerce_app/models/category_model/category_model.dart';
import 'package:e_commerce_app/models/product_models/product_models.dart';
import 'package:e_commerce_app/screens/product_details/product_details.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
  final CategoryModel categoryModel;
  const CategoryView({super.key, required this.categoryModel});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  int qty = 1;
  List<ProductModel> productList = [];
  bool isLoading = false;
  void getProductList() async {
    setState(() {
      isLoading = true;
    });
    productList = await FirebaseFiresotreHelper.instance
        .getCategoryViewProducts(widget.categoryModel.id);
    productList.shuffle();
    debugPrint(productList.toString());
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading
            ? Center(
                child: Container(
                  height: 100,
                  width: 100,
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: kToolbarHeight * 1,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const BackButton(),
                            Text(
                              widget.categoryModel.name,
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                    // TopTiles(
                    //     subtitle: '',
                    //     title: widget.categoryModel.name,
                    //   ),
                    productList.isEmpty
                        ? const Center(
                            child: Text('Prodcut list is empty'),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: GridView.builder(
                              padding: EdgeInsets.zero,
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
                                      Text(
                                        singleProduct.name,
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
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
                                                    singleProduct:
                                                        singleProduct),
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
                          )
                  ],
                ),
              ));
  }
}
