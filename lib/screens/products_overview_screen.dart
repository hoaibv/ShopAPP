// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_providers.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/widgets/badge.dart';

import '../providers/cart.dart';
import '../widgets/app_drawer.dart';
import '../widgets/products_grid.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productContainer = Provider.of<Products>(context, listen: false);
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: [
          PopupMenuButton(
              child: Icon(Icons.more_vert),
              onSelected: (FilterOptions selectValue) {
                print(selectValue);
                if (selectValue == FilterOptions.Favorites) {
                  productContainer.showFavoriteOnly();
                } else {
                  productContainer.showAll();
                }
              },
              itemBuilder: (_) => [
                    PopupMenuItem(child: Text('Only Favorite'), value: FilterOptions.Favorites),
                    PopupMenuItem(child: Text('Show All'), value: FilterOptions.All),
                  ]),
          Consumer<Cart>(
            builder: (_, cartData, child) => Badge(
              childWidget: child!,
              value: cart.itemCount.toString(),
              color: Colors.redAccent,
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      body: ProductGrid(),
      drawer: AppDrawer(),
    );
  }
}
