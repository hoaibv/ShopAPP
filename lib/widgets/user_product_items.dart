import 'package:flutter/material.dart';

class UserProductItems extends StatelessWidget {
  UserProductItems({Key? key, required this.title, required this.imageUrl}) : super(key: key);
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit),
              color: Theme
                  .of(context)
                  .primaryColor,
            ),
            IconButton(
              onPressed: () {

              },
              icon: const Icon(Icons.delete),
              color: Theme
                  .of(context)
                  .errorColor,
            )
          ],
        ),
      ),
    );
  }
}
