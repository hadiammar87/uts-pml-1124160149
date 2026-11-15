import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../widgets/info_tile.dart';
import 'edit_profile_page.dart';
import 'about_page.dart';

class ProfilePage extends StatefulWidget {
  final ValueNotifier<ThemeMode> themeNotifier;

  const ProfilePage({super.key, required this.themeNotifier});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileData profile = ProfileData(
    name: 'Hadi Ammar',
    nim: '1124160149',
    prodi: 'Teknik Informatika',
    email: 'hadiammar116@gmail.com',
    phone: '08999187350',
    github: 'github.com/hadiammar87',
    bio: 'Mahasiswa Teknik Informatika yang sedang mendalami Flutter dan pengembangan aplikasi mobile.',
  );

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              widget.themeNotifier.value = isDark ? ThemeMode.light : ThemeMode.dark;
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(profile.name),
              accountEmail: Text(profile.nim),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/hadi.jpeg'),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Tentang Saya'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit Profil'),
              onTap: () async {
                Navigator.pop(context);
                final updatedProfile = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfilePage(profile: profile),
                  ),
                );
                if (updatedProfile != null) {
                  setState(() {
                    profile = updatedProfile;
                  });
                }
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/hadi.jpeg'),
              ),
              const SizedBox(height: 16),
              Text(
                profile.name,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 4),
              Text('NIM: ${profile.nim}', style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 2),
              Text('Prodi: ${profile.prodi}', style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(profile.bio, textAlign: TextAlign.center),
                ),
              ),
              const SizedBox(height: 16),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Kontak & Informasi', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 8),
              InfoTile(icon: Icons.email, label: 'Email', value: profile.email),
              InfoTile(icon: Icons.phone, label: 'Nomor HP', value: profile.phone),
              InfoTile(icon: Icons.code, label: 'GitHub', value: profile.github),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final updatedProfile = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditProfilePage(profile: profile),
            ),
          );
          if (updatedProfile != null) {
            setState(() {
              profile = updatedProfile;
            });
          }
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}