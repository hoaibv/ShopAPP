import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import 'package:shop_app/widgets/order_item.dart';

import '../providers/orders.dart' show Orders;

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Order'),
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: ordersData.orders.length,
        itemBuilder: (BuildContext context, int index) {
          return OrderItem(order: ordersData.orders[index]);
        },
      ),
    );
  }
}
