import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  Badge({
    Key? key,
    required this.childWidget,
    required this.value,
    required this.color,
  }) : super(key: key);

  late Widget childWidget;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        childWidget,
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            padding: EdgeInsets.all(2.0),
            // color: Theme.of(context).accentColor,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: color != null ? color : Colors.redAccent),
            constraints: const BoxConstraints(
              minWidth: 16,
              minHeight: 16,
            ),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10,
              ),
            ),
          ),
        )
      ],
    );
  }
}
