import 'package:flutter/material.dart';

class MeusDadosBancariosPage extends StatelessWidget {
  const MeusDadosBancariosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Dados Bancários'),
        backgroundColor: Colors.greenAccent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Informações Bancárias
            _buildSectionTitle('Informações Bancárias'),
            _buildInfoCard(
              title: 'Banco',
              content: 'CAIXA',
            ),
            _buildInfoCard(
              title: 'Agência',
              content: '2776',
            ),
            _buildInfoCard(
              title: 'Conta Corrente',
              content: '123456-7',
            ),
            _buildInfoCard(
              title: 'Titular',
              content: 'Alana Castro',
            ),
            SizedBox(height: 20),

            // Botão para Editar Dados Bancários
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Adicione a lógica para editar informações bancárias
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Editar Dados Bancários',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método para construir o título da seção
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  // Método para construir o cartão de informações
  Widget _buildInfoCard({required String title, required String content}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        title: Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          content,
          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
        ),
      ),
    );
  }
}
