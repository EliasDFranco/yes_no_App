import 'package:flutter/material.dart';

class HerMessageBublle extends StatelessWidget {
  const HerMessageBublle({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.background,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text("Hello im Neferpitou",
                style: TextStyle(color: Colors.black)),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        _ImageBuble(),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _ImageBuble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(size);
    return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          "https://yesno.wtf/assets/no/7-331da2464250a1459cd7d41715e1f67d.gif",
          width: size.width * 0.7,
          height: 150,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;

            return Container(
              width: size.width * 07.7,
              height: 150,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text("Neferpitou está escribiendo....."),
            );
          },
        ));
  }
}
