import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tp1_2363662/transfer.dart';
import 'package:tp1_2363662/user_singleton.dart';

import 'generated/l10n.dart';
import 'lib_http.dart';

class EcranConnexion extends StatefulWidget {
  const EcranConnexion({super.key});

  @override
  State<EcranConnexion> createState() => _EcranConnexionState();
}

class _EcranConnexionState extends State<EcranConnexion> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> faireConnexion() async {
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
    });

    try {
      RequeteConnexion req = RequeteConnexion();
      req.nom = _usernameController.text;
      req.motDePasse = _passwordController.text;
      var reponse = await connexion(req);
      print(reponse);
      UserSingleton().username = _usernameController.text;
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/accueil',
            (Route<dynamic> route) => false,
      );
    } on DioError catch (e) {
      if (e.response?.data == "MauvaisNomOuMotDePasse") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text((S.of(context).MauvaisNomOuMotDePasse))),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text((S.of(context).ErreurConnexion))),
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
      appBar: AppBar(title: Text((S.of(context).Login))),
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
            const SizedBox(height: 32),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
              onPressed: faireConnexion,
              child: Text((S.of(context).Login)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/inscription');
              },
              child: Text(S.of(context).Inscription),
            ),
          ],
        ),
      ),
    );
  }
}