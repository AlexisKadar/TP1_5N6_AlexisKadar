import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tp1_2363662/widgets/app_drawer.dart';
import 'lib_http.dart';
import 'transfer.dart';
import 'package:image_picker/image_picker.dart';

class EcranConsultation extends StatefulWidget {
  final int tacheId;

  const EcranConsultation({super.key, required this.tacheId});

  @override
  State<EcranConsultation> createState() => _EcranConsultationState();
}

class _EcranConsultationState extends State<EcranConsultation> {
  late ReponseDetailTacheAvecPhoto _tache;
  bool _isLoading = true;
  bool _isImageLoading = false;

  String imagePath = "";
  String imageURL = "";
  XFile? pickedImage;


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
        if(_tache.photoId != 0) {
          imageURL = "http://10.0.2.2:8080/fichier/${_tache.photoId.toString()}";
        }
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching task details: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  void getImageAndSend() async {
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
    });

    try {
      ImagePicker imagePicker = ImagePicker();
      pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
      imagePath = pickedImage!.path;


      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(
            pickedImage!.path, filename: pickedImage!.name),
        "taskID": widget.tacheId,
      });

      Dio dio = Dio();
      var response = await dio.post(
          "http://10.0.2.2:8080/fichier", data: formData);

      String id = response.data;

      imageURL = "http://10.0.2.2:8080/fichier/$id";

      setState(() {

      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erreur lors de l\'importation de l\'image')),
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
      appBar: AppBar(
        title: const Text('Consultation de la tâche'),
      ),
      drawer: const AppDrawer(),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 28.0),
              child: Center(
                child: (imageURL == "")
                    ? Text("Importer une image en premier")
                    : SizedBox(
                  width: 300,
                  height: 250,
                  child: Image.network(imageURL,
                    fit: BoxFit.contain,
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                      return const Center(
                        child: Text('Erreur de chargement de l\'image'),
                      );
                    },
                  ),
                ),
              ),
            ),
            _isImageLoading
                ? const Center(child: CircularProgressIndicator())
                : Center(
                child: ElevatedButton(
                  onPressed: getImageAndSend,
                  child: const Text('Importer image'),
                )
            ),
            Center(
            child: TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/accueil',
                      (Route<dynamic> route) => false,);
              },
              child: const Text('Retour à l\'accueil'),
            )
            ),
          ],
        ),
      ),
    );
  }
}