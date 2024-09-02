import 'package:flutter/material.dart';

class ConfiguracoesPage extends StatelessWidget {
  const ConfiguracoesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildSettingItem(
              icon: Icons.lock,
              text: 'Alterar Senha',
              onTap: () {
                // Adicione a lógica para alterar a senha
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Alterar Senha clicado')),
                );
              },
            ),
            _buildSettingItem(
              icon: Icons.notifications,
              text: 'Notificações',
              onTap: () {
                // Adicione a lógica para configurações de notificações
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Notificações clicado')),
                );
              },
            ),
            _buildSettingItem(
              icon: Icons.security,
              text: 'Segurança',
              onTap: () {
                // Adicione a lógica para configurações de segurança
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Segurança clicado')),
                );
              },
            ),
            _buildSettingItem(
              icon: Icons.language,
              text: 'Idioma',
              onTap: () {
                // Adicione a lógica para configurações de idioma
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Idioma clicado')),
                );
              },
            ),
            _buildSettingItem(
              icon: Icons.help,
              text: 'Ajuda e Suporte',
              onTap: () {
                // Adicione a lógica para ajuda e suporte
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Ajuda e Suporte clicado')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, size: 24, color: Colors.greenAccent),
      title: Text(
        text,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      onTap: onTap,
    );
  }
}
