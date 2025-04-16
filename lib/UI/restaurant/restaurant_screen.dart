import 'package:deliver_app/UI/_core/bag_provider.dart';
import 'package:deliver_app/UI/_core/widgets/appbar.dart';
import 'package:deliver_app/model/dish.dart';
import 'package:deliver_app/model/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestaurantScreen extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, title: restaurant.name),
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 12.0,
            children: [
              Image.asset('assets/${restaurant.imagePath}', width: 128),
              Text("Mais pedidios", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              Column(
                children: List.generate(
                  restaurant.dishes.length, 
                  (index) {
                    Dish dish = restaurant.dishes[index];
                    return ListTile(
                      onTap: () {},
                      leading: Image.asset('assets/dishes/default.png', width: 48),
                      title: Text(dish.name),
                      subtitle: Text("R\$${dish.price.toStringAsFixed(2)}"),
                      trailing: IconButton(onPressed: () {
                        context.read<BagProvider>().addAllDishes([dish]);
                      }, icon: Icon(Icons.add)),
                    );
                  }
                ),
                
              )
            ],
          ),
      ),
    );
  }
}