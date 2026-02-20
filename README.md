Atelier Flutter - Exercices Pratiques
https://img.shields.io/badge/Flutter-3.0+-blue.svg
https://img.shields.io/badge/Dart-2.12+-green.svg
https://img.shields.io/badge/License-MIT-yellow.svg

📋 Description
Ce dépôt contient une série d'exercices pratiques pour apprendre le développement d'applications mobiles avec Flutter. Chaque exercice aborde des concepts fondamentaux progressifs, de la création d'une première application simple à une application complète de gestion de tâches.

🗂️ Structure des exercices
Exercice	Titre	Concepts abordés	Niveau
1️⃣	Première application	Widgets de base, MaterialApp, Scaffold	⭐☆☆
2️⃣	Mise en page basique	Column, Row, Container, SizedBox	⭐☆☆
3️⃣	Composants Material	Boutons, Switch, Slider, Card, FAB	⭐⭐☆
4️⃣	Compteur interactif	StatefulWidget, setState, interactions	⭐⭐☆
5️⃣	Formulaire avec validation	Form, validation, contrôleurs, Radio, Switch	⭐⭐⭐
6️⃣	Application multi-écrans	Navigation, passage de paramètres, AlertDialog	⭐⭐⭐
7️⃣	Liste de tâches (Todo App)	CRUD, Dismissible, DatePicker, gestion d'état avancée	⭐⭐⭐
🚀 Prérequis
Avant de commencer, assurez-vous d'avoir installé :

Flutter SDK (version 3.0 ou supérieure) : Installation guide

Un IDE : VS Code (recommandé) ou Android Studio

Un émulateur : Android/iOS ou un appareil physique connecté

Git : Pour cloner le dépôt

⚙️ Installation
1️⃣ Cloner le dépôt
bash
git clone https://github.com/votre-nom/atelier-flutter.git
cd atelier-flutter
2️⃣ Créer un nouveau projet Flutter
bash
flutter create mon_projet
cd mon_projet
3️⃣ Remplacer le contenu de lib/main.dart
Copiez le contenu de l'exercice souhaité dans le fichier lib/main.dart

4️⃣ Lancer l'application
bash
flutter run
🎯 Exécution des exercices
📱 Sur appareil physique/émulateur
bash
# Lister les appareils disponibles
flutter devices

# Lancer sur un appareil spécifique
flutter run -d <device_id>

# Exemples
flutter run -d emulator-5554  # Android
flutter run -d iPhone-13      # iOS
🌐 Sur navigateur web
bash
flutter run -d chrome
flutter run -d edge
flutter run -d safari
💻 Sur bureau (Windows/macOS/Linux)
bash
flutter run -d windows
flutter run -d macos
flutter run -d linux
📚 Détail des exercices
Exercice 1 : Première application
Fichier : exercice1.dart

dart
// Objectif : Afficher "Bonjour Flutter !" au centre de l'écran
Concepts :

✅ Structure de base d'une app Flutter

✅ Widgets : MaterialApp, Scaffold, AppBar, Center, Text

✅ Widgets Stateless

Exercice 2 : Mise en page basique
Fichier : exercice2.dart

Concepts :

✅ Disposition verticale avec Column

✅ Disposition horizontale avec Row

✅ Espacement avec SizedBox

✅ Style avec Container

Exercice 3 : Composants Material Design
Fichier : exercice3.dart

Concepts :

✅ Boutons Material (ElevatedButton, TextButton, OutlinedButton)

✅ Contrôles interactifs (Switch, Slider)

✅ Cartes (Card)

✅ Thématisation (ThemeData)

Exercice 4 : Compteur interactif
Fichier : exercice4.dart

Concepts :

✅ Widgets Stateful

✅ Gestion d'état avec setState()

✅ Interactions utilisateur

✅ Personnalisation des boutons

Exercice 5 : Formulaire avec validation
Fichier : exercice5.dart

Concepts :

✅ Formulaire avec Form et GlobalKey

✅ Validation des champs

✅ Contrôleurs (TextEditingController)

✅ Widgets de sélection (RadioListTile, SwitchListTile)

✅ Notifications (SnackBar)

Exercice 6 : Application multi-écrans
Fichier : exercice6.dart

Concepts :

✅ Navigation avec Navigator

✅ Passage de paramètres

✅ Listes dynamiques (ListView.builder)

✅ Boîtes de dialogue (AlertDialog)

Exercice 7 : Liste de tâches (Todo App)
Fichier : exercice7.dart

Concepts :

✅ Modèle de données (Task)

✅ Opérations CRUD complètes

✅ Suppression par glissement (Dismissible)

✅ Sélecteur de date (showDatePicker)

✅ Filtrage et organisation des données

🛠️ Commandes utiles
Gestion du projet
bash
flutter doctor           # Vérifier l'installation
flutter clean           # Nettoyer le projet
flutter pub get         # Mettre à jour les dépendances
flutter pub upgrade     # Mettre à niveau les dépendances
Débogage
bash
flutter run --verbose   # Mode verbeux
flutter logs           # Voir les logs
flutter analyze        # Analyser le code
flutter test           # Lancer les tests
Build
bash
flutter build apk       # Build Android APK
flutter build ios       # Build iOS (macOS uniquement)
flutter build web       # Build web
flutter build windows   # Build Windows
⚠️ Résolution des problèmes courants
Erreur	Solution
No devices available	flutter emulators --launch <emulator> ou flutter run -d chrome
Method not found: 'runApp'	Ajouter import 'package:flutter/material.dart';
setState() called after dispose()	Vérifier if (mounted) avant setState()
Multiple widgets used the same GlobalKey	Utiliser des clés uniques
Erreur de version Dart	Vérifier pubspec.yaml et flutter upgrade
📊 Progression recommandée







🤝 Contribution
Les contributions sont les bienvenues ! Pour contribuer :

🍴 Forkez le projet

🌿 Créez votre branche (git checkout -b feature/Amelioration)

💾 Committez vos changements (git commit -m 'Ajout d'une fonctionnalité')

📤 Pushez vers la branche (git push origin feature/Amelioration)

🎯 Ouvrez une Pull Request

📄 License
Ce projet est sous licence MIT - voir le fichier LICENSE pour plus de détails.

📞 Contact
Auteur : [Votre Nom]

Email : [votre.email@example.com]

GitHub : @votre-github

LinkedIn : Votre Profil

🙏 Remerciements
Flutter Team pour ce framework exceptionnel

Material Design pour les guidelines UI

Tous les contributeurs et testeurs

📸 Captures d'écran
Exercice 1
https://screenshots/exercice1.png
Première application Flutter

Exercice 2
https://screenshots/exercice2.png
Mise en page basique

Exercice 3
https://screenshots/exercice3.png
Composants Material Design

Exercice 4
https://screenshots/exercice4.png
Compteur interactif

Exercice 5
https://screenshots/exercice5.png
Formulaire avec validation

Exercice 6
https://screenshots/exercice6.png
Application multi-écrans

Exercice 7
https://screenshots/exercice7.png
Liste de tâches (Todo App)

