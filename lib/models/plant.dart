// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Plant {
  final String image;
  final String description;
  final double price;
  final String category;
  int quantity;
  Plant(
      {required this.image,
      required this.description,
      required this.price,
      required this.category,
      this.quantity = 1});

  @override
  String toString() =>
      'Plant(image: $image, description: $description, price: $price)';

  double getTotalPrice() {
    return quantity * price;
  }
}

final categoryListProvider = Provider<List<String>>((ref) {
  return [
    'Plants',
    'Flowers',
    'Cacti',
    'Herbs',
    'Bosl',
    'Bosl',
    'Bosl',
    'Bosl'
  ];
});

final selectedCategory = StateProvider<String>((ref) {
  return 'Plants';
});

final plantListProvider = Provider<List<Plant>>((ref) {
  final category = ref.watch(selectedCategory);

  List<Plant> plantList = [
    Plant(
        image: 'lib\\assets\\images\\pot1.png',
        description: 'The Potted Head',
        price: 50,
        category: 'Plants'),
    Plant(
        image: 'lib\\assets\\images\\second.png',
        description: 'Ledger Block',
        price: 55,
        category: 'Plants'),
    Plant(
        image: 'lib\\assets\\images\\pot1.png',
        description: 'The Potted Head',
        price: 50,
        category: 'Plants'),
    Plant(
        image: 'lib\\assets\\images\\second.png',
        description: 'Ledger Block',
        price: 55,
        category: 'Plants'),
    Plant(
        image: 'lib\\assets\\images\\third.png',
        description: 'The Friendly Fern',
        price: 80,
        category: 'Flowers'),
    Plant(
        image: 'lib\\assets\\images\\forth.png',
        description: 'Mini Cacti',
        price: 25,
        category: 'Cacti'),
  ];
  switch (category) {
    case 'Plants':
      return plantList
          .where((element) => element.category == 'Plants')
          .toList();
    case 'Flowers':
      return plantList
          .where((element) => element.category == 'Flowers')
          .toList();
    case 'Cacti':
      return plantList.where((element) => element.category == 'Cacti').toList();
    case 'Herbs':
      return plantList.where((element) => element.category == 'Herbs').toList();
    case ' Bosl':
      return plantList.where((element) => element.category == 'Bosl').toList();
  }
  return plantList;
});

class CartList extends StateNotifier<List<Plant>> {
  CartList() : super([]);

  void addItemToCart(Plant plant) {
    state = [...state, plant];
  }

  double getTotal() {
    double total = 0;
    for (Plant plant in state) total += plant.getTotalPrice();
    return total;
  }
}

final cartListProvider = StateNotifierProvider<CartList, List<Plant>>((ref) {
  return CartList();
});
