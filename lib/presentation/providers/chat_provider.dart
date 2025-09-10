import 'package:flutter/material.dart';
import 'package:yes_no_app/config/theme/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entitites/message.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';

class ChatProvider extends ChangeNotifier {
  final getYesNoAnswer = GetYesNoAnswer();
  final ScrollController chatScrollControler = ScrollController();

  List<Message> message = [
    Message(text: "Qué tal Neferpitou", fromWho: FromWho.me),
    Message(text: "Cómo estás?", fromWho: FromWho.me),
  ];

  var messageList;

  Future<void> herReply() async {
    final HerMessage = await getYesNoAnswer.getAnswer;
    messageList.add(HerMessage);
    notifyListeners();
    moveScrollToBotton();
  }

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith('?')) {
      await herReply();
    }

    notifyListeners();
    await moveScrollToBotton();
  }

  Future<void> moveScrollToBotton() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollControler.animateTo(chatScrollControler.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInBack);
  }
}
