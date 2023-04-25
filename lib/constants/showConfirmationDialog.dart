import 'package:flutter/material.dart';

class ShowConfirmationDialog extends StatelessWidget {
  final String title;
  final String content;

  ShowConfirmationDialog({
    Key? key,
    this.title = 'Confirmation',
    this.content = 'Are you sure?',
  }) : super(key: key);

  Future<bool?> show(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
