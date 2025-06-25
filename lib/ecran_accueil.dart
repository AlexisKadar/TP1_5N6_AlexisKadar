import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tp1_2363662/widgets/app_drawer.dart';
import 'ecran_consultation.dart';
import 'generated/l10n.dart';
import 'lib_http.dart';
import 'transfer.dart';

class EcranAccueil extends StatefulWidget {
  const EcranAccueil({super.key});

  @override
  State<EcranAccueil> createState() => _EcranAccueilState();
}

class _EcranAccueilState extends State<EcranAccueil> with WidgetsBindingObserver {
  List<ReponseAccueilItemAvecPhoto> _taches = [];
  bool _isLoading = true;
  bool _Error = false;
  final _dateFormatter = DateFormat('dd/MM/yyyy');
  String imageURL = "http://10.0.2.2:8080/fichier/";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    getList();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      setState(() {
        _isLoading = true;
      });
      getList();
    }
  }


  void getList() async {
    try {
      _taches = await accueil();
      setState(() {
        _isLoading = false;
        _Error = false;
      });
    } catch (e) {
      print('Error fetching tasks: $e');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text((S.of(context).ErreurReseau))));
      setState(() {
        _isLoading = false;
        _Error = true;
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
        title: Text((S.of(context).Accueil)),
      ),
      drawer: const AppDrawer(),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _Error
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text((S.of(context).ErreurReseau)),
            const SizedBox(height: 16),
            _isLoading
            ? const CircularProgressIndicator()
            : ElevatedButton(
              onPressed: () {
                setState(() {
                  _isLoading = true;
                });
                getList();
              },
              child: Text((S.of(context).Recharger)),
            ),
          ],
        ),
      )
          : _taches.isEmpty
          ? Center(child: Text((S.of(context).AucuneTache)))
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
                  Text('${S.of(context).Avancement}${tache.pourcentageAvancement}%'),
                  Text('${S.of(context).TempsEcoule}${tache.pourcentageTemps}%'),
                  Text('${S.of(context).DateLimite}${_formatDate(tache.dateLimite)}'),
                  (tache.idPhoto == 0)
                      ? Text((S.of(context).AucuneImage))
                      : SizedBox(
                    width: 350,
                    height: 250,
                    child: CachedNetworkImage(
                      imageUrl: imageURL + tache.idPhoto.toString() + "?largeur=350",
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      fit: BoxFit.contain,
                    ),
                  )

                ],
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EcranConsultation(tacheId: tache.id),
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
