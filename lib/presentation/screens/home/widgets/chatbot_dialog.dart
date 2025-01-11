import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lakshmi_setu/core/theme/theme_extensions.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatbotDialog extends StatefulWidget {
  const ChatbotDialog({super.key});

  @override
  ChatbotDialogState createState() => ChatbotDialogState();
}

class ChatbotDialogState extends State<ChatbotDialog> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, String>> _messages = [];
  bool _isLoading = false;

  Future<void> _sendMessage(String message) async {
    setState(() {
      _isLoading = true;
      _messages.add({"sender": "user", "text": message});
    });

    try {
      final response = await http.post(
        Uri.parse('${dotenv.env['ChatBot_Url']}$message'),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _messages.add({"sender": "bot", "text": data["response"]});
        });
      } else {
        setState(() {
          _messages.add(
              {"sender": "bot", "text": "Error: Unable to fetch response."});
        });
      }
    } catch (e) {
      setState(() {
        _messages.add({"sender": "bot", "text": "Error: $e"});
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Chatbot Assistant",
        style: context.textTheme.headlineSmall,
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return Align(
                    alignment: message["sender"] == "user"
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: message["sender"] == "user"
                            ? Colors.blueAccent
                            : Color(0xFF8DA47E),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        message["text"]!,
                        style: context.textTheme.bodySmall!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            if (_isLoading) Center(),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "Type your message...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  color: context.colorScheme.primary,
                  onPressed: () {
                    final message = _messageController.text.trim();
                    if (message.isNotEmpty) {
                      _sendMessage(message);
                      _messageController.clear();
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text("Close"),
        ),
      ],
    );
  }
}
