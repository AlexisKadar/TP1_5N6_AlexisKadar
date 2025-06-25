import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tp1_2363662/transfer.dart';
import 'package:tp1_2363662/user_singleton.dart';

import 'generated/l10n.dart';
import 'lib_http.dart';

class EcranInscription extends StatefulWidget {
  const EcranInscription({super.key});

  @override
  State<EcranInscription> createState() => _EcranInscriptionState();
}

class _EcranInscriptionState extends State<EcranInscription> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isLoading = false;

  Future<void> faireInscription() async {
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
    });

    try {
      RequeteInscription req = RequeteInscription();
      req.nom = _usernameController.text;
      req.motDePasse = _passwordController.text;
      req.confirmationMotDePasse = _confirmPasswordController.text;
      var reponse = await inscription(req);
      print(reponse);
      UserSingleton().username = _usernameController.text;
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/accueil',
            (Route<dynamic> route) => false,
      );
    } on DioError catch (e) {
      if(e.response?.data == "MotsDePasseDifferents") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text((S.of(context).MotsDePasseDifferents))),
        );
      } else if (e.response?.data == "NomDejaPris") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text((S.of(context).NomDejaPris))),
        );
      }  else if (e.response?.data == "NomTropCourt") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text((S.of(context).NomTropCourt))),
        );
      }
      else if (e.response?.data == "NomTropLong") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text((S.of(context).NomTropLong))),
        );
      }
      else if (e.response?.data == "MotDePasseTropCourt") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text((S.of(context).MotDePasseTropCourt))),
        );
      }
      else if (e.response?.data == "MotDePasseTropLong") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text((S.of(context).MotDePasseTropLong))),
        );
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text((S.of(context).ErreurInscription))),
        );
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Text((S.of(context).Inscription))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: (S.of(context).Username),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: (S.of(context).Password),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                labelText: (S.of(context).ConfirmezMotDePasse),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 32),
            _isLoading
              ? const CircularProgressIndicator()
              : ElevatedButton(
              onPressed: faireInscription,
              child: Text((S.of(context).Inscription)),
            ),
          ],
        ),
      ),
    );
  }
}