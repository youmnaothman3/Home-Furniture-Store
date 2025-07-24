// controllers/add_payment_controller.dart
import 'package:flutter/material.dart';
import 'package:furniturestore/model/payment_card_model.dart';


class AddPaymentController {
  final formKey = GlobalKey<FormState>();

  String cardHolder = '';
  String cardNumber = '';
  String expiryDate = '';
  String cvv = '';

  bool validateAndSave() {
    return formKey.currentState?.validate() ?? false;
  }

  PaymentCardModel getCardData() {
    return PaymentCardModel(
      cardHolder: cardHolder,
      cardNumber: cardNumber,
      expiryDate: expiryDate,
      cvv: cvv,
    );
  }
}
