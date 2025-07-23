enum OrderStatus { delivered, processing, cancelled }

class OrderModel {
  final String orderNumber;
  final String date;
  final int quantity;
  final double amount;
  final OrderStatus status;

  OrderModel({
    required this.orderNumber,
    required this.date,
    required this.quantity,
    required this.amount,
    required this.status,
  });
}
