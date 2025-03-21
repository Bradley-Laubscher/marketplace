import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  final List<Map<String, dynamic>> cart;

  const CheckoutPage({
    super.key,
    required this.cart
  });

  @override
  Widget build(BuildContext context) {
    double total = cart.fold(0, (sum, item) => sum + int.parse(item['productPrice']));

    return cart.isEmpty
        ? const Center(child: Text('Your cart is empty'))
        : Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(cart[index]['productName']),
                subtitle: Text('\$${cart[index]['productPrice']}'),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Total: \$${total.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Handle checkout logic
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Proceeding to payment')),
            );
          },
          child: const Text('Proceed to Payment'),
        ),
      ],
    );
  }
}
