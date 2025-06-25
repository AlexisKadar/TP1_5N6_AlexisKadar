import 'package:flutter/material.dart';
import 'package:tp1_2363662/transfer.dart';
import 'package:tp1_2363662/widgets/app_drawer.dart';

import 'generated/l10n.dart';
import 'lib_http.dart';

class EcranCreation extends StatefulWidget {
  const EcranCreation({super.key});

  @override
  _EcranCreationState createState() => _EcranCreationState();
}

class _EcranCreationState extends State<EcranCreation> {
  final TextEditingController _nomController = TextEditingController();
  DateTime? _dateEcheance;
  bool _isLoading = false;

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

  Future<void> ajouterLaTache() async {
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
    });

    try {
      RequeteAjoutTache req = RequeteAjoutTache();
      req.nom = _nomController.text;
      req.dateLimite = _dateEcheance ?? DateTime.now();
      await ajoutTache(req);
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/accueil',
            (Route<dynamic> route) => false,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text((S.of(context).ErreurAjout))),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text((S.of(context).AjoutTitre))),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomController,
              decoration: InputDecoration(labelText: (S.of(context).NomTacheCreation)),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _dateEcheance == null
                        ? (S.of(context).AucuneDateSelectionnee)
                        : '${S.of(context).DealineCreation}${_dateEcheance!.day}/${_dateEcheance!.month}/${_dateEcheance!.year}',
                  ),
                ),
                TextButton(
                  onPressed: () => _selectDate(context),
                  child: Text((S.of(context).ChooseDate)),
                ),
              ],
            ),
            const SizedBox(height: 32),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
              onPressed: ajouterLaTache,
              child: Text((S.of(context).BoutonAjouterTache)),
            ),
          ],
        ),
      ),
    );
  }
}
