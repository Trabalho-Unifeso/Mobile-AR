import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/scaffold_base.dart';
import '../data/product_data.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBase(
      appBar: const CustomAppBar(),
      endDrawer: const CustomDrawer(),
      body: Center(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: cartProducts.length,
          itemBuilder: (context, index) {
            return SizedBox(
              width: 600,
              height: 80,
              child:  Row(
                children: [
                  Text('MOSTRAR OS PRODUTOS ADICIONADOS NESSA REGIÃO. FAÇA QUALQUER ALTERAÇÃO NECESSÁRIA')
                ],
              ),
            );
          }
          )
        ),
    );
  }
}
