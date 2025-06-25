import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tp1_2363662/widgets/app_drawer.dart';
import 'generated/l10n.dart';
import 'lib_http.dart';
import 'transfer.dart';
import 'package:image_picker/image_picker.dart';

class EcranConsultation extends StatefulWidget {
  final int tacheId;

  const EcranConsultation({super.key, required this.tacheId});

  @override
  State<EcranConsultation> createState() => _EcranConsultationState();
}

class _EcranConsultationState extends State<EcranConsultation> with WidgetsBindingObserver {
  late ReponseDetailTacheAvecPhoto _tache;
  bool _isLoading = true;
  bool _isImageLoading = false;

  String imagePath = "";
  String imageURL = "";
  XFile? pickedImage;
  final _dateFormatter = DateFormat('dd/MM/yyyy');


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loadTacheDetails();
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
      _loadTacheDetails();
    }
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

  String _formatDate(DateTime date) {
    return _dateFormatter.format(date);
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
        SnackBar(content: Text((S.of(context).ErreurImportation))),
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
        title: Text((S.of(context).ConsultationTitre)),
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
              '${S.of(context).NomTache}${_tache.nom}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '${S.of(context).DeadlineTache}${_formatDate(_tache.dateLimite)}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              '${S.of(context).TempsEcouleTache}${_tache.pourcentageTemps}%',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              '${S.of(context).AvancementTache}${_tache.pourcentageAvancement.toStringAsFixed(0)}%',
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
                    ? Text(S.of(context).ImporterImageEnPremier)
                    : SizedBox(
                  width: 300,
                  height: 250,
                  child: CachedNetworkImage(
                    imageUrl: imageURL,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            _isImageLoading
                ? const Center(child: CircularProgressIndicator())
                : Center(
                child: ElevatedButton(
                  onPressed: getImageAndSend,
                  child: Text(S.of(context).ImporterImage),
                )
            ),
            Center(
            child: TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/accueil',
                      (Route<dynamic> route) => false,);
              },
              child: Text(S.of(context).RetourAccueil),
            )
            ),
          ],
        ),
      ),
    );
  }
}