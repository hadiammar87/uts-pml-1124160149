import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> skills = [
      'Mobile Development (Flutter & Dart)',
      'Pemrograman Berorientasi Objek & Logika',
      'Version Control (Git & GitHub)',
    ];

    final List<String> education = [
      'Global Institute - Teknik Informatika (2024 - Sekarang)',
      'SMA PKMB Karya Agung (2019 - 2022)',
      'SMP Nusantara 1 (2016 - 2019)',
      'SD Karawaci Baru 6 (2010 - 2016)'
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Saya'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Riwayat Pendidikan',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...education.map((edu) => Card(
                child: ListTile(
                  leading: const Icon(Icons.school),
                  title: Text(edu),
                ),
              )),
          const SizedBox(height: 24),
          const Text(
            'Keahlian & Minat',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...skills.map((skill) => Card(
                child: ListTile(
                  leading: const Icon(Icons.code),
                  title: Text(skill),
                ),
              )),
        ],
      ),
    );
  }
}