import 'package:flutter/material.dart';
import 'package:myapp/CartProvider.dart';
import 'package:myapp/shoedata.dart';
import 'package:provider/provider.dart';

class Shoepage extends StatefulWidget {
  final Shoe shoe;
  const Shoepage({super.key, required this.shoe});

  @override
  State<Shoepage> createState() => _ShoepageState();
}

class _ShoepageState extends State<Shoepage> {
  int setSelected=0;
  int _addtocart() {
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  "Details",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
                ),
              ),
            ),

            // Brand and Title
            Text(
              widget.shoe.brand,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.shoe.title,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.normal),
            ),

            const SizedBox(height: 30),

            // Shoe Image
            SizedBox(
              height: 500,
              width: 500,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  widget.shoe.imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // Bottom Details Section
            Container(
              height: 500,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(20),
                  right: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Price
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "\$${widget.shoe.price.toString()}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Sizes List
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.shoe.sizes.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  setSelected=index;
                                });
                              },
                              child: Chip(
                                backgroundColor:setSelected==index?Colors.amber:null,
                                label: Text(
                                  widget.shoe.sizes[index].toString(),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  // Add to Cart Button
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.amberAccent,
                      ),
                    ),
                    onPressed: () {
                       Provider.of<CartProvider>(context, listen: false).addToCart(widget.shoe);
                       ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Added to the cart")),
                       );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.shopping_cart, color: Colors.black),
                        SizedBox(width: 8),
                        Text(
                          "Add To Cart",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
