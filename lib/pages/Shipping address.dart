import 'package:flutter/material.dart';
import 'package:furniturestore/core/resources/colors_manger.dart';
import 'package:furniturestore/model/addressmodel.dart';
import 'package:furniturestore/widgets/addresscard.dart';

class ShippingAddressPage extends StatefulWidget {
  const ShippingAddressPage({super.key});

  @override
  State<ShippingAddressPage> createState() => _ShippingAddressPageState();
}

class _ShippingAddressPageState extends State<ShippingAddressPage> {
  List<AddressModel> addresses = [
    AddressModel(name: 'Bruno Fernandes', address: '25 rue Robert Latouche, Nice, France', isSelected: true),
    AddressModel(name: 'Bruno Fernandes', address: '25 rue Robert Latouche, Nice, France'),
    AddressModel(name: 'Bruno Fernandes', address: '25 rue Robert Latouche, Nice, France'),
  ];

  void selectAddress(int index) {
    setState(() {
      for (int i = 0; i < addresses.length; i++) {
        addresses[i] = AddressModel(
          name: addresses[i].name,
          address: addresses[i].address,
          isSelected: i == index,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shipping address"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: addresses.length,
        itemBuilder: (context, index) {
          final address = addresses[index];
          return AddressCard(
            name: address.name,
            address: address.address,
            isSelected: address.isSelected,
            onChanged: () => selectAddress(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsManager.conte,
        onPressed: () {
          // Add address logic
            Navigator.pushNamed(context, '/add-shipping');
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add,color:ColorsManager.primarycolor ),),
      );
  }
}
