import 'package:flutter/material.dart';
import 'package:payment/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, required this.textButtom,  this.isLoading = false});

  final void Function()? onPressed;

  final String textButtom;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return   ElevatedButton(

      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff34A853)),

        shape: MaterialStateProperty.all<OutlinedBorder?>(
                    RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),

        minimumSize: MaterialStateProperty.all<Size?>(const Size(300.0, 60.0),),

      ),

      onPressed: onPressed, 

      child: isLoading 
      ? const CircularProgressIndicator() 
      : Text(textButtom, style: Styles.style22)
      );
  }
}



