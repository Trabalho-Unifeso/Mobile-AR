import 'package:flutter/material.dart';
import 'package:mobile_ar/data/product_data.dart';
import '../widgets/scaffold_base.dart';
import '../models/product.dart';
import 'ARPage.dart';

class ProductPage extends StatelessWidget {
  final Product product;

  const ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBase(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          child: Column(
            children: [
              //Box do Vizualizar Modelo
              SizedBox(
                width: 400,
                height: 65,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LocalAndWebObjectsView(product: product,)),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFECB785),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Visualizar Modelo',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //Box da Imagem do Produto
              ConstrainedBox(
                constraints: BoxConstraints(minHeight: 400, minWidth: 400),
                child: ClipRect(
                  child: Image.asset(
                    product.image,
                    alignment: Alignment.center,
                    width: 400,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              //Box das Informações do Produto
              SizedBox(
                width: 400,
                height: 120,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFA),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              product.name,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'R\$ ${product.price.toStringAsFixed(2)}',
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: Color(0xFF424242),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFFECB785),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: SizedBox(
                                    width: 130,
                                    height: 20,
                                    child: ClipRRect(
                                      child: FilledButton(onPressed: () {
                                        cartProducts.add(product);
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(content: Text('Produto Adicionado!')),
                                        );
                                      }, style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Color(0xFFECB785))),
                                          child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text('Adicionar'),
                                          Icon(Icons.add),
                                          ],
                                        )
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //Descrição do Produto
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: SizedBox(
                    width: 400,
                    child: Text(
                      'Descrição',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: 400,
                  child: Text(
                    textAlign: TextAlign.left,
                    product.description,
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
