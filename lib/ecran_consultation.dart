import 'package:flutter/material.dart';
import 'lib_http.dart';
import 'transfer.dart';

class EcranConsultation extends StatefulWidget {
  final int tacheId;

  const EcranConsultation({super.key, required this.tacheId});

  @override
  State<EcranConsultation> createState() => _EcranConsultationState();
}

class _EcranConsultationState extends State<EcranConsultation> {
  late ReponseDetailTache _tache;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTacheDetails();
  }

  Future<void> _loadTacheDetails() async {
    try {
      final response = await consultation(widget.tacheId);
      setState(() {
        _tache = response;
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching task details: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultation de la tâche'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nom : ${_tache.nom}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Date d\'échéance : ${_tache.dateLimite}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              'Pourcentage de temps écoulé : ${_tache.pourcentageTemps}%',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              'Pourcentage d\'avancement : ${_tache.pourcentageAvancement.toStringAsFixed(0)}%',
              style: const TextStyle(fontSize: 16),
            ),
            Slider(
              value: _tache.pourcentageAvancement.toDouble(),
              min: 0,
              max: 100,
              divisions: 100,
              label: '${_tache.pourcentageAvancement.toStringAsFixed(0)}%',
              onChanged: (value) async {
                setState(() {
                  _tache.pourcentageAvancement = value.toInt();
                });
                try {
                  await updateProgress(widget.tacheId, value.toInt());
                } catch (e) {
                  print('Error updating progress: $e');
                }
                // Optionally, save the updated value to the server here
              },
            ),
          ],
        ),
      ),
    );
  }
}