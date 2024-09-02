import 'package:contas_compartilhadas/models/models.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'pixpage.dart'; // Importa a página PixPage
import 'pagarcontaspage.dart'; // Importa a página PagarContasPage
import 'creategroupage.dart'; // Importa a página CreateGroupPage

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isBalanceVisible = true;

  void _toggleBalanceVisibility() {
    setState(() {
      _isBalanceVisible = !_isBalanceVisible;
    });
  }

  void _generateReports() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Gerar Relatórios'),
        content: Text('Aqui você pode implementar a geração de relatórios.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Fechar'),
          ),
        ],
      ),
    );
  }

  void _navigateToPixPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PixPage()),
    );
  }

  void _navigateToPagarContasPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PagarContasPage()),
    );
  }

  void _navigateToCreateGroupPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateGroupPage(
          onGroupCreated: (Group newGroup) {
            // Implementar o que deve ser feito com o novo grupo
            // Por exemplo, você pode atualizar a lista de grupos aqui
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Conta'),
        backgroundColor: Colors.green[800],
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildProfileSection(),
            _buildBalanceSection(),
            _buildChartsSection(),
            _buildUpcomingTransactionsSection(),
            _buildWeeklyCalendarSection(),
            _buildActionButtons(),
            _buildAdditionalButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.green[50],
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/profile_picture.png'),
          ),
          SizedBox(width: 16),
          Text(
            'Alana Castro',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.green[800],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceSection() {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.green[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Saldo Total',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green[800]),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                _isBalanceVisible ? 'R\$ 5.432,78' : 'xxxxx',
                style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              IconButton(
                icon: Icon(
                  _isBalanceVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.green[800],
                ),
                onPressed: _toggleBalanceVisibility,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChartsSection() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Despesas Mensais',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green[800]),
          ),
          SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: SfCircularChart(
              legend: Legend(isVisible: true),
              series: <CircularSeries>[
                PieSeries<ExpenseData, String>(
                  dataSource: getExpenseData(),
                  xValueMapper: (ExpenseData data, _) => data.category,
                  yValueMapper: (ExpenseData data, _) => data.amount,
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                  pointColorMapper: (ExpenseData data, _) {
                    switch (data.category) {
                      case 'Alimentação':
                        return Colors.green[600];
                      case 'Transporte':
                        return Colors.green[500];
                      case 'Lazer':
                        return Colors.green[400];
                      case 'Outros':
                        return Colors.green[300];
                      default:
                        return Colors.green[200];
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<ExpenseData> getExpenseData() {
    return [
      ExpenseData('Alimentação', 150),
      ExpenseData('Transporte', 30),
      ExpenseData('Lazer', 80),
      ExpenseData('Outros', 70),
    ];
  }

  Widget _buildUpcomingTransactionsSection() {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.green[50],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Transações Futuras',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green[800]),
          ),
          SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  leading:
                      Icon(Icons.monetization_on, color: Colors.green[800]),
                  title: Text('Pagamento ${index + 1}'),
                  subtitle: Text('Data: 10/09/2024'),
                  trailing: Text('R\$ 100,00',
                      style: TextStyle(color: Colors.redAccent)),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildWeeklyCalendarSection() {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.green[100],
      child: SfCalendar(
        view: CalendarView.week,
        initialSelectedDate: DateTime.now(),
        headerHeight: 60,
        headerStyle: CalendarHeaderStyle(
          textAlign: TextAlign.center,
          textStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.green[800],
          ),
        ),
        viewHeaderStyle: ViewHeaderStyle(
          dayTextStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.green[800],
          ),
        ),
        cellBorderColor: Colors.green[200],
        todayHighlightColor: Colors.green[800],
        appointmentTextStyle: TextStyle(
          color: Colors.black87,
        ),
        monthViewSettings: MonthViewSettings(
          showAgenda: true,
          agendaStyle: AgendaStyle(
            backgroundColor: Colors.green[50],
            appointmentTextStyle: TextStyle(
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: _generateReports,
            child:
                Text('Gerar Relatórios', style: TextStyle(color: Colors.black)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[600],
              foregroundColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdditionalButtons() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: _navigateToPixPage, // Navegar para a página Pix
            child: Text('Fazer PIX', style: TextStyle(color: Colors.black)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[700],
              foregroundColor: Colors.black,
              minimumSize: Size(double.infinity, 50),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed:
                _navigateToPagarContasPage, // Navegar para a página Pagar Contas
            child: Text('Pagar Contas', style: TextStyle(color: Colors.black)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[700],
              foregroundColor: Colors.black,
              minimumSize: Size(double.infinity, 50),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed:
                _navigateToCreateGroupPage, // Navegar para a página Criar Grupo
            child: Text('Criar Grupo', style: TextStyle(color: Colors.black)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[700],
              foregroundColor: Colors.black,
              minimumSize: Size(double.infinity, 50),
            ),
          ),
        ],
      ),
    );
  }
}

class ExpenseData {
  ExpenseData(this.category, this.amount);

  final String category;
  final double amount;
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text('Resultados para "$query"'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('Sugestões de busca para "$query"'),
    );
  }
}
