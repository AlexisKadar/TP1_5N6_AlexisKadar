import 'package:flutter/material.dart';
import '../generated/l10n.dart';
import '../lib_http.dart';
import '../user_singleton.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final username = UserSingleton().username ?? (S.of(context).User);

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
            title: Text((S.of(context).Accueil)),
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
            title: Text((S.of(context).BoutonAjouterTache)),
            onTap: () {
              Navigator.pushNamed(context, '/creation');
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text((S.of(context).Deconnexion)),
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