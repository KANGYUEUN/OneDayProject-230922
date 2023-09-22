import 'package:flutter/material.dart';
import 'package:oneday/OrderManagementScreen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('김밥 테이블 POS'),
        ),
        body: const TableManagement(),
      ),
    );
  }
}

class TableManagement extends StatefulWidget {
  const TableManagement({super.key});

  @override
  State<TableManagement> createState() => _TableManagementState();
}

class _TableManagementState extends State<TableManagement> {
  List<bool> isTableSelected = List.generate(9, (index) => false);
  List<OrderTable> orderTables = List.generate(
      9, (index) => OrderTable(tableNumber: index + 1, orderList: []));

  void toggleTableSelection(int index) {
    setState(() {
      isTableSelected[index] = !isTableSelected[index];
      if (isTableSelected[index]) {
        _openOrderManagementScreen(orderTables[index]);
      }
    });
  }

  void _openOrderManagementScreen(OrderTable table) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => OrderManagementScreen(table: table),
      ),
    );
  }

  // void addToOrderList(String item, double price) {
  //   setState(() {
  //     orderList.add(item);
  //     totalAmount += price;
  //   });
  // }

  // void removeFromOrderList(String item, double price) {
  //   setState(() {
  //     orderList.remove(item);
  //     totalAmount -= price;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        final isSelected = isTableSelected[index];
        final tableNumber = index + 1;

        return GestureDetector(
          onTap: () {
            toggleTableSelection(index);
          },
          child: Card(
            margin: const EdgeInsets.all(18.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: isSelected ? Colors.green : Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '테이블 $tableNumber',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 8.0),
                isSelected
                    ? const Icon(Icons.check_box, color: Colors.red)
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class OrderTable {
  final int tableNumber;
  final List<String> orderList;

  OrderTable({required this.tableNumber, required this.orderList});
}
