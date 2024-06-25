import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/features/authentication/models/user_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

/// Repository class for user-related operations
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to Firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("User").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw EFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw EFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw EPlatformException(e.code).message;
    } catch (e) {
      throw 'Some thing went wrong. Please try again';
    }
  }
}
