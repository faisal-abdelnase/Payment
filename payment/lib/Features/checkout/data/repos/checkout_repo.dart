
import 'package:dartz/dartz.dart';
import 'package:payment/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment/core/errors/failures.dart';

abstract class CheckoutRepo{

  Future<Either<Failure, void>> makePayment(
    {required PaymentIntentInputModel paymentIntentInputModel});


}


