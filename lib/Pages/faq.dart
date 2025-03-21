import 'package:flutter/material.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  @override
  Widget build(BuildContext context) {
    // **FAQ Section (Placeholder Questions)**

    List<Map<String, String>> faqs = [
      {"question": "What products do you offer?", "answer": "We offer a variety of coffee beans including Arabica and Robusta."},
      {"question": "How can I place an order?", "answer": "Orders can be placed directly through our store or partnered retailers."},
      {"question": "Do you ship internationally?", "answer": "Yes, we provide international shipping to select countries."},
    ];

    return ListView(
      padding: const EdgeInsets.all(20.0),
      children: faqs.map((faq) {
        return ExpansionTile(
          title: Text(faq["question"]!, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(faq["answer"]!, style: const TextStyle(color: Colors.white70)),
            ),
          ],
        );
      }).toList(),
    );
  }
}
