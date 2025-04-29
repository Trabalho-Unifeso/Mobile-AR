import 'package:flutter/material.dart';
import '../widgets/scaffold_base.dart';
import '../data/product_data.dart';
import '../models/product.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final Map<Product, int> productQuantities = {};
    for (var product in cartProducts) {
      productQuantities.update(product, (value) => value + 1, ifAbsent: () => 1);
    }

    final products = productQuantities.keys.toList();

    double totalPrice = 0;
    for (var product in products) {
      totalPrice += product.price * (productQuantities[product] ?? 1);
    }

    return ScaffoldBase(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              // Lista de produtos no carrinho
              scrollDirection: Axis.vertical,
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                final quantity = productQuantities[product] ?? 1;

                // Card do produto no carrinho
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Card(
                    color: Colors.white,
                    elevation: 3,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: Image.asset(
                        product.image,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        product.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('R\$ ${product.price.toStringAsFixed(2)}'),
                      // Botões de remover e adicionar com quantidade atual
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_circle, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                cartProducts.remove(product);
                              });
                            },
                          ),
                          Text('x$quantity', style: TextStyle(fontWeight: FontWeight.bold)),
                          IconButton(
                            icon: const Icon(Icons.add_circle, color: Colors.green),
                            onPressed: () {
                              setState(() {
                                cartProducts.add(product);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          //Texto com o valor total
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            alignment: Alignment.centerRight,
            child: Text(
              'Total: R\$ ${totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Botão de Finalizar Compra
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Compra Finalizada!')),
                );
                setState(() {
                  cartProducts.clear();
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Cor de fundo do botão
                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 50.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                'Finalizar Compra',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),

              ),
            ),
          ),
        ],
      ),
    );
  }
}
