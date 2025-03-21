import 'package:flutter/material.dart';
import 'package:marketplace/Providers/merchant_provider.dart';
import 'package:marketplace/Widgets/log_in.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Map selectedMerchant = Provider.of<MerchantProvider>(context).selectedMerchant;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(selectedMerchant["merchantBackground"]),
            fit: BoxFit.cover,
          ),
        ),
        child: const Center(
          child: LoginCard(),
        )
      ),
    );
  }
}