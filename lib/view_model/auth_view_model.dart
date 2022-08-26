import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce1/models/user_model.dart';
import 'package:ecommerce1/views/home/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  TextEditingController? emailContoller;
  TextEditingController? passContoller;
  TextEditingController? nameContoller;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CollectionReference userRef = FirebaseFirestore.instance.collection('users');

  GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;
  @override
  void onInit() {
    emailContoller = TextEditingController();
    passContoller = TextEditingController();
    nameContoller = TextEditingController();
    super.onInit();
  }

  Future<void> signUp() async {
    await firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailContoller!.text, password: passContoller!.text)
        .then((value) {
      if (value != null) {
        UserModel user = UserModel(
            name: nameContoller!.text,
            id: value.user!.uid,
            pasword: passContoller!.text,
            email: emailContoller!.text);
        userRef.doc(value.user!.uid).set(user.toMap()).then((value) {
          Get.snackbar('Sucsses', 'Signed Up');
        });
      }
    }).catchError((e) {
      Get.snackbar('Erorr', e.toString(),
          backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
    });
  }

  Future<void> signIn() async {
    await firebaseAuth
        .signInWithEmailAndPassword(
            email: emailContoller!.text, password: passContoller!.text)
        .then((value) {
      if (value != null) {
        Get.snackbar('Sucess', 'Signed in sucssesfully');
        Get.off(HomeView());
      }
    }).catchError((e) {
      Get.snackbar('Erorr', e.toString(),
          backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
    });
  }

  void SignInWithGoogle() async {
    googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      UserCredential result =
          await firebaseAuth.signInWithCredential(authCredential);
      User? user = result.user;

      if (result != null) {
        Get.offAll(HomeView());
        
      }
    }
  }
}
