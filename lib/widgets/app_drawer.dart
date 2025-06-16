import 'package:flutter/material.dart';
import '../lib_http.dart';
import '../user_singleton.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final username = UserSingleton().username ?? "Utilisateur";

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(username),
            accountEmail: const Text(""),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Accueil'),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/accueil',
                    (Route<dynamic> route) => false,
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Ajout de tâche'),
            onTap: () {
              Navigator.pushNamed(context, '/creation');
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Déconnexion'),
            onTap: () {
              deconnexion();
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/connexion',
                    (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}