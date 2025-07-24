// models/payment_card_model.dart

class PaymentCardModel {
  final String cardHolder;
  final String cardNumber;
  final String expiryDate;
  final String cvv;

  PaymentCardModel({
    required this.cardHolder,
    required this.cardNumber,
    required this.expiryDate,
    required this.cvv,
  });
}
