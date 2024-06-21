import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCheckIcon extends StatelessWidget {
  const CustomCheckIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 50,
      backgroundColor:  Color(0xffD9D9D9),
    
      child: CircleAvatar(
        radius: 40,
        backgroundColor: Color(0xff34A853),
        child: Icon(
          color: Colors.white,
          size: 50,
          Icons.check,
          ),
      ),
    );
  }
}

