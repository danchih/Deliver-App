import 'package:deliver_app/UI/_core/widgets/appbar.dart';
import 'package:deliver_app/UI/home/widgets/category_widget.dart';
import 'package:deliver_app/UI/home/widgets/restaurant_widget.dart';
import 'package:deliver_app/data/categories_data.dart';
import 'package:deliver_app/data/restaurant_data.dart';
import 'package:deliver_app/model/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RestaurantData restaurantData = Provider.of(context);

    return Scaffold(
      drawer: Drawer(),
      appBar: getAppBar(context: context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0), 
          child: SingleChildScrollView(
            child: Column(
              spacing: 32.0,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset('assets/logo.png', width: 147)),
                Text("Boas Vindas"),
                TextFormField(),
                Text("Escolha a categoria"),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 8.0,
                    children: List.generate(
                      CategoriesData.listCategories.length, 
                      (index) {
                        return CategoryWidget(category: CategoriesData.listCategories[index]);
                      },
                    ),
                  ),
                ),
                Image.asset("assets/banners/banner_promo.png"),
                Text("Bem avaliados"),
                Column(
                  spacing: 16.0,
                  children: List.generate(
                    restaurantData.listRestaurant.length, 
                    (index) {
                      Restaurant restaurant = restaurantData.listRestaurant[index];
                      return RestaurantWidget(restaurant: restaurant);
                    }
                  ),
                ),
                SizedBox(height: 64.0,)
              ],
            ),
          )
        )
    );
  }
}