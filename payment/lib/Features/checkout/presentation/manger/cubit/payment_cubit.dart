

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:payment/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment/Features/checkout/data/repos/checkout_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit({required this.checkoutRepo,  this.typeOfPayment = 0}) : super(PaymentInitial());

  final CheckoutRepo checkoutRepo;
  int typeOfPayment;

  Future makePayment(
    {required PaymentIntentInputModel paymentIntentInputModel}) async{

      emit(PaymentLoading());

      var data = await checkoutRepo.makePayment(paymentIntentInputModel: paymentIntentInputModel);

      data.fold(
        (l) => emit(PaymentFailure(l.errMessage)), 
        (r) => emit(PaymentSucess()));

  }
  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
