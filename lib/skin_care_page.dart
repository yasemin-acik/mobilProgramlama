import 'package:flutter/material.dart';
import 'app_data.dart'; // Cilt tipi verisini alacağız

class SkinCarePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Global değişken olan cilt tipini al
    String skinType = AppData.skinType;

    // Cilt tipine göre öneri metni ve ürün listeleri
    String careRecommendation;
    List<String> productRecommendations;

    switch (skinType) {
      case 'Yağlı Cilt':
        careRecommendation = 'Yağlı ciltler için matlaştırıcı nemlendirici kullanın. Cilt temizliğine dikkat edin ve aşırı yağlanmayı engellemek için hafif formüller tercih edin.';
        productRecommendations = [
          'Yağlı Ciltler İçin Nemlendirici',
          'Yağ Kontrol Maskesi',
          'Matlaştırıcı Tonik',
          'Derin Temizleme Jeli',
        ];
        break;
      case 'Kuru Cilt':
        careRecommendation = 'Kuru ciltler için yoğun nemlendirici ve hyalüronik asit içeren ürünler önerilir. Cilt bariyerini güçlendirmek için yumuşatıcı kullanın.';
        productRecommendations = [
          'Yoğun Nemlendirici Krem',
          'Hyalüronik Asit Serumu',
          'Cilt Bariyerini Güçlendiren Maske',
          'Nemlendirici Yüz Temizleyici',
        ];
        break;
      case 'Karma Cilt':
        careRecommendation = 'Karma ciltler için dengeleyici bakım ürünleri tercih edin. T bölgesini matlaştırırken, yanakları nemlendirici ürünlerle besleyin.';
        productRecommendations = [
          'Dengeleyici Nemlendirici',
          'Karma Ciltler İçin Temizleyici',
          'Hafif Nemlendirici Serum',
          'Cilt Dengeleyici Tonik',
        ];
        break;
      case 'Hassas Cilt':
        careRecommendation = 'Hassas ciltler için parfümsüz ve hipoalerjenik ürünler kullanın. Cildinizi yatıştırmak için aloe vera ve yeşil çay içerikli ürünler tercih edin.';
        productRecommendations = [
          'Hassas Ciltler İçin Yatıştırıcı Krem',
          'Aloe Vera Maskesi',
          'Hipoalerjenik Nemlendirici',
          'Cilt Yatıştırıcı Serum',
        ];
        break;
      case 'Normal Cilt':
        careRecommendation = 'Normal ciltler için nemlendirici ve güneş koruyucu ürünler yeterlidir. Cildinizi dengelemek için hafif formüller kullanın.';
        productRecommendations = [
          'Günlük Nemlendirici',
          'Güneş Koruyucu Krem',
          'Hafif Temizleyici',
          'Nemlendirici Yüz Maskesi',
        ];
        break;
      default:
        careRecommendation = 'Cilt tipiniz belirlenmedi. Lütfen cilt analizini tamamlayın.';
        productRecommendations = [];
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cilt Bakımı Önerileri'),
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
              careRecommendation,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            Text(
              'Önerilen Ürünler:',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),
            ),
            const SizedBox(height: 12),
            // Ürün önerileri listesi
            Expanded(
              child: ListView.builder(
                itemCount: productRecommendations.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12.0),
                      title: Text(
                        productRecommendations[index],
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