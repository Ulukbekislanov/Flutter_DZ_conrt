import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}
class _FeedbackScreenState extends State<FeedbackScreen> {
  String name = "";
  bool isSent = false;

  TextEditingController controller = TextEditingController();
  void sendFeedback() {
    if (name.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Введите имя")));
      return;
    }
    setState(() {
      isSent = true;
    });
    controller.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Обратная связь"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Обратная связь",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Пожалуйста, введите ваше имя и отправьте форму.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Ваше имя",
              ),
              onChanged: (value) {
                name = value;
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(onPressed: sendFeedback, child: Text("Отправить")),
            SizedBox(height: 20),
            if (isSent)
              Text(
                "Отправлено! Спасибо, $name",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.green, // изменение цвета
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
