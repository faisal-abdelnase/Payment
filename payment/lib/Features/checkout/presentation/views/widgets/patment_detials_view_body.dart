

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:payment/Features/checkout/presentation/views/thank_you_view.dart';
import 'package:payment/Features/checkout/presentation/views/widgets/custom_credit_card.dart';
import 'package:payment/Features/checkout/presentation/views/widgets/payment_methods_list_view.dart';
import 'package:payment/core/widgets/custom_button.dart';


class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers:  [
        const SliverToBoxAdapter(
          child: PaymentMethodeListView(),
        ),
        SliverToBoxAdapter(
          child: CustomCreditCard(
            autovalidateMode: autovalidateMode,
            formKey: formKey,),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            
            child: CustomButton(
              onPressed: () {
                if(formKey.currentState!.validate()){

                  formKey.currentState!.save();

                  log("payment"); // to print in terminal

                }

                else{

                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)
                    {
                      return const ThankYouView();
                    }
                    )
                    );

                  autovalidateMode = AutovalidateMode.always;
                  setState(() {
                    
                  });

                }
              },
              textButtom: "Pay",
            )),
        ),
      ]
    );
  }
}


