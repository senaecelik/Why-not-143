import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:why_not_143_team/route/route_constant.dart';
import 'package:why_not_143_team/utils/show_snack_bar.dart';
import 'package:why_not_143_team/utils/show_toast_message.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  FirebaseAuthMethods(this._auth, this._firestore);

  User get user => _auth.currentUser!;

  //State Persistence
  Stream<User?> get authState => _auth.authStateChanges();

  //FirebaseAuth
  //Email sign uo
  Future<User?> signUpWithEmail({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      var user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (!_auth.currentUser!.emailVerified) {
        await sendEmailVerification(context);
        Navigator.pushNamed(context, RouteConstant.loginScreenRoute);
      } else {
        Navigator.pushNamed(context, RouteConstant.homeScreenRoute);
      }
      await sendEmailVerification(context);
      await _firestore.collection("Person").doc(user.user!.uid).set({
        'email': email,
        'name': name,
        'uid': FirebaseAuth.instance.currentUser!.uid
      });
      return user.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showToast(context, 'Şifre çok zayıf.');
      } else if (e.code == 'email-already-in-use') {
        showToast(context, 'Bu e-posta için zaten kayıtlı bir hesap var.');
      }
      showToast(context, e.message!);
    }
    return null;
  }

  //EMAIL VERIFICATION
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showToast(context, "Email doğrulama gönderildi!");
    } on FirebaseAuthException catch (e) {
      showToast(context, e.message!);
    }
  }

  //Email login
  Future<void> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      if (!_auth.currentUser!.emailVerified) {
        await sendEmailVerification(context);
        Navigator.pushNamed(context, RouteConstant.loginScreenRoute);
      } else {
        Navigator.pushNamed(context, RouteConstant.homeScreenRoute);
      }
    } on FirebaseAuthException catch (e) {
      showToast(context, e.message!);
    }
  }

  //Google sign in
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        if (userCredential.user != null) {
          if (userCredential.additionalUserInfo!.isNewUser) {}
        }
        Navigator.pushNamed(context, RouteConstant.homeScreenRoute);
      }
    } on FirebaseAuthException catch (e) {
      showToast(context, e.message!);
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      await GoogleSignIn().signOut();
    } on FirebaseAuthException catch (e) {
      showToast(context, e.message!); // Displaying the error message
    }
  }

  Future<void> resetPassword(String email, BuildContext context) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      showToast(context, "Gönderildi");
    } on FirebaseAuthException catch (e) {
      showToast(context, e.message!);
    }
  }

  Future<void> anonymously(BuildContext context) async {
    try {
      await _auth.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      showToast(context, e.message!);
    }
  }
}
