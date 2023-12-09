import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  final String pictureId;
  final String name;
  final String city;
  final String rating;
  const RestaurantCard({
    super.key,
    required this.pictureId,
    required this.name,
    required this.city,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              pictureId,
              width: 130,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                name,
                style: const TextStyle(fontSize: 18),
              ),
              Row(
                children: [
                  Icon(
                    Icons.pin_drop_sharp,
                    color: Colors.red.shade700,
                  ),
                  Text(city)
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow.shade700,
                  ),
                  Text(rating)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
