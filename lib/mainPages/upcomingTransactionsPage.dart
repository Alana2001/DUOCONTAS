import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  // Listas de transações
  final List<List<dynamic>> fixedExpenses = [
    [
      Icons.home,
      'Aluguel',
      DateTime.now().add(const Duration(days: 1)),
      'R\$ 1.000,00'
    ],
    [
      Icons.electric_car,
      'Energia',
      DateTime.now().add(const Duration(days: 2)),
      'R\$ 150,00'
    ]
  ];

  final List<List<dynamic>> variableExpenses = [
    [
      Icons.credit_card,
      'Cartão de Crédito',
      DateTime.now().add(const Duration(days: 3)),
      'R\$ 865,00'
    ],
    [
      Icons.movie,
      'Netflix',
      DateTime.now().add(const Duration(days: 4)),
      'R\$ 18,60'
    ],
    [
      Icons.motorcycle,
      'Honda',
      DateTime.now().add(const Duration(days: 5)),
      'R\$ 568,00'
    ],
    [
      Icons.music_note,
      'Spotify',
      DateTime.now().add(const Duration(days: 6)),
      'R\$ 22,00'
    ]
  ];

  void _addTransaction(String category) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String? title;
        String? amount;
        DateTime? selectedDate = DateTime.now();

        return AlertDialog(
          title: const Text("Adicionar Despesa"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: "Título"),
                onChanged: (value) {
                  title = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: "Valor (R\$)"),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  amount = value;
                },
              ),
              TextButton(
                child: const Text("Selecionar Data"),
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate!,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null && pickedDate != selectedDate) {
                    selectedDate = pickedDate;
                  }
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Adicionar"),
              onPressed: () {
                if (title != null && amount != null) {
                  setState(() {
                    final newTransaction = [
                      Icons.attach_money,
                      title!,
                      selectedDate!,
                      'R\$ $amount'
                    ];
                    if (category == 'fixas') {
                      fixedExpenses.add(newTransaction);
                    } else {
                      variableExpenses.add(newTransaction);
                    }
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteTransaction(String category, int index) {
    setState(() {
      if (category == 'fixas') {
        fixedExpenses.removeAt(index);
      } else {
        variableExpenses.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Próximas Despesas",
          style: TextStyle(
            color: Colors.black, // Cor do texto da AppBar
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white, // Cor do fundo da AppBar
        iconTheme: const IconThemeData(
            color: Colors.black), // Cor dos ícones da AppBar
      ),
      body: Column(
        children: [
          // Seção para Despesas Fixas
          Expanded(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Despesas Fixas",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Cor do texto das Despesas Fixas
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: false,
                    scrollDirection: Axis.vertical,
                    itemCount: fixedExpenses.length,
                    itemBuilder: (context, int index) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: Colors.greenAccent, width: 0.25),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          leading: Icon(
                            fixedExpenses[index][0],
                            color: Colors.greenAccent,
                          ),
                          title: Text(
                            fixedExpenses[index][1],
                            style: const TextStyle(color: Colors.greenAccent),
                          ),
                          subtitle: Text(fixedExpenses[index][3]),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                DateFormat.MMMMEEEEd()
                                    .format(fixedExpenses[index][2])
                                    .toString(),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete,
                                    color: Colors.redAccent),
                                onPressed: () {
                                  _deleteTransaction('fixas', index);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // Seção para Despesas Variáveis
          Expanded(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Despesas Variáveis",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color:
                          Colors.black, // Cor do texto das Despesas Variáveis
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: false,
                    scrollDirection: Axis.vertical,
                    itemCount: variableExpenses.length,
                    itemBuilder: (context, int index) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: Colors.greenAccent, width: 0.25),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          leading: Icon(
                            variableExpenses[index][0],
                            color: Colors.greenAccent,
                          ),
                          title: Text(
                            variableExpenses[index][1],
                            style: const TextStyle(color: Colors.greenAccent),
                          ),
                          subtitle: Text(variableExpenses[index][3]),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                DateFormat.MMMMEEEEd()
                                    .format(variableExpenses[index][2])
                                    .toString(),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete,
                                    color: Colors.redAccent),
                                onPressed: () {
                                  _deleteTransaction('variaveis', index);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show a dialog to choose between fixed or variable expenses
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Adicionar Despesa"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: const Text("Despesa Fixa"),
                      leading: const Icon(Icons.home),
                      onTap: () {
                        Navigator.of(context).pop();
                        _addTransaction('fixas');
                      },
                    ),
                    ListTile(
                      title: const Text("Despesa Variável"),
                      leading: const Icon(Icons.money_off),
                      onTap: () {
                        Navigator.of(context).pop();
                        _addTransaction('variaveis');
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
