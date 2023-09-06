import 'package:e_commerce_app/constants/constants.dart';
import 'package:e_commerce_app/models/product_models/product_models.dart';
import 'package:e_commerce_app/provdier/app_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleCartItem extends StatefulWidget {
  final ProductModel sigleProduct;
  const SingleCartItem({super.key, required this.sigleProduct});

  @override
  State<SingleCartItem> createState() => _SingleCartItemState();
}

class _SingleCartItemState extends State<SingleCartItem> {
  int qty = 1;
  @override
  void initState() {
    // TODO: implement initState
    qty = widget.sigleProduct.qty ?? 1;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red, width: 3),
      ),
      child: Row(children: [
        Expanded(
          child: Container(
            height: 150,
            color: Colors.red.withOpacity(0.5),
            child: Image.network(widget.sigleProduct.image),
          ),
        ),
        Expanded(
          flex: 2,
          child: SizedBox(
            height: 150,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            widget.sigleProduct.name,
                            style: const TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          Row(
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
                                    fontSize: 18, fontWeight: FontWeight.bold),
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
                        ],
                      ),
                      Text(
                        '\$ ${widget.sigleProduct.price}',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  CupertinoButton(
                    onPressed: () {
                      AppProvider appProvider =
                          Provider.of(context, listen: false);
                      appProvider.removeCartProduct(widget.sigleProduct);
                      showMessage('Deleted SuccessFully');
                    },
                    child: const CircleAvatar(
                      maxRadius: 13,
                      child: Icon(
                        Icons.delete,
                        size: 17,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // color: Colors.red.withOpacity(0.5),
          ),
        ),
      ]),
    );
  }
}
