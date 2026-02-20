// =============================================================================
// Exercice 6 — Application multi-écrans
// =============================================================================
// PRÉREQUIS :
//   - Flutter SDK installé (v3.0+) : https://docs.flutter.dev/get-started/install
//   - Un IDE : VS Code (recommandé) ou Android Studio
//   - Un émulateur Android/iOS ou un appareil physique connecté
//
// ÉTAPES POUR EXÉCUTER :
//   1. Créer un nouveau projet Flutter :
//        flutter create mon_projet
//        cd mon_projet
//
//   2. Remplacer le contenu de lib/main.dart par ce fichier
//
//   3. Lancer l'application :
//        flutter run
//
//   Pour choisir un appareil spécifique :
//        flutter devices          (liste les appareils disponibles)
//        flutter run -d chrome    (exécuter dans le navigateur)
//        flutter run -d <id>      (exécuter sur un appareil précis)
// =============================================================================

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Accueil')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Navigation entre écrans',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              icon: const Icon(Icons.list),
              label: const Text('Liste d\'éléments'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ItemListPage()),
                );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.settings),
              label: const Text('Paramètres'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsPage()),
                );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.info),
              label: const Text('À propos'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ItemListPage extends StatelessWidget {
  const ItemListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(20, (index) => 'Élément ${index + 1}');

    return Scaffold(
      appBar: AppBar(title: const Text('Liste d\'éléments')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text(items[index]),
            subtitle: Text('Description de ${items[index]}'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(itemName: items[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String itemName;

  const DetailPage({super.key, required this.itemName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(itemName)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              itemName,
              style: const TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Ceci est la page de détail avec les informations détaillées sur l\'élément sélectionné. Dans une application réelle, vous afficheriez ici des données spécifiques à l\'élément.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              'Caractéristiques:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...List.generate(
              5,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle, color: Colors.green),
                    const SizedBox(width: 8),
                    Text(
                      'Caractéristique ${index + 1}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  bool _darkMode = false;
  double _textSize = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paramètres')),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Activer les notifications'),
            subtitle: const Text('Recevez des alertes de l\'application'),
            value: _notificationsEnabled,
            onChanged: (value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
          ),
          const Divider(),
          SwitchListTile(
            title: const Text('Mode sombre'),
            subtitle: const Text('Changer l\'apparence de l\'application'),
            value: _darkMode,
            onChanged: (value) {
              setState(() {
                _darkMode = value;
              });
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Taille du texte'),
            subtitle: Slider(
              value: _textSize,
              min: 0.5,
              max: 1.5,
              divisions: 4,
              label: '${_textSize.toStringAsFixed(1)}x',
              onChanged: (value) {
                setState(() {
                  _textSize = value;
                });
              },
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Effacer les données'),
            subtitle: const Text('Supprimer toutes les données utilisateur'),
            trailing: const Icon(Icons.delete_forever, color: Colors.red),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Confirmer'),
                  content: const Text(
                    'Êtes-vous sûr de vouloir effacer toutes les données?',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Annuler'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Données effacées')),
                        );
                      },
                      child: const Text('Confirmer'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('À propos')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.teal,
              child: Icon(Icons.flutter_dash, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 20),
            const Text(
              'Application de démonstration Flutter',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Version 1.0.0',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            const Text(
              'Cette application a été créée dans le cadre d\'un atelier sur Flutter pour démontrer les concepts de navigation et de gestion des écrans multiples.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            const Text(
              '© 2025 - Tous droits réservés',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}