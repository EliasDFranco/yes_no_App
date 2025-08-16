import 'package:flutter/material.dart';

class MyMessageBuble extends StatelessWidget {
  const MyMessageBuble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.primaryColorDark,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text("HELLO MY NAME IS ELIAS D. FRANCO",
                style: TextStyle(color: Colors.white)),
          ),
        ),
        const SizedBox(
          height: 10,
          width: 10,
        ),
      ],
    );
  }
}
