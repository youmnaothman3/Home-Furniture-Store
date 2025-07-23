import 'package:flutter/material.dart';
import 'package:furniturestore/model/order_model.dart';
import 'package:furniturestore/widgets/order_card.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  int selectedTabIndex = 0;

  final List<OrderModel> allOrders = [
    OrderModel(
      orderNumber: 'No238562312',
      date: '20/03/2020',
      quantity: 3,
      amount: 150.0,
      status: OrderStatus.cancelled,
    ),
    OrderModel(
      orderNumber: 'No238562313',
      date: '20/03/2020',
      quantity: 3,
      amount: 150.0,
      status: OrderStatus.processing,
    ),
    OrderModel(
      orderNumber: 'No238562314',
      date: '20/03/2020',
      quantity: 3,
      amount: 150.0,
      status: OrderStatus.delivered,
    ),
  ];

  List<OrderModel> get filteredOrders {
    switch (selectedTabIndex) {
      case 0:
        return allOrders.where((o) => o.status == OrderStatus.delivered).toList();
      case 1:
        return allOrders.where((o) => o.status == OrderStatus.processing).toList();
      case 2:
        return allOrders.where((o) => o.status == OrderStatus.cancelled).toList();
      default:
        return allOrders;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      appBar: AppBar(
        title: const Text('My Orders'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Tabs
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                buildTab('Delivered', 0),
                buildTab('Processing', 1),
                buildTab('Canceled', 2),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // List of Orders
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filteredOrders.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return OrderCard(order: filteredOrders[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTab(String title, int index) {
    final isSelected = selectedTabIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedTabIndex = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected ? Colors.orange : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.orange : Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
