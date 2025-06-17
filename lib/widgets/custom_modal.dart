import 'package:flutter/material.dart';
import '../models/product.dart';
import '../data/product_data.dart';

class CustomModal extends StatelessWidget {
  final Product product;
  final Function() onCartUpdated;

  const CustomModal({
    super.key,
    required this.product,
    required this.onCartUpdated,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            product.name,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Quantity:',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              // StatefulBuilder for the quantity controls
              StatefulBuilder(
                builder: (BuildContext context, StateSetter setModalState) {
                  // Get current quantity inside the StatefulBuilder
                  int quantity = cartProducts.where((p) => _areProductsEqual(p, product)).length;

                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove_circle,
                            color: quantity > 0 ? Colors.red : Colors.grey),
                        onPressed: quantity > 0
                            ? () {
                          final index = cartProducts.lastIndexWhere(
                                  (p) => _areProductsEqual(p, product));
                          if (index != -1) {
                            cartProducts.removeAt(index);
                            onCartUpdated(); // Notify parent
                            setModalState(() {}); // Update modal UI
                          }
                        }
                            : null,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text('$quantity',
                            style: const TextStyle(fontSize: 18)),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add_circle, color: Colors.green),
                        onPressed: () {
                          cartProducts.add(product);
                          onCartUpdated(); // Notify parent
                          setModalState(() {}); // Update modal UI
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text('Price: \$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF9E9DA),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Close',
                  style: TextStyle(color: Colors.black)),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }

  bool _areProductsEqual(Product a, Product b) {
    return a.name == b.name &&
        a.model == b.model &&
        a.price == b.price;
  }

  static void show({
    required BuildContext context,
    required Product product,
    required Function() onCartUpdated,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: CustomModal(
            product: product,
            onCartUpdated: onCartUpdated,
          ),
        );
      },
    );
  }
}