// =============================================================================
// Exercice 2 — Mise en page basique
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
      home: Scaffold(
        appBar: AppBar(title: const Text('Mise en page basique')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'En-tête',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.blue[100],
              child: const Text('Contenu dans un container'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text('Bouton 1')),
                ElevatedButton(onPressed: () {}, child: const Text('Bouton 2')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}