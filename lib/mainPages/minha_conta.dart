import 'package:flutter/material.dart';

class MinhaContaPage extends StatelessWidget {
  const MinhaContaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Conta'),
        backgroundColor: Colors.greenAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        // Adicione o SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Informações Pessoais
              _buildSectionTitle('Informações Pessoais'),
              _buildInfoCard(
                title: 'Nome',
                content: 'Alana Castro',
              ),
              _buildInfoCard(
                title: 'E-mail',
                content: 'alana.castro@email.com',
              ),
              _buildInfoCard(
                title: 'Telefone',
                content: '(99) 99999-9999',
              ),
              SizedBox(height: 20),

              // Endereço
              _buildSectionTitle('Endereço'),
              _buildInfoCard(
                title: 'Endereço',
                content:
                    'Rua Barão do Paraim, 110\nCentro\nCorrente, PI\nCEP 64980-000',
              ),
              SizedBox(height: 20),

              // Botão para Editar Informações
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Adicione a lógica para editar informações da conta
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Editar Informações',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
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
