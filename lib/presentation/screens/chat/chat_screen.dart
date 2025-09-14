import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_buble.dart';
import 'package:yes_no_app/presentation/widgets/share/message_field_box.dart';

import '../../../domain/entities/message.dart';

void main() => runApp(const ChatScreen());

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        shadowColor: Colors.black,
        backgroundColor: Colors.amber,
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
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      // left: false, ESTO PARA QUE SE MUESTRE AL GIRAR NUESTRO DISPOSITIVO, SE MUESTRE EN LOS LADOS DE LOS BOTONES
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(children: [
          Expanded(
              child: ListView.builder(
            controller: chatProvider.chatScrollController,
            itemCount: chatProvider.messageList.length,
            itemBuilder: (context, index) {
              final message = chatProvider.messageList[index];
              return (message.fromWho == FromWho.hers)
                  ? HerMessageBublle(
                      message: message,
                    )
                  : MyMessageBuble(
                      message: message
                    );
            },
          )),
          MessageFieldBox(
            onValue: (String value) {
              chatProvider.sendMessage(value);
            },
          ),
        ]),
      ),
    );
  }
}
