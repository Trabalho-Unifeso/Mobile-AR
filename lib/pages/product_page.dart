import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/scaffold_base.dart';
import '../models/product.dart';

class ProductPage extends StatelessWidget {
  final Product product;

  const ProductPage({super.key, required this.product});

  @override

  Widget build(BuildContext context) {
    return ScaffoldBase(
      appBar: const CustomAppBar(),
      endDrawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 50,vertical: 15),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 400,
                height: 75,
                child: Container(
                  color: Color(0xFFECB785),
                  child: Center(
                    child: Text(
                      'Visualizar Modelo',
                      style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 12,color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(minHeight: 300, minWidth: 400),
                child: ClipRect(
                  child: Image.asset(
                    product.image,
                    alignment: Alignment.center,
                    width: 400,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 400,
                height: 100,
                child: Container(
                    color: Color(0xFFFFFFFA),
                    child: Column(
                      children: [
                        Text(
                            product.name,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold
                            )
                        ),
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            spacing: 50,
                            children: [
                              Text(
                                'R\$ ${product.price.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                height: 25,
                                child: Row(
                                  spacing: 5,
                                  children: [
                                    Text('Adicionar'),
                                    Icon(Icons.add)
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                ),
              ),
              Text(product.description,
                  style: const TextStyle(fontSize: 14, color: Colors.grey)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
