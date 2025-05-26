import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_pokedex_project/common/consts/assets_strings.dart';

class ErrorCustomWidget extends StatelessWidget {
  const ErrorCustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            AssetsStrings.rotonImg,
            width: 300.w,
            height: 200.h,
          ),
        ),
        Text(
          'Ops! Algo deu errado',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }
}
