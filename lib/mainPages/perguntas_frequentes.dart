import 'package:flutter/material.dart';

class PerguntasFrequentesPage extends StatelessWidget {
  const PerguntasFrequentesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perguntas Frequentes'),
        backgroundColor: Colors.greenAccent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildFAQItem(
              question: 'Como eu posso alterar minha senha?',
              answer:
                  'Para alterar sua senha, vá até as configurações de conta e selecione "Alterar Senha". Siga as instruções fornecidas.',
            ),
            _buildFAQItem(
              question: 'Como posso atualizar meus dados bancários?',
              answer:
                  'Para atualizar seus dados bancários, acesse "Meus Dados Bancários" e selecione "Editar Dados Bancários".',
            ),
            _buildFAQItem(
              question: 'Como faço para entrar em contato com o suporte?',
              answer:
                  'Você pode entrar em contato com o suporte através do e-mail suporteduocontas@gmail.com ou pelo telefone 0800 103 103 1245.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQItem({required String question, required String answer}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        title: Text(
          question,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              answer,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
