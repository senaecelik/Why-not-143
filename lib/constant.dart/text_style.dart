import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleConstant {
  static TextStyleConstant instance = TextStyleConstant._init();

  TextStyleConstant._init();

  TextStyle largeTitle = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 36.sp,
  );
  TextStyle title1 = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 22.sp,
  );
  TextStyle title2 = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 20.sp,
  );
  TextStyle textLargeMedium = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 17.sp,
  );
  TextStyle textLargeRegular = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 17.sp,
  );
  TextStyle textSmallMedium = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 15.sp,
  );
  TextStyle verySmallMedium = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 13.sp,
  );
  TextStyle textSmallRegular = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 15.sp,
  );
}
