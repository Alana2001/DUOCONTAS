import 'package:contas_compartilhadas/models/models.dart';
import 'package:flutter/material.dart';

class CreateGroupPage extends StatefulWidget {
  final Function(Group) onGroupCreated;

  CreateGroupPage({required this.onGroupCreated});

  @override
  _CreateGroupPageState createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends State<CreateGroupPage> {
  final _groupNameController = TextEditingController();
  String _accountType = 'Conta Simples';
  final List<String> _members = [];

  void _createGroup() {
    String groupName = _groupNameController.text;

    if (groupName.isNotEmpty) {
      // Cria o grupo
      Group newGroup = Group(
        name: groupName,
        accountType: _accountType,
        members: _members,
      );

      // Notifica que o grupo foi criado
      widget.onGroupCreated(newGroup);

      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Grupo Criado'),
          content:
              Text('Grupo "$groupName" criado com sucesso como $_accountType.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Fechar'),
            ),
          ],
        ),
      );
    } else {
      // Mensagem de erro
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Erro'),
          content: Text('Por favor, insira um nome para o grupo.'),
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

  void _addMember(String member) {
    setState(() {
      _members.add(member);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Novo Grupo'),
        backgroundColor: Colors.green[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome do Grupo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _groupNameController,
              decoration: InputDecoration(
                hintText: 'Digite o nome do grupo',
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Tipo de Conta',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: _accountType,
              items:
                  <String>['Conta Simples', 'Conta Prime'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _accountType = newValue!;
                });
              },
            ),
            SizedBox(height: 16),
            Text(
              'Membros',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // Adiciona um campo para inserir membros
            TextField(
              decoration: InputDecoration(
                hintText: 'Digite o nome do membro',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    // Adiciona o membro ao grupo
                    _addMember('Novo Membro');
                  },
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _members.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_members[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle),
                      onPressed: () {
                        setState(() {
                          _members.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _createGroup,
              child: Text('Criar Grupo'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.green[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
