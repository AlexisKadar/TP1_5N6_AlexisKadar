import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tp1_2363662/transfer.dart';
import 'package:tp1_2363662/user_singleton.dart';

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
          const SnackBar(content: Text('Les mots de passe ne correspondent pas')),
        );
      } else if (e.response?.data == "NomDejaPris") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Nom d\'utilisateur déjà pris')),
        );
      }  else if (e.response?.data == "NomTropCourt") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Nom d\'utilisateur est trop court')),
        );
      }
      else if (e.response?.data == "NomTropLong") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Nom d\'utilisateur est trop long')),
        );
      }
      else if (e.response?.data == "MotDePasseTropCourt") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Mot de passe est trop court')),
        );
      }
      else if (e.response?.data == "MotDePasseTropLong") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Mot de passe est trop long')),
        );
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Erreur lors de l\'inscription, vérifiez votre connexion')),
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
      appBar: AppBar(title: const Text('Inscription')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: "Nom d'utilisateur",
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: "Mot de passe",
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _confirmPasswordController,
              decoration: const InputDecoration(
                labelText: "Confirmer le mot de passe",
              ),
              obscureText: true,
            ),
            const SizedBox(height: 32),
            _isLoading
              ? const CircularProgressIndicator()
              : ElevatedButton(
              onPressed: faireInscription,
              child: const Text('Inscription'),
            ),
          ],
        ),
      ),
    );
  }
}