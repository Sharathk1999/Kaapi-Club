import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:kaapi_club/models/user_model.dart';

class ProfileController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;

  RxBool isLoading = false.obs;
  Rx<UserModel> currentUser = UserModel().obs;

  @override
  void onInit() async {
    super.onInit();
    await getUserInfo();
  }

  Future<void> getUserInfo() async {
    await db.collection("users").doc(auth.currentUser?.uid).get().then(
          (user) => {
            currentUser.value = UserModel.fromJson(user.data()!),
          },
        );
  }

  Future<void> updateProfile(
    String name,
    String imgUrl,
    String bio,
    String mobileNumber,
    
  ) async {
    isLoading.value=true;
  try {
    final imgLink = await uploadImgToFirebase(imgUrl);
    final updatedUser = UserModel(
      name: name,
      profileImg: imgLink,
      bio: bio,
      mobileNumber: mobileNumber,
    );
    await db.collection("users").doc(auth.currentUser!.uid).set(
      updatedUser.toJson(),
    );
  } catch (e) {
    log(e.toString());
  }
    isLoading.value=false;
  
   
   
  }

  Future<String> uploadImgToFirebase(String imgPath)async{
     final path = "files/$imgPath";
    final file = File(imgPath);
    if (imgPath != "") {
       try {
      
    final storageRef = storage.ref().child(path).putFile(file);
    final uploadTask = await storageRef.whenComplete(() => {});
    final downloadImgUrl = await uploadTask.ref.getDownloadURL();
    log("Download url of image =>$downloadImgUrl");
    return downloadImgUrl;
    } catch (e) {
      log("Error updating profile=> $e");

    }
    }
    return "";
   
  }
}
