



import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/Features/checkout/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:payment/Features/checkout/data/models/init_payment_sheet_input_model.dart';
import 'package:payment/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment/Features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:payment/core/utils/api_keys.dart';
import 'package:payment/core/utils/api_service.dart';

class StripeService{
  final ApiService apiService = ApiService();
  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel) async{
      var response = await  apiService.post(
        body: paymentIntentInputModel.toJson(), 
        contentType: Headers.formUrlEncodedContentType,
        url: 'https://api.stripe.com/v1/payment_intents', 
        token: ApiKeys.secretkey);

        var paymentIntentModel = PaymentIntentModel.fromJson(response.data);

        return paymentIntentModel;
    
  }

  Future initPaymentSheet({required Initpaymentsheetinputmodel initpaymentsheetinputmodel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initpaymentsheetinputmodel.clientSecret,
        customerEphemeralKeySecret: initpaymentsheetinputmodel.ephemelarKeySecret,
        customerId: initpaymentsheetinputmodel.customerId,
        merchantDisplayName: 'faisal',
    ));
  }

  Future displayPaymentSheet() async {

    await Stripe.instance.presentPaymentSheet();

  }

  Future makePayment({required PaymentIntentInputModel paymentIntentInputModel}) async{

    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);

    var ephemelarKeyModel = await createEhpemelarKey(customerId: paymentIntentInputModel.customerId);

    var initpaymentsheetinputmodel = Initpaymentsheetinputmodel(
      clientSecret: paymentIntentModel.clientSecret!, 
      customerId: paymentIntentInputModel.customerId, 
      ephemelarKeySecret: ephemelarKeyModel.secret!,
      );

    await initPaymentSheet(
      initpaymentsheetinputmodel: initpaymentsheetinputmodel);


    await displayPaymentSheet();

  }


// Customer



Future<EphemeralKeyModel> createEhpemelarKey(
    {required String customerId}) async{
      var response = await  apiService.post(
        body: {
          'customer' : customerId
        }, 
        contentType: Headers.formUrlEncodedContentType,
        url: 'https://api.stripe.com/v1/ephemeral_keys', 
        token: ApiKeys.secretkey,
        headers: {
          'Authorization' : "Bearer ${ApiKeys.secretkey}", 
          "Stripe-Version" : "2024-04-10"
          }
        );

        var ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);

        return ephemeralKeyModel;
    
  }


}