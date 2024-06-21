import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payment/Features/checkout/presentation/views/widgets/patment_detials_view_body.dart';
import 'package:payment/core/widgets/custom_app_bar.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "Payment Details"),

    body: const PaymentDetailsViewBody(),
    );
  }
}