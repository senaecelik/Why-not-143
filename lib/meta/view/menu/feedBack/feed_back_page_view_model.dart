import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:why_not_143_team/meta/helper/utils/show_toast_message.dart';

class FeedBackViewModel extends BaseViewModel {
  FirebaseFirestore firebaseStore = FirebaseFirestore.instance;

  void feedBack(_formKey, feedbackTitle, feedbackMessage, feedbackSender,
      senderMail, BuildContext context) {
    final formState = _formKey.currentState;
    if (formState == null) return;
    if (formState.validate() == true) {
      formState.save();
      firebaseStore.collection('feedbacks').add({
        'feedbackTitle': feedbackTitle,
        'feebackMessage': feedbackMessage,
        'feedbackSender': feedbackSender,
        'senderMail': senderMail,
        'sendDate': DateTime.now(),
      });

      showToast(context, "Başarıyla göbderildi");
      notifyListeners();
    }
  }
}
