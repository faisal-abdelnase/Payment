import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment/core/utils/styles.dart';

AppBar buildAppBar({ final String? title }) {
    return AppBar(
      leading: Center(
        child: SvgPicture.asset(
          "asset/image/arrow.svg",
          
          ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
      title ?? "", 
      style: Styles.style25,
      textAlign: TextAlign.center,
      ),
      centerTitle: true,
    );
  }
