import 'package:flutter/material.dart';

class PagarContasPage extends StatefulWidget {
  @override
  _PagarContasPageState createState() => _PagarContasPageState();
}

class _PagarContasPageState extends State<PagarContasPage> {
  final _formKey = GlobalKey<FormState>();
  final _billAmountController = TextEditingController();
  final _billDetailsController = TextEditingController();

  @override
  void dispose() {
    _billAmountController.dispose();
    _billDetailsController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      // Lógica para processar o pagamento
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Confirmação'),
          content: Text('Conta paga com sucesso!'),
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
        title: Text('Pagar Contas'),
        backgroundColor: Colors.green[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Informações para pagar contas:',
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
                    controller: _billAmountController,
                    decoration: InputDecoration(
                      labelText: 'Valor da Conta',
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
                        return 'Por favor, insira o valor da conta';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Insira um valor válido';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _billDetailsController,
                    decoration: InputDecoration(
                      labelText: 'Código de Barras',
                      labelStyle: TextStyle(color: Colors.green[800]),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green[800]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green[200]!),
                      ),
                      prefixIcon: Icon(Icons.code, color: Colors.green[800]),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o código de barras';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _submit,
                    child: Text('Pagar Conta'),
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
