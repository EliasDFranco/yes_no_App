import 'package:flutter/material.dart';

import '../../../domain/entities/message.dart';

class HerMessageBublle extends StatelessWidget {
  const HerMessageBublle({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.background,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child:
                Text(message.text, style: const TextStyle(color: Colors.black)),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        if (message.imageUrl != null) _ImageBuble(message.imageUrl!),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _ImageBuble extends StatelessWidget {
  final String imageUrl;

  const _ImageBuble(this.imageUrl);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          imageUrl,
          width: size.width * 0.7,
          height: 150,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;

            return Container(
              width: size.width * 07.7,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text("Neferpitou está escribiendo....."),
            );
          },
        ));
  }
}
