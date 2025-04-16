
class Shoe {
  final String id;
  final String title;
  final String brand;
  final double price;
  final String imagePath;
  final List<String> sizes;

  Shoe({
    required this.id,
    required this.title,
    required this.brand,
    required this.price,
    required this.imagePath,
    required this.sizes,
  });
}

List<Shoe> allShoes = [
  Shoe(
    id: '1',
    title: 'Air Max 270',
    brand: 'Nike',
    price: 150.00,
    imagePath: 'assets/images/shoes_1.png',
    sizes: ['US 7', 'US 8', 'US 9', 'US 10'],
  ),
  Shoe(
    id: '2',
    title: 'Ultraboost 22',
    brand: 'Addidas',
    price: 180.00,
    imagePath: 'assets/images/shoes_2.png',
    sizes: ['US 8', 'US 9', 'US 10', 'US 11'],
  ),
  Shoe(
    id: '3',
    title: 'Classic Leather',
    brand: 'Beta',
    price: 80.00,
    imagePath: 'assets/images/shoes_3.png',
    sizes: ['US 7', 'US 8', 'US 9'],
  ),
  // Add more shoes as needed
];

List<Shoe> getShoesByBrand(String brand) {
  if (brand == 'All') return allShoes;
  return allShoes.where((shoe) => shoe.brand.toLowerCase() == brand.toLowerCase()).toList();
}