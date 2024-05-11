import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:kaapi_club/models/user_model.dart';

class DatabaseController extends GetxController {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;

  RxList<UserModel> userList = <UserModel>[].obs;

  Future<void> getUserList() async {
    isLoading.value = true;
    try {
      userList.clear();
      await db.collection("users").get().then(
            (value) => {
              userList.value = value.docs
                  .map(
                    (e) => UserModel.fromJson(
                      e.data(),
                    ),
                  )
                  .toList(),
            },
          );
    } catch (e) {
      log("Error from Db controller fetch user =>$e");
    }
    isLoading.value = false;
  }
}
