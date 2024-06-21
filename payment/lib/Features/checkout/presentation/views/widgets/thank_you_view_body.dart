import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:payment/Features/checkout/presentation/views/widgets/Custom_deshed_line.dart';
import 'package:payment/Features/checkout/presentation/views/widgets/custom_check_icon.dart';
import 'package:payment/Features/checkout/presentation/views/widgets/thank_you_card.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const ThankYouCard(),

          Positioned(
            bottom: MediaQuery.sizeOf(context).height * .2 + 20,
            left: 28,
            right: 28,
            child: const CustomDashedLine(),
          ),
      
          Positioned(
            left: -20,
            bottom: MediaQuery.sizeOf(context).height * .2,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
            ),


            Positioned(
            right: -20,
            bottom: MediaQuery.sizeOf(context).height * .2,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
            ),

            const Positioned(
              left: 0,
              right: 0,
              top: -50,
              child: CustomCheckIcon(),
              
            ),
        ],
      ),
    );
  }
}


