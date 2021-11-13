import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildTabListItem('Hot Dog', 4, '50', 'images/hotdog.png'),
          _buildTabListItem('Beer', 4.7, '150', 'images/beer.png'),
        ],
      ),
    );
  }
}


_buildTabListItem(String foodName,double rating, String price, String imgPath) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 210.0,
          child: Row(
            children: [
              Container(
                height: 75.0,
                width: 75.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  color: const Color(0xFFFFE3DF),
                ),
                child: Center(
                  child: Image.asset(imgPath, height: 50.0,width: 50.0,),
                ),
              ),
              const SizedBox(width: 20.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(foodName,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                  ),
                  SmoothStarRating(
                      allowHalfRating: false,
                      onRated: (v) {
                      },
                      starCount: 5,
                      rating: rating,
                      size: 20.0,
                      color: const Color(0xFFFFD143),
                      borderColor: const Color(0xFFFFD143),
                      spacing:0.0
                  ),
                  Row(
                    children: [
                      Text(
                        'INR ' + price,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFF68D7F),
                        ),
                      ),
                      const SizedBox(width: 5.0,),
                      Text('INR 80',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.withOpacity(0.4),
                      ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        FloatingActionButton(
          heroTag: foodName,
          mini: true,
          onPressed: () {
          // TODO On Pressed Floating Action Button To Add Item For Order.
          },
          child: const Center(
            child: Icon(Icons.add, color: Colors.white,),
          ),
          backgroundColor: const Color(0xFFFE7D6A),
        ),
      ],
    ),
  );
}