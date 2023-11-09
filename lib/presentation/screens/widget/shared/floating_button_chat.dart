import 'package:flutter/material.dart';
class FloatingButtonChat extends StatelessWidget {
  const FloatingButtonChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){},
      child: const Icon(Icons.message_outlined),
      );
  }
}