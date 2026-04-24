import 'package:flutter/material.dart';
import 'llm_service.dart';
import 'message.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController controller = TextEditingController();
  final List<Message> messages = [];
  final LlmService llm = LlmService();

  bool loading = false;

  void sendMessage() async {
    final text = controller.text;
    if (text.isEmpty) return;

    setState(() {
      messages.add(Message(role: "user", content: text));
      loading = true;
    });

    controller.clear();

    final reply = await llm.chat(text);

    setState(() {
      messages.add(Message(role: "assistant", content: reply));
      loading = false;
    });
  }

  Widget buildMessage(Message msg) {
    final isUser = msg.role == "user";

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isUser ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          msg.content,
          style: TextStyle(
            color: isUser ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LLM Chat Demo")),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: messages.map(buildMessage).toList(),
            ),
          ),

          if (loading) const LinearProgressIndicator(),

          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: "输入消息...",
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: sendMessage,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}