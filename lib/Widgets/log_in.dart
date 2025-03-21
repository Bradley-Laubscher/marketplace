import 'package:flutter/material.dart';
import 'package:marketplace/Pages/home.dart';
import 'package:marketplace/Providers/merchant_provider.dart';
import 'package:marketplace/Widgets/select_merchant.dart';
import 'package:provider/provider.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({super.key});

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  @override
  Widget build(BuildContext context) {
    Map selectedMerchant = Provider.of<MerchantProvider>(context).selectedMerchant;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(250.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Login Card
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Select Merchant
                    const SelectMerchant(),
                    const SizedBox(height: 15),

                    // Username Field
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Username",
                        hintText: "Proceed to login - No Credentials needed for demonstration",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Password Field
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Proceed to login - No Credentials needed for demonstration",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Log In Button
                    ElevatedButton(
                      onPressed: () {
                        // Handle login action here
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage(merchant: selectedMerchant)),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: Color(selectedMerchant["merchantPrimaryColour"])
                      ),
                      child: const Text(
                        "Log In",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
