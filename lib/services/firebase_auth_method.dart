import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:why_not_143_team/route/route_constant.dart';
import 'package:why_not_143_team/utils/show_toast_message.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  FirebaseAuthMethods(this._auth, this._firestore);

  /*FirebaseAuthException içerisinde bazı error code lar var fakat ingilizce 
    e.code == 'weak-password' ise şifre zayıf yazıyoruz bunun gibi özelliştiriyoruz.
    e.code == 'weak-password'

    Şu referans olabilir -> https://gist.github.com/nikhilmufc7/6b74a3c12a6e2d3284942d40ff583e37
  
   */
  User get user => _auth.currentUser!;

  //State Persistence
  Stream<User?> get authState => _auth.authStateChanges();

  //FirebaseAuth
  //Email sign uo
  Future<User?> signUpWithEmail({
    required String displayName,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      var user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (!_auth.currentUser!.emailVerified) {
        await sendEmailVerification(context);
        Navigator.pushReplacementNamed(context, RouteConstant.loginScreenRoute);
      } else {
        Navigator.pushNamedAndRemoveUntil(context,
            RouteConstant.homeScreenRoute, (Route<dynamic> route) => false);
      }
      await sendEmailVerification(context);
      await _firestore.collection("Person").doc(user.user!.uid).set({
        'email': email,
        'displayName': displayName,
        'uid': FirebaseAuth.instance.currentUser!.uid
      });
      await user.user!.updateDisplayName(displayName);
      await user.user!.reload();
      return user.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showToast(context, 'Şifre çok zayıf.');
      } else if (e.code == 'email-already-in-use') {
        showToast(context, 'Bu e-posta için zaten kayıtlı bir hesap var.');
      } else if (e.code == 'invalid-email') {
        showToast(context, "Lütfen geçerli bir e-posta adresi girin");
      }
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
        Navigator.pushReplacementNamed(context, RouteConstant.homeScreenRoute);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        showToast(context, 'Lütfen geçerli bir e-posta adresi giriniz');
      } else if (e.code == 'wrong-password') {
        showToast(context, 'Yanlış şifre, lütfen tekrar dene');
      } else if (e.code == 'user-not-found') {
        showToast(context, 'Kayıtlı e-posta adresi bulunamadı');
      } else if (e.code == 'user-disabled') {
        showToast(context, 'Böyle bir kullanıcı kaydı bulunamadı');
      } else if (e.code == 'operation-not-allowed') {
        showToast(context, 'Böyle bir kullanıcı kaydı bulunamadı');
      }
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
        Navigator.pushNamedAndRemoveUntil(context,
            RouteConstant.homeScreenRoute, (Route<dynamic> route) => false);
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
      if (e.code == 'invalid-email') {
        showToast(context, 'Lütfen geçerli bir e-posta adresi giriniz');
      } else if (e.code == 'user-not-found') {
        showToast(context, 'Böyle kayıtlı e-posta adresi yok');
      }
    }
  }

  Future<void> anonymously(BuildContext context) async {
    try {
      await _auth.signInAnonymously();
      Navigator.pushNamedAndRemoveUntil(context, RouteConstant.homeScreenRoute,
          (Route<dynamic> route) => false);
    } on FirebaseAuthException catch (e) {
      showToast(context, e.message!);
    }
  }
}
