import '../models/product.dart';

final List<Product> cartProducts = [];
final List<Product> products = [
  Product(
    name: 'Mesa de Escritório',
    image: 'assets/mesa-escritorio.png',
    price: 1000.00,
    description: 'Mesa de escritório com acabamento premium.',
  ),
  Product(
    name: 'Cadeira Gamer',
    image: 'assets/cadeira-gamer.png',
    price: 850.00,
    description: 'Conforto total para suas partidas.',
  ),
  Product(
    name: 'Sofá Confortável',
    image: 'assets/sofa.png',
    price: 2500.00,
    description: 'Sofá amplo e extremamente confortável.',
  ),
  Product(
    name: 'Estante Moderna',
    image: 'assets/estante.png',
    price: 1200.00,
    description: 'Estante moderna para decoração e organização.',
  ),
];
