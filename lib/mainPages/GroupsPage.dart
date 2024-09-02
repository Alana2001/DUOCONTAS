import 'package:contas_compartilhadas/models/models.dart';
import 'package:flutter/material.dart';

class GroupsPage extends StatelessWidget {
  final List<Group> groups;

  GroupsPage({required this.groups});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grupos'),
        backgroundColor: Colors.green[800],
      ),
      body: ListView.builder(
        itemCount: groups.length,
        itemBuilder: (context, index) {
          final group = groups[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              title: Text(group.name),
              subtitle: Text('Tipo: ${group.accountType}'),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GroupDetailsPage(group: group),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class GroupDetailsPage extends StatelessWidget {
  final Group group;

  GroupDetailsPage({required this.group});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(group.name),
        backgroundColor: Colors.green[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tipo de Conta: ${group.accountType}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Membros:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: group.members.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(group.members[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
