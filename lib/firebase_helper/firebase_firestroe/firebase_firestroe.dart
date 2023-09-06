import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/constants/constants.dart';
import 'package:e_commerce_app/models/category_model/category_model.dart';
import 'package:e_commerce_app/models/product_models/product_models.dart';
import 'package:e_commerce_app/models/user_model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFiresotreHelper {
  static FirebaseFiresotreHelper instance = FirebaseFiresotreHelper();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<List<CategoryModel>> getCategories() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFirestore.collection('Categories').get();
      List<CategoryModel> categoriesList = querySnapshot.docs
          .map((e) => CategoryModel.fromJson(e.data()))
          .toList();
      return categoriesList;
    } catch (e) {
      showMessage(e.toString());
      return [];
    }
  }

  Future<List<ProductModel>> getBestProducts() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFirestore
              .collectionGroup('products')
              .get(); // Add this line
      List<ProductModel> productList = querySnapshot.docs
          .map((e) => ProductModel.fromJson(e.data()))
          .toList();
      print("Parsed ${productList.length} products"); // Add this line
      return productList;
    } catch (e) {
      showMessage(e.toString());
      return [];
    }
  }

  Future<List<ProductModel>> getCategoryViewProducts(String id) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFirestore
              .collection('Categories')
              .doc(id)
              .collection('products')
              .get(); // Add this line
      List<ProductModel> productList = querySnapshot.docs
          .map((e) => ProductModel.fromJson(e.data()))
          .toList(); // Add this line
      return productList;
    } catch (e) {
      showMessage(e.toString());
      return [];
    }
  }

  Future<UserModel> getUserInformation() async {
    DocumentSnapshot<Map<String, dynamic>> querySnapshot =
        await _firebaseFirestore
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .get();

    return UserModel.fromJson(querySnapshot.data()!);
  }
}
