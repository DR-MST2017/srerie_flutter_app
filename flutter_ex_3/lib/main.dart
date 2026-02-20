// =============================================================================
// Exercice 3 — Composants Material Design
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const MaterialComponentsDemo(),
    );
  }
}

class MaterialComponentsDemo extends StatefulWidget {
  const MaterialComponentsDemo({super.key});

  @override
  State<MaterialComponentsDemo> createState() =>
      _MaterialComponentsDemoState();
}

class _MaterialComponentsDemoState extends State<MaterialComponentsDemo> {
  bool _switch = false;
  double _slider = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Composants Material')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Boutons:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
                TextButton(onPressed: () {}, child: const Text('Text')),
                OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Contrôles:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SwitchListTile(
              title: const Text('Activer la fonctionnalité'),
              value: _switch,
              onChanged: (value) {
                setState(() {
                  _switch = value;
                });
              },
            ),
            Slider(
              value: _slider,
              onChanged: (value) {
                setState(() {
                  _slider = value;
                });
              },
            ),
            Text('Valeur: ${(_slider * 100).round()}'),
            const SizedBox(height: 20),
            const Text(
              'Cartes:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Titre de la carte',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Voici le contenu de cette carte Material Design. Les cartes sont utiles pour présenter des informations liées.',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}