import 'package:flutter/material.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({
    super.key,
    required this.merchant
  });

  final Map merchant;

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  @override
  Widget build(BuildContext context) {
    // **FAQ Section (Placeholder Questions)**
    List<Map<String, String>> faqs = widget.merchant["FAQ"];

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: faqs.map((faq) {
          return Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ExpansionTile(
              title: Center(
                child: Text(
                  faq["question"]!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    faq["answer"]!,
                    textAlign: TextAlign.center, // Centering the answer
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
