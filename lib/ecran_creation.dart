import 'package:flutter/material.dart';
import 'package:tp1_2363662/transfer.dart';

class EcranCreation extends StatefulWidget {
  const EcranCreation({super.key});

  @override
  _EcranCreationState createState() => _EcranCreationState();
}

class _EcranCreationState extends State<EcranCreation> {
  final TextEditingController _nomController = TextEditingController();
  DateTime? _dateEcheance;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _dateEcheance = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Créer une tâche')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomController,
              decoration: InputDecoration(labelText: 'Nom de la tâche'),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _dateEcheance == null
                        ? 'Aucune date sélectionnée'
                        : 'Échéance : ${_dateEcheance!.day}/${_dateEcheance!.month}/${_dateEcheance!.year}',
                  ),
                ),
                TextButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Choisir la date'),
                ),
              ],
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                RequeteAjoutTache req = RequeteAjoutTache();
                req.nom = _nomController.text;
                req.dateLimite = _dateEcheance != null
                    ? '${_dateEcheance!.year}-${_dateEcheance!.month.toString().padLeft(2, '0')}-${_dateEcheance!.day.toString().padLeft(2, '0')}'
                    : '';
                Navigator.pushNamed(context, '/accueil');
              },
              child: Text('Ajouter'),
            ),
          ],
        ),
      ),
    );
  }
}

// Remplace ceci par ton widget d'accueil réel
class Accueil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Accueil')),
      body: Center(child: Text('Bienvenue sur l\'écran d\'accueil')),
    );
  }
}