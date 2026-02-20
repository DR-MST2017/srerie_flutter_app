// =============================================================================
// Exercice 7 — Liste de tâches (Todo App)
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
      title: 'Liste de Tâches',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const TodoApp(),
    );
  }
}

class Task {
  final String id;
  String title;
  String description;
  DateTime dueDate;
  bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    this.isCompleted = false,
  });

  Task copyWith({
    String? title,
    String? description,
    DateTime? dueDate,
    bool? isCompleted,
  }) {
    return Task(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final List<Task> _tasks = [];
  int _idCounter = 0;

  String _generateId() => 'task_${_idCounter++}';

  void _addTask() async {
    final result = await showDialog<Task>(
      context: context,
      builder: (context) => const TaskDialog(),
    );
    if (result != null) {
      setState(() {
        _tasks.add(Task(
          id: _generateId(),
          title: result.title,
          description: result.description,
          dueDate: result.dueDate,
        ));
      });
    }
  }

  void _editTask(Task task) async {
    final result = await showDialog<Task>(
      context: context,
      builder: (context) => TaskDialog(task: task),
    );
    if (result != null) {
      setState(() {
        final index = _tasks.indexWhere((t) => t.id == task.id);
        if (index != -1) {
          _tasks[index] = task.copyWith(
            title: result.title,
            description: result.description,
            dueDate: result.dueDate,
            isCompleted: result.isCompleted,
          );
        }
      });
    }
  }

  void _deleteTask(String id) {
    setState(() {
      _tasks.removeWhere((t) => t.id == id);
    });
  }

  void _toggleTask(String id) {
    setState(() {
      final index = _tasks.indexWhere((t) => t.id == id);
      if (index != -1) {
        _tasks[index] = _tasks[index].copyWith(
          isCompleted: !_tasks[index].isCompleted,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final pending = _tasks.where((t) => !t.isCompleted).toList();
    final completed = _tasks.where((t) => t.isCompleted).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste de Tâches'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                '${pending.length} en cours',
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ),
        ],
      ),
      body: _tasks.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check_circle_outline, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'Aucune tâche pour le moment.\nAppuyez sur + pour en ajouter une.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView(
              children: [
                if (pending.isNotEmpty) ...[
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 12, 16, 4),
                    child: Text(
                      'EN COURS',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  ...pending.map((task) => _TaskTile(
                        task: task,
                        onToggle: () => _toggleTask(task.id),
                        onEdit: () => _editTask(task),
                        onDelete: () => _deleteTask(task.id),
                      )),
                ],
                if (completed.isNotEmpty) ...[
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 12, 16, 4),
                    child: Text(
                      'COMPLÉTÉES',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  ...completed.map((task) => _TaskTile(
                        task: task,
                        onToggle: () => _toggleTask(task.id),
                        onEdit: () => _editTask(task),
                        onDelete: () => _deleteTask(task.id),
                      )),
                ],
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        tooltip: 'Ajouter une tâche',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _TaskTile extends StatelessWidget {
  final Task task;
  final VoidCallback onToggle;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _TaskTile({
    required this.task,
    required this.onToggle,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final isOverdue = !task.isCompleted &&
        task.dueDate.isBefore(DateTime.now());

    return Dismissible(
      key: Key(task.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) => onDelete(),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: ListTile(
          leading: Checkbox(
            value: task.isCompleted,
            onChanged: (_) => onToggle(),
          ),
          title: Text(
            task.title,
            style: TextStyle(
              decoration: task.isCompleted ? TextDecoration.lineThrough : null,
              color: task.isCompleted ? Colors.grey : null,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (task.description.isNotEmpty)
                Text(
                  task.description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12),
                ),
              Text(
                '📅 ${task.dueDate.day}/${task.dueDate.month}/${task.dueDate.year}',
                style: TextStyle(
                  fontSize: 12,
                  color: isOverdue ? Colors.red : Colors.grey,
                  fontWeight: isOverdue ? FontWeight.bold : null,
                ),
              ),
            ],
          ),
          trailing: IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: onEdit,
          ),
        ),
      ),
    );
  }
}

class TaskDialog extends StatefulWidget {
  final Task? task;

  const TaskDialog({super.key, this.task});

  @override
  State<TaskDialog> createState() => _TaskDialogState();
}

class _TaskDialogState extends State<TaskDialog> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late DateTime _selectedDate;
  late bool _isCompleted;

  @override
  void initState() {
    super.initState();
    final task = widget.task;
    _titleController = TextEditingController(text: task?.title ?? '');
    _descriptionController =
        TextEditingController(text: task?.description ?? '');
    _selectedDate =
        task?.dueDate ?? DateTime.now().add(const Duration(days: 1));
    _isCompleted = task?.isCompleted ?? false;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.task != null;

    return AlertDialog(
      title: Text(isEditing ? 'Modifier la tâche' : 'Nouvelle tâche'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Titre',
                border: OutlineInputBorder(),
              ),
              autofocus: true,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text("Date d'échéance:"),
                const Spacer(),
                TextButton(
                  onPressed: () => _selectDate(context),
                  child: Text(
                    '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                  ),
                ),
              ],
            ),
            if (isEditing)
              CheckboxListTile(
                title: const Text('Tâche complétée'),
                value: _isCompleted,
                contentPadding: EdgeInsets.zero,
                onChanged: (value) {
                  setState(() {
                    _isCompleted = value ?? false;
                  });
                },
              ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Annuler'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_titleController.text.trim().isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Le titre ne peut pas être vide')),
              );
              return;
            }
            final task = Task(
              id: widget.task?.id ?? '',
              title: _titleController.text.trim(),
              description: _descriptionController.text.trim(),
              dueDate: _selectedDate,
              isCompleted: _isCompleted,
            );
            Navigator.pop(context, task);
          },
          child: Text(isEditing ? 'Enregistrer' : 'Ajouter'),
        ),
      ],
    );
  }
}