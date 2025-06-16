import 'package:flutter/material.dart';
import 'package:tp1_2363662/transfer.dart';
import 'package:tp1_2363662/widgets/app_drawer.dart';

import 'lib_http.dart';

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
      appBar: AppBar(title: const Text('Créer une tâche')),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomController,
              decoration: const InputDecoration(labelText: 'Nom de la tâche'),
            ),
            const SizedBox(height: 16),
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
                  child: const Text('Choisir la date'),
                ),
              ],
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () async {
                RequeteAjoutTache req = RequeteAjoutTache();
                req.nom = _nomController.text;
                req.dateLimite = _dateEcheance ?? DateTime.now(); // Utilisation directe de DateTime
                await ajoutTache(req);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/accueil',
                      (Route<dynamic> route) => false,
                );
              },
              child: const Text('Ajouter'),
            ),
          ],
        ),
      ),
    );
  }
}
