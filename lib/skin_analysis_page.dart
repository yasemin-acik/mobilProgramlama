import 'package:flutter/material.dart';

class SkinAnalysisPage extends StatelessWidget {
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Cildiniz gün içerisinde nasıl hissediyor?',
      'options': ['Kuru', 'Normal', 'Yağlı']
    },
    {
      'question': 'Yüzünüzde gün sonunda parlama olur mu?',
      'options': ['Hayır', 'Bazen', 'Evet']
    },
    {
      'question': 'Cildinizde sık sık kuruluk veya pullanma olur mu?',
      'options': ['Hayır', 'Bazen', 'Evet']
    },
    {
      'question': 'Gözeneklerinizin görünürlüğü nasıldır?',
      'options': ['Belirsiz', 'Orta', 'Belirgin']
    },
    {
      'question': 'Makyaj ürünleri cildinizde nasıl durur?',
      'options': ['Çabuk dağılır', 'Orta düzeyde', 'Gün boyu kalıcı']
    },
    {
      'question': 'Cildinizde hassasiyet veya kızarıklık olur mu?',
      'options': ['Hayır', 'Ara sıra', 'Sık sık']
    },
    {
      'question': 'Mevsim geçişlerinde cildiniz nasıl etkilenir?',
      'options': ['Değişmez', 'Hafif etkilenir', 'Çok etkilenir']
    },
    {
      'question': 'Yüzünüzde farklı bölgelerde farklı cilt özellikleri var mı?',
      'options': ['Hayır', 'Bazen', 'Evet']
    },
  ];

  SkinAnalysisPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Cilt Tipi Analizi',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink[800],
                  ),
                ),
                SizedBox(height: 16),
                // 'toList()' kaldırıldı çünkü spread operatörü ile zaten liste doğrudan kullanılabilir
                ...questions.map((q) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          q['question'],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10),
                        Wrap(
                          spacing: 8.0,
                          children: q['options'].map<Widget>((option) {
                            return ChoiceChip(
                              label: Text(option),
                              selected: false,
                              onSelected: (_) {},
                              selectedColor: Colors.pink[200],
                            );
                          }).toList(), // .toList() burada kullanılabilir çünkü map fonksiyonu liste döndürür
                        ),
                      ],
                    ),
                  );
                }).toList(), // Bu satırda .toList() kullanılabilir, çünkü .map() bir Iterable döndürür
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Analiz tamamlandı.')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    padding: EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                  ),
                  child: Text('Analizi Tamamla', style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}