import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_buble.dart';

void main() => runApp(const ChatScreen());

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbbxXLi8xKKd45MJ71rz6ZpOyW6aofNJ1eQA&s'),
            // Foto de Neferpitou
          ),
        ),
        title: const Text("Neferpitou"),
      ),
      body: const MyMessageBuble(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // left: false, ESTO PARA QUE SE MUESTRE AL GIRAR NUESTRO DISPOSITIVO, SE MUESTRE EN LOS LADOS DE LOS BOTONES
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(children: [
          Expanded(
              child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return Text(
                "Indice: $index",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    backgroundColor: Colors.greenAccent),
              );
            },
          ))
        ]),
      ),
    );
  }
}
