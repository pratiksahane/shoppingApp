import 'package:flutter/material.dart';
import 'package:myapp/CartProvider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartpageState();
}

class _CartpageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    // Access the cart provider
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.cart; // this is List<Shoe>

    return Scaffold(
      appBar: AppBar(title: Text("My Cart")),
      body: cartItems.isEmpty
          ? Center(child: Text("Your cart is empty"))
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final shoe = cartItems[index];
                return ListTile(
                  leading: Image.asset(shoe.imagePath, height: 50),
                  title: Text(shoe.title),
                  subtitle: Text('\$${shoe.price.toStringAsFixed(2)}'),
                  trailing: GestureDetector(onTap: () {
                    Provider.of<CartProvider>(context, listen: false).removeFromCart(cartItems[index]);
                       ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Removed from the cart")),
                       );
                  },
                    child: Icon(Icons.delete, color: Colors.red,)),
                );
              },
            ),
    );
  }
}
