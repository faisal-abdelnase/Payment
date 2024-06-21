import 'package:dartz/dartz.dart';
import 'package:payment/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment/Features/checkout/data/repos/checkout_repo.dart';
import 'package:payment/core/errors/failures.dart';
import 'package:payment/core/utils/stripe_service.dart';

class CheckoutRepoImpl extends CheckoutRepo{

  final StripeService stripeService = StripeService();

  @override
  Future<Either<Failure, void>> makePayment(
    {required PaymentIntentInputModel paymentIntentInputModel}) async {

      try {
  await stripeService.makePayment(paymentIntentInputModel: paymentIntentInputModel);

  return right(null);
} on Exception catch (e) {
  return left(ServerFailure(errMessage: e.toString()));
    }
    
  }

}