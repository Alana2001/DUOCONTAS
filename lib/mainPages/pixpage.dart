import 'package:flutter/material.dart';

class PixPage extends StatefulWidget {
  @override
  _PixPageState createState() => _PixPageState();
}

class _PixPageState extends State<PixPage> {
  final _formKey = GlobalKey<FormState>();
  final _valueController = TextEditingController();
  final _keyController = TextEditingController();

  @override
  void dispose() {
    _valueController.dispose();
    _keyController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      // Lógica para processar o PIX
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Confirmação'),
          content: Text('PIX realizado com sucesso!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Fechar'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fazer PIX'),
        backgroundColor: Colors.green[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Informações para realizar o PIX:',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green[800],
              ),
            ),
            SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _valueController,
                    decoration: InputDecoration(
                      labelText: 'Valor',
                      labelStyle: TextStyle(color: Colors.green[800]),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green[800]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green[200]!),
                      ),
                      prefixIcon:
                          Icon(Icons.monetization_on, color: Colors.green[800]),
                    ),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o valor';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Insira um valor válido';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _keyController,
                    decoration: InputDecoration(
                      labelText: 'Chave PIX',
                      labelStyle: TextStyle(color: Colors.green[800]),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green[800]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green[200]!),
                      ),
                      prefixIcon: Icon(Icons.key, color: Colors.green[800]),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a chave PIX';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _submit,
                    child: Text('Confirmar PIX'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green[700],
                      padding: EdgeInsets.symmetric(vertical: 16),
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
