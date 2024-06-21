import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payment/Features/checkout/presentation/views/widgets/thank_you_view_body.dart';
import 'package:payment/core/widgets/custom_app_bar.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: buildAppBar(),
      body: Transform.translate( // to change the position of widget on y_axis and x_axis
        offset: const Offset(0, -16),
        child: const ThankYouViewBody()),
    );
  }
}