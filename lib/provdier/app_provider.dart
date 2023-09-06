import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/constants/constants.dart';
import 'package:e_commerce_app/firebase_helper/firebase_firestroe/firebase_firestroe.dart';
import 'package:e_commerce_app/firebase_helper/firebase_storage/firebase_storage_helper.dart';
import 'package:e_commerce_app/models/product_models/product_models.dart';
import 'package:e_commerce_app/models/user_model/user_model.dart';
import 'package:flutter/cupertino.dart';

class AppProvider with ChangeNotifier {
  List<ProductModel> _cartProductList = [];

  UserModel? _userModel;

  UserModel get getUserInformation => _userModel!;

  void addCartProduct(ProductModel productModel) {
    _cartProductList.add(productModel);
    notifyListeners();
  }

  void removeCartProduct(ProductModel productModel) {
    _cartProductList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel> get getCartProductList => _cartProductList;

  List<ProductModel> _favouriteProductList = [];

  void addFavouriteProduct(ProductModel productModel) {
    _favouriteProductList.add(productModel);
    notifyListeners();
  }

  void removeFavouriteProduct(ProductModel productModel) {
    _favouriteProductList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel> get getFavouriteProductList => _favouriteProductList;

  //user information
  void getUserInforFirebase() async {
    _userModel = await FirebaseFiresotreHelper.instance.getUserInformation();

    debugPrint(_userModel.toString());
    notifyListeners();
  }

  void updateUserInfoFirebase(
      BuildContext context, UserModel userModel, File? file) async {
    if (file == null) {
      showLoaderDialog(context);

      await FirebaseFirestore.instance
          .collection('users')
          .doc(_userModel!.id)
          .set(_userModel!.toJson());
      Navigator.of(context).pop();
    } else {
      String imageUrl =
          await FirebaseStorageHelper.instance.uplaoadUserImage(file);
      _userModel = userModel.copywith(image: imageUrl);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(_userModel!.id)
          .set(_userModel!.toJson());
      notifyListeners();
      showMessage('Successfully updated profile');
      Navigator.of(context).pop();
    }
  }
}
