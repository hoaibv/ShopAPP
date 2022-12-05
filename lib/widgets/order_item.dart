import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../providers/orders.dart' as ord;

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key, required this.order}) : super(key: key);
  final ord.OrderItems order;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${order.amount}'),
            subtitle: Text(DateFormat('dd MM yyy hh:mm').format(order.dateTime)),
            trailing: IconButton(
              icon: const Icon(Icons.expand_more),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
