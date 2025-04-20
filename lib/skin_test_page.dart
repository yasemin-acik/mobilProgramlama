import 'package:flutter/material.dart';
import 'app_data.dart'; // Cilt tipi global değişken
import 'skin_result_page.dart'; // Sonuç ekranı

class SkinTestPage extends StatefulWidget {
  @override
  _SkinTestPageState createState() => _SkinTestPageState();
}

class _SkinTestPageState extends State<SkinTestPage> {
  final List<String> questions = [
    "Cildim gün içinde parlama yapar.",
    "Yüzümde kuruluk hissi sık sık olur.",
    "T bölgem diğer bölgelere göre daha yağlıdır.",
    "Cildimde pul pul dökülmeler olur.",
    "Cildim hassas ve kolay tahriş olur.",
    "Nemlendirici kullanmadığımda cildim gergin hissedilir.",
    "Cildim çok sık sivilce ya da siyah nokta üretir.",
    "Makyaj yaptıktan kısa süre sonra cildim yağlanır.",
    "Bazı bölgeler kuru, bazı bölgeler yağlı hissedilir.",
    "Soğuk havalarda cildim daha kuru olur.",
  ];

  List<String?> answers = List.filled(10, null);

  void calculateResult() {
    int yes = answers.where((a) => a == 'Evet').length;
    String result;

    if (yes >= 6) {
      result = "Yağlı Cilt";
    } else if (answers[1] == 'Evet' && answers[3] == 'Evet' && answers[5] == 'Evet') {
      result = "Kuru Cilt";
    } else if (answers[2] == 'Evet' && answers[8] == 'Evet') {
      result = "Karma Cilt";
    } else if (answers[4] == 'Evet') {
      result = "Hassas Cilt";
    } else {
      result = "Normal Cilt";
    }

    // Sonucu global olarak sakla
    AppData.skinType = result;

    // Sonuç ekranına geç
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SkinResultPage(skinType: result),
      ),
    );
  }

  Widget buildQuestion(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          questions[index],
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Row(
          children: ['Evet', 'Hayır', 'Bazen'].map((option) {
            return Expanded(
              child: RadioListTile<String>(
                title: Text(option),
                value: option,
                groupValue: answers[index],
                onChanged: (value) {
                  setState(() {
                    answers[index] = value!;
                  });
                },
              ),
            );
          }).toList(),
        ),
        Divider(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cilt Testi"),
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ...List.generate(questions.length, (index) => buildQuestion(index)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateResult,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              ),
              child: Text("Cilt Tipimi Göster"),
            ),
          ],
        ),
      ),
    );
  }
}