

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/Features/checkout/presentation/manger/cubit/payment_cubit.dart';
import 'package:payment/core/widgets/payment_method_item.dart';

class PaymentMethodeListView extends StatefulWidget {
  const PaymentMethodeListView({super.key});

  @override
  State<PaymentMethodeListView> createState() => _PaymentMethodeListViewState();
}

class _PaymentMethodeListViewState extends State<PaymentMethodeListView> {
  final List<String> paymentMethodeItem = const [
    'asset/image/card.svg',
    'asset/image/payPal.svg',
    'asset/image/pay.svg',
  ];

  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: paymentMethodeItem.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                _activeIndex = index;
                setState(() {
                  
                });

                BlocProvider.of<PaymentCubit>(context).typeOfPayment = index;

                
              },
              child: PaymentMethodeItem(isActive: _activeIndex == index ,
              image: paymentMethodeItem[index]),
            ),
          );
        }
        ),
    );
  }















  
}