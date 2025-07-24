import 'package:flutter/material.dart';
import 'package:furniturestore/core/resources/colors_manger.dart';
import 'package:furniturestore/core/resources/string_manger.dart';
import 'package:furniturestore/widgets/custom_button.dart';
import 'package:furniturestore/widgets/customtextfield%20.dart';


class AddShippingAddressPage extends StatefulWidget {
  const AddShippingAddressPage({super.key});

  @override
  State<AddShippingAddressPage> createState() => _AddShippingAddressPageState();
}

class _AddShippingAddressPageState extends State<AddShippingAddressPage> {
  final _formKey = GlobalKey<FormState>();

  String? fullName;
  String? address;
  String? zipcode;

  String? selectedCountry;
  String? selectedCity;
  String? selectedDistrict;

  final List<String> countries = ['USA', 'Germany', 'France'];
  final List<String> cities = ['New York', 'Berlin', 'Paris'];
  final List<String> districts = ['District 1', 'District 2', 'District 3'];

  void _saveAddress() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // تخزين البيانات (بس UI الآن)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Address saved successfully')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add shipping address',style: TextStyle(color: ColorsManager.primarycolor,fontSize: 16,fontWeight: FontWeight.w600),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              CustomTextFormField(
                label: 'Full Name',
                validator: (value) {
                  if (value == null  ||value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
                onChanged: (value) => fullName = value, hintText: '',
              ),
              const SizedBox(height: 12),
              CustomTextFormField(
                label: 'Address',
                validator: (value) {
                  if (value == null  ||value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
                onChanged: (value) => address = value, hintText: '',
              ),
              const SizedBox(height: 12),
              CustomTextFormField(
                label: 'Zipcode (Postal Code)',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your zipcode';
                  } else if (!RegExp(r'^\d{4,10}$').hasMatch(value)) {
                    return 'Enter a valid postal code';
                  }
                  return null;
                },
                onChanged: (value) => zipcode = value, hintText: '',
              ),
              const SizedBox(height: 20),

              DropdownButtonFormField<String>(
                value: selectedCountry,
                decoration: const InputDecoration(
                  labelText: 'Country',
                  border: OutlineInputBorder(),
                ),
                items: countries.map((country) {
                  return DropdownMenuItem(
                    value: country,
                    child: Text(country),
                  );
                }).toList(),
                validator: (value) => value == null ? 'Select a country' : null,
                onChanged: (value) => setState(() => selectedCountry = value),
              ),
              const SizedBox(height: 12),DropdownButtonFormField<String>(
                value: selectedCity,
                decoration: const InputDecoration(
                  labelText: 'City',
                  border: OutlineInputBorder(),
                ),
                items: cities.map((city) {
                  return DropdownMenuItem(
                    value: city,
                    child: Text(city),
                  );
                }).toList(),
                validator: (value) => value == null ? 'Select a city' : null,
                onChanged: (value) => setState(() => selectedCity = value),
              ),
              const SizedBox(height: 12),

              DropdownButtonFormField<String>(
                value: selectedDistrict,
                decoration: const InputDecoration(
                  labelText: 'District',
                  border: OutlineInputBorder(),
                ),
                items: districts.map((district) {
                  return DropdownMenuItem(
                    value: district,
                    child: Text(district),
                  );
                }).toList(),
                validator: (value) => value == null ? 'Select a district' : null,
                onChanged: (value) => setState(() => selectedDistrict = value),
              ),

              SafeArea(child: const SizedBox(height: 160)),
              CustomButton(
                title: StringManager.saveaddress,
                backgroundColor: ColorsManager.primarycolor,
                onPressed: () {
                  
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}