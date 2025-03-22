import 'package:flutter/material.dart';
import 'package:marketplace/General/config.dart';
import 'package:marketplace/Providers/merchant_provider.dart';
import 'package:provider/provider.dart';

class SelectMerchant extends StatefulWidget {
  const SelectMerchant({super.key});

  @override
  State<SelectMerchant> createState() => _SelectMerchantState();
}

class _SelectMerchantState extends State<SelectMerchant> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MerchantProvider>(
      builder: (context, merchantProvider, child) {
        return DropdownButtonFormField<Map>(
          value: merchantProvider.selectedMerchant,
          onChanged: (Map? newMerchant) {
            if (newMerchant != null) {
              context.read<MerchantProvider>().setMerchant(newMerchant);
            }
          },
          items: merchants.map<DropdownMenuItem<Map>>((merchant) {
            return DropdownMenuItem<Map>(
              value: merchant,
              child: Text(merchant["merchantName"]),
            );
          }).toList(),
          decoration: InputDecoration(
            labelText: "Select Merchant",
            labelStyle: TextStyle(color: Colors.blueGrey[700]),
            contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),  // Match the same radius as other fields
            ),
            filled: true,
            fillColor: Colors.white
          ),
          dropdownColor: Colors.white,
          icon: const Icon(Icons.arrow_drop_down, color: Colors.blueGrey),
          style: const TextStyle(color: Colors.black, fontSize: 16),
        );
      },
    );
  }
}
