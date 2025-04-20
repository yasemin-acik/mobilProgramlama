import 'package:flutter/material.dart';
import 'app_data.dart'; // Cilt tipi verisini alacağız

class MakeupSuggestionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Global değişken olan cilt tipini al
    String skinType = AppData.skinType;

    // Cilt tipine göre öneri metni ve makyaj ürünleri listeleri
    String makeupRecommendation;
    List<String> makeupProductRecommendations;

    switch (skinType) {
      case 'Yağlı Cilt':
        makeupRecommendation = 'Yağlı ciltler için matlaştırıcı bazlar ve pudralar tercih edilmelidir. Ciltteki parlamayı engellemek için mat formüller önerilir.';
        makeupProductRecommendations = [
          'Yağlı Ciltler İçin Matlaştırıcı Baz',
          'Pudra',
          'Yağ Kontrol Spreyi',
          'Mat Fondöten',
        ];
        break;
      case 'Kuru Cilt':
        makeupRecommendation = 'Kuru ciltler için nemlendirici bazlar ve dewy (ışıltılı) fondötenler tercih edilmelidir. Cilt nemli ve parlak görünmelidir.';
        makeupProductRecommendations = [
          'Nemlendirici Makyaj Bazı',
          'Dewy (Işıltılı) Fondöten',
          'Hyalüronik Asit İçeren Makyaj Ürünleri',
          'Nemlendirici Setting Spray',
        ];
        break;
      case 'Karma Cilt':
        makeupRecommendation = 'Karma ciltler için dengeleyici bazlar kullanmak önemlidir. T bölgesine matlaştırıcı, yanaklara ise nemlendirici ürünler tercih edilmelidir.';
        makeupProductRecommendations = [
          'Dengeleyici Makyaj Bazı',
          'Karma Ciltler İçin Fondöten',
          'Matlaştırıcı Pudra',
          'Nemlendirici Allık',
        ];
        break;
      case 'Hassas Cilt':
        makeupRecommendation = 'Hassas ciltler için parfümsüz ve hipoalerjenik makyaj ürünleri kullanılmalıdır. Cilt dostu, rahatlatıcı ürünler tercih edilmelidir.';
        makeupProductRecommendations = [
          'Hipoalerjenik Fondöten',
          'Cilt Yatıştırıcı Makyaj Bazı',
          'Parfümsüz Allık',
          'Aloe Vera Makyaj Ürünleri',
        ];
        break;
      case 'Normal Cilt':
        makeupRecommendation = 'Normal ciltler için çeşitli makyaj ürünleri uygundur. Işıltılı veya mat formüller, farklı seçeneklerle cildinize uyarlanabilir.';
        makeupProductRecommendations = [
          'Işıltılı Makyaj Bazı',
          'Hafif Fondöten',
          'Allık',
          'Makyaj Sabitleyici Sprey',
        ];
        break;
      default:
        makeupRecommendation = 'Cilt tipiniz belirlenmedi. Lütfen cilt analizini tamamlayın.';
        makeupProductRecommendations = [];
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Makyaj Önerileri'),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cilt Tipiniz: $skinType',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              makeupRecommendation,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            Text(
              'Önerilen Makyaj Ürünleri:',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),
            ),
            const SizedBox(height: 12),
            // Makyaj ürünleri listesi
            Expanded(
              child: ListView.builder(
                itemCount: makeupProductRecommendations.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12.0),
                      title: Text(
                        makeupProductRecommendations[index],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}