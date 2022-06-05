import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:why_not_143_team/meta/helper/constant/button_style.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/padding_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/string.dart';
import 'package:why_not_143_team/meta/helper/constant/text_style.dart';
import 'package:why_not_143_team/meta/view/menu/feedBack/feed_back_page_view_model.dart';
import 'package:why_not_143_team/meta/widget/sub_text_widget.dart';
import 'package:why_not_143_team/meta/widget/title_widget.dart';

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({Key? key}) : super(key: key);

  @override
  _FeedBackPageState createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  final messageController = TextEditingController();
  final titleController = TextEditingController();
  String feedbackTitle = '';
  String feedbackMessage = '';
  String feedbackSender = "";
  String senderMail = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FeedBackViewModel>.reactive(
        viewModelBuilder: () => FeedBackViewModel(),
        builder: (context, viewModel, child) => SafeArea(
                child: Scaffold(
              appBar: _feedBackAppBar(),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _feedBackMainTitle(),
                    _feedBackForm(context, viewModel),
                  ],
                ),
              ),
            )));
  }

  Padding _feedBackMainTitle() {
    return Padding(
      padding: PaddingConstant.instance.genelPadding,
      child: SubText(
        text: StringConstant.instance.feedBackSub,
      ),
    );
  }

  Form _feedBackForm(BuildContext context, FeedBackViewModel viewModel) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: PaddingConstant.instance.genelPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TittleWidget(text: StringConstant.instance.feedBackCaption),
            _feedBackTtle(),
            SizedBox(
              height: 10.h,
            ),
            _feedBackMesseage(),
            SizedBox(
              height: 50.h,
            ),
            _feedBackSendButton(context, viewModel),
          ],
        ),
      ),
    );
  }

  AppBar _feedBackAppBar() {
    return AppBar(
        title: Text(StringConstant.instance.feedBack,
            style:
                GoogleFonts.poppins(color: ColorConstant.instance.yankeBlue)));
  }

  SizedBox _feedBackSendButton(
      BuildContext context, FeedBackViewModel viewModel) {
        
    return SizedBox(
      height: 58.h,
      width: MediaQuery.of(context).size.height,
      child: ElevatedButton(
        onPressed: () async {
          viewModel.feedBack(_formKey, feedbackTitle, feedbackMessage,
              feedbackSender, senderMail, context);
          setState(() {
            titleController.clear();
            messageController.clear();
          });
        },
        child: Text(
          StringConstant.instance.feedBackSend,
          style: TextStyleConstant.instance.textLargeRegular,
        ),
        style: ButtonStyleConstant.instance.genelButtonStyle,
      ),
    );
  }

  TextFormField _feedBackMesseage() {
    return TextFormField(
      controller: messageController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Mesaj boş bırakılamaz';
        }
        return null;
      },
      onChanged: (value) {
        setState(() {
          feedbackMessage = value;
          feedbackSender = FirebaseAuth.instance.currentUser!.displayName!;
          senderMail = FirebaseAuth.instance.currentUser!.email!;
        });
      },
      decoration: InputDecoration(
        hintText: StringConstant.instance.feedBackMessage,
        hintStyle: TextStyleConstant.instance.textSmallMedium
            .copyWith(color: ColorConstant.instance.neutral),
      ),
    );
  }

  TextFormField _feedBackTtle() {
    return TextFormField(
      controller: titleController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Başlık boş bırakılamaz';
        }
        return null;
      },
      onChanged: (value) {
        setState(() {
          feedbackTitle = value;
        });
      },
      decoration: InputDecoration(
        hintText: StringConstant.instance.feedBackCaptionSub,
        hintStyle: TextStyleConstant.instance.textSmallMedium
            .copyWith(color: ColorConstant.instance.neutral),
      ),
    );
  }
}
