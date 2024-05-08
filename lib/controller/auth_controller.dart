import 'dart:developer';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaapi_club/core/custom_snackbar.dart';
import 'package:kaapi_club/models/user_model.dart';

class AuthController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  RxBool isLoading = false.obs;

  Future<void> login(String email, String password,BuildContext context) async {
    isLoading.value = true;
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // ignore: use_build_context_synchronously
      showAwesomeSnackBar(context, "You have successfully logged in...", "User Login ", ContentType.success);
      Get.offAllNamed("/homePage");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
      }
    }
    isLoading.value = false;
  }

  Future<void> signUpUser(String email, String password,String name, BuildContext context) async {
    isLoading.value = true;
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await createUser(name, email);
      // ignore: use_build_context_synchronously
      showAwesomeSnackBar(context, "Your Account Creation Successful", "Account Creation", ContentType.success);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
        // ignore: use_build_context_synchronously
        showAwesomeSnackBar(context, "Weak Password", "Create a strong password", ContentType.warning);
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }
    } catch (e) {
      log(e.toString());
    }
    isLoading.value = false;
  }

  Future<void> signOut() async {
    await auth.signOut();
    Get.offAllNamed("/authPage");
  }

  Future<void> createUser(String name, String email)async{
     var newUser = UserModel(
      name: name,
      email: email,
      id: auth.currentUser!.uid,
     );

     try {
       await db.collection("users").doc(auth.currentUser?.uid).set(newUser.toJson(),);
     } catch (e) {
       log("Error log from create user and error => $e");
     }
  }
}
