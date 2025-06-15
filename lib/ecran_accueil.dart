import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'lib_http.dart';
import 'transfer.dart';

class EcranAccueil extends StatefulWidget {
  const EcranAccueil({super.key});

  @override
  State<EcranAccueil> createState() => _EcranAccueilState();
}

class _EcranAccueilState extends State<EcranAccueil> {
  List<ReponseAccueilItem> _taches = [];
  bool _isLoading = true;
  final _dateFormatter = DateFormat('dd/MM/yyyy');

  @override
  void initState() {
    super.initState();
    _loadTaches();
  }

  Future<void> _loadTaches() async {
    try {
      final response = await accueil();
      setState(() {
        _taches = response;
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching tasks: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  String _formatDate(DateTime date) {
    return _dateFormatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _taches.isEmpty
          ? const Center(child: Text('Aucune tâche disponible'))
          : ListView.builder(
        itemCount: _taches.length,
        itemBuilder: (context, index) {
          final tache = _taches[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(tache.nom),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Avancement : ${tache.pourcentageAvancement}%'),
                  Text('Temps écoulé : ${tache.pourcentageTemps}%'),
                  Text('Date limite : ${_formatDate(tache.dateLimite)}'),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EcranConsultation(),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/creation');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class EcranConsultation extends StatelessWidget {
  const EcranConsultation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultation de la tâche'),
      ),
      body: const Center(
        child: Text('Écran de consultation (placeholder)'),
      ),
    );
  }
}