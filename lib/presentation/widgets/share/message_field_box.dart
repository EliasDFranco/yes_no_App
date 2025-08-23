import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Color.fromARGB(137, 150, 110, 110)),
      borderRadius: BorderRadius.circular(40),
    );

    final inputDecoration = InputDecoration(
        hintText: 'End yout message with a  "??" ',
        enabledBorder: outlineInputBorder,
        fillColor: Colors.amber,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: (() {
            final textValue = textController.value.text;
            print("Button: $textValue");
            textController.clear();
          }),
        ));

    return TextFormField(
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print("Submit value $value");
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
