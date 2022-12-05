import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/orders.dart';

import '../providers/cart.dart';
import '../widgets/cart_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(width: 10),
                  Chip(
                    label: Text('${cart.totalAmount}'),
                    backgroundColor: Theme.of(context).backgroundColor,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false)
                          .addOrder(cart.items.values.toList(), cart.totalAmount);
                      cart.clear();
                    },
                    child: const Text('ORDER NOW'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, i) => CartItem(
                  id: cart.items.values.toList()[i].id,
                  productID: cart.items.keys.toList()[i],
                  quantity: cart.items.values.toList()[i].quantity,
                  price: cart.items.values.toList()[i].price,
                  title: cart.items.values.toList()[i].title),
            ),
          ),
        ],
      ),
    );
  }
}
