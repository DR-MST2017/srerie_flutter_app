// =============================================================================
// Exercice 4 — Compteur interactif
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const CounterApp(),
    );
  }
}

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  void _reset() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compteur Interactif'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _reset,
            tooltip: 'Réinitialiser',
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Valeur actuelle:', style: TextStyle(fontSize: 18)),
            Text(
              '$_counter',
              style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _decrement,
                  icon: const Icon(Icons.remove),
                  label: const Text('Diminuer'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: _increment,
                  icon: const Icon(Icons.add),
                  label: const Text('Augmenter'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}