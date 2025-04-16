import 'package:flutter/material.dart';
import 'package:myapp/shoepage.dart';
import './shoedata.dart';

class Bodydata extends StatefulWidget {
  const Bodydata({super.key});

  @override
  State<Bodydata> createState() => _BodydataState();
}

class _BodydataState extends State<Bodydata> {
  List<String> filters = ["All", "Addidas", "Nike", "Beta"];
  int selected=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          // Header Row
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                  SafeArea(
                    child: Text(
                      "Shoes\nCollection", 
                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ),
                
                const SizedBox(width: 20),
                 Expanded(child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: TextField(decoration: InputDecoration(prefixIcon: Icon(Icons.search),hintText: "search", border: OutlineInputBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20))),)),
              ))
              ],
            ),
          ),

          // Filter Chips
          SizedBox(
            height: 50, // Fixed height for the chip list
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: GestureDetector(
                    onTap: () => {
                      setState(() {
                        selected=index; 
                      })
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Chip(backgroundColor: selected==index?Colors.amber:Colors.white30,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), 
                      ),
                        label: Text(filters[index]),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(width: 40,),

          Expanded(child: ListView.builder(itemCount: getShoesByBrand(filters[selected]).length,itemBuilder:(context,index){
            final shoe = getShoesByBrand(filters[selected])[index];
             return _shoeCard(context,shoe);
          }))
        ],
      ),
    );
  }
}

Widget _shoeCard(BuildContext context, Shoe shoe) {
  return SizedBox(
    height: 200,
    child: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Shoepage(shoe:shoe)), 
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                shoe.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "\$${shoe.price.toStringAsFixed(2)}",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 12),
              Expanded(
                child: Center(
                  child: Image.asset(
                    shoe.imagePath,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}