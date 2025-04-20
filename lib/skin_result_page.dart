// lib/skin_result_page.dart
import 'package:flutter/material.dart';

class SkinResultPage extends StatelessWidget {
  final String skinType;

  const SkinResultPage({super.key, required this.skinType});

  @override
  Widget build(BuildContext context) {
    final Map<String, List<String>> recommendations = {
      "Yağlı Cilt": [
        "Yağsız ve su bazlı nemlendiriciler tercih edin.",
        "Mat bitişli fondöten kullanın.",
        "Düzenli olarak kil maskesi uygulayın.",
      ],
      "Kuru Cilt": [
        "Yoğun nemlendirici kremler kullanın.",
        "Hyaluronik asit içeren serumlar tercih edin.",
        "Cildi tahriş etmeyen yumuşak temizleyiciler kullanın.",
      ],
      "Karma Cilt": [
        "T bölgesi için yağ dengeleyici ürünler kullanın.",
        "Diğer bölgeleri nemlendirici ile destekleyin.",
        "Jel temizleyiciler tercih edin.",
      ],
      "Hassas Cilt": [
        "Parfüm ve alkol içermeyen ürünler kullanın.",
        "Cildinizi ovmadan nazikçe temizleyin.",
        "Güneş koruyucu kullanmayı unutmayın.",
      ],
      "Normal Cilt": [
        "Cilt bakım rutininizi düzenli uygulayın.",
        "Hafif nemlendirici kullanın.",
        "Sağlıklı beslenmeye özen gösterin.",
      ],
    };

    return Scaffold(
      appBar: AppBar(
        title: Text("Cilt Tipi Sonucu"),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Cilt Tipiniz: $skinType",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "Önerilen Bakım İpuçları:",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            ...(recommendations[skinType] ?? ["Öneri bulunamadı."]).map((tip) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("• ", style: TextStyle(fontSize: 18)),
                      Expanded(child: Text(tip, style: const TextStyle(fontSize: 16))),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}