import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  final List<Map<String, dynamic>> cart;
  final Map merchant;

  const CheckoutPage({
    super.key,
    required this.cart,
    required this.merchant,
  });

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {

  String checkCurrencyCode() {
    switch (widget.merchant["currencyCode"]) {
      case "710":
        return "R";
      default:
        return "\$";
    }
  }

  @override
  Widget build(BuildContext context) {
    // Grouping items by productName and counting quantities
    Map<String, int> itemCounts = {};
    widget.cart.forEach((item) {
      itemCounts[item['productName']] = (itemCounts[item['productName']] ?? 0) + 1;
    });

    double total = 0;
    List<Map<String, dynamic>> uniqueCartItems = [];
    itemCounts.forEach((productName, count) {
      Map<String, dynamic> product = widget.cart.firstWhere((item) => item['productName'] == productName);
      total += int.parse(product['productPrice']) * count;
      uniqueCartItems.add({
        ...product,
        'quantity': count,
      });
    });

    return widget.cart.isEmpty
      ? Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Your cart is empty',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      )
      : Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white12,
                border: Border.all(
                  color: Color(widget.merchant["merchantPrimaryColour"]),
                  style: BorderStyle.solid,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10)
              ),
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width*0.3,
              child: Column(
                children: [
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        "Your Cart",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                    )
                  ),
                  Expanded(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width*0.3,
                      child: ListView.builder(
                        itemCount: uniqueCartItems.length,
                        itemBuilder: (context, index) {
                          var item = uniqueCartItems[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 5,
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(16.0),
                              leading: Image.asset(
                                item['productImage'],
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                              title: Text(
                                item['productName'],
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${checkCurrencyCode()}${item['productPrice']}',
                                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                                  ),
                                  Text(
                                    'Quantity: ${item['quantity']}',
                                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                                  ),
                                ],
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.remove_circle, color: Colors.red),
                                onPressed: () {
                                  setState(() {
                                    // Find the specific product and reduce its quantity by 1
                                    var cartItemToRemove = uniqueCartItems.firstWhere((cartItem) => cartItem['productName'] == item['productName']);
                                    if (cartItemToRemove['quantity'] > 1) {
                                      Map itemToRemove = widget.cart.firstWhere((cartItem) => cartItem["productName"] == cartItemToRemove["productName"]);
                                      widget.cart.remove(itemToRemove);
                                    } else {
                                      // Remove the item from the cart if quantity is 1
                                      widget.cart.removeWhere((cartItem) => cartItem['productName'] == item['productName']);
                                    }
                                  });
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Expanded(
          //   child: SizedBox(
          //     width: MediaQuery.of(context).size.width*0.3,
          //     child: ListView.builder(
          //       itemCount: uniqueCartItems.length,
          //       itemBuilder: (context, index) {
          //         var item = uniqueCartItems[index];
          //         return Card(
          //           margin: const EdgeInsets.symmetric(vertical: 8.0),
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(12),
          //           ),
          //           elevation: 5,
          //           child: ListTile(
          //             contentPadding: const EdgeInsets.all(16.0),
          //             leading: Image.asset(
          //               item['productImage'],
          //               width: 50,
          //               height: 50,
          //               fit: BoxFit.cover,
          //             ),
          //             title: Text(
          //               item['productName'],
          //               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //             ),
          //             subtitle: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Text(
          //                   '${checkCurrencyCode()}${item['productPrice']}',
          //                   style: const TextStyle(fontSize: 16, color: Colors.grey),
          //                 ),
          //                 Text(
          //                   'Quantity: ${item['quantity']}',
          //                   style: const TextStyle(fontSize: 14, color: Colors.grey),
          //                 ),
          //               ],
          //             ),
          //             trailing: IconButton(
          //               icon: const Icon(Icons.remove_circle, color: Colors.red),
          //               onPressed: () {
          //                 setState(() {
          //                   // Find the specific product and reduce its quantity by 1
          //                   var cartItemToRemove = uniqueCartItems.firstWhere((cartItem) => cartItem['productName'] == item['productName']);
          //                   if (cartItemToRemove['quantity'] > 1) {
          //                     Map itemToRemove = widget.cart.firstWhere((cartItem) => cartItem["productName"] == cartItemToRemove["productName"]);
          //                     widget.cart.remove(itemToRemove);
          //                   } else {
          //                     // Remove the item from the cart if quantity is 1
          //                     widget.cart.removeWhere((cartItem) => cartItem['productName'] == item['productName']);
          //                   }
          //                 });
          //               },
          //             ),
          //           ),
          //         );
          //       },
          //     ),
          //   ),
          // ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(bottom: 40),
            child: Column(
              children: [
                Text(
                  'Total: ${checkCurrencyCode()}${total.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 40.0),
                    backgroundColor: Colors.green[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    // Handle checkout logic
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Proceeding to payment')),
                    );
                  },
                  child: const Text(
                    'Proceed to Payment',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
