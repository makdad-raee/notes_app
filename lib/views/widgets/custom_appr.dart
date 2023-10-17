import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_search_icon.dart';

class CustomAppar extends StatelessWidget {
  const CustomAppar({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 28,
            color: Colors.white,
          ),
        ),
        const Spacer(),
        CustomSearchIcon(icon: icon),
      ],
    );
  }
}
