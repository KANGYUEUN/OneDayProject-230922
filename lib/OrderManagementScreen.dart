// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:oneday/main.dart';

class OrderManagementScreen extends StatefulWidget {
  final OrderTable table;

  const OrderManagementScreen(
      {super.key, required this.table, required List orderList});

  @override
  State<OrderManagementScreen> createState() => _OrderManagementScreenState();
}

class _OrderManagementScreenState extends State<OrderManagementScreen> {
  final TextEditingController _orderController = TextEditingController();
  final TextEditingController _editOrderController =
      TextEditingController(); // 추가: 수정을 위한 컨트롤러
  bool isEditing = false; // 추가: 항목 수정 모드를 나타내는 변수
  int editingIndex = -1; // 추가: 수정 중인 항목의 인덱스

  @override
  void dispose() {
    _orderController.dispose();
    super.dispose();
  }

  void _addToOrderList() {
    final String item = _orderController.text;
    if (item.isNotEmpty) {
      setState(() {
        widget.table.orderList.add(item);
        _orderController.clear();
      });
    }
  }

  void _removeFromOrderList(String item) {
    setState(() {
      widget.table.orderList.remove(item);
    });
  }

  void _startEditing(int index) {
    setState(() {
      isEditing = true;
      editingIndex = index;
      _editOrderController.text = widget.table.orderList[index];
    });
  }

  void _saveEdit() {
    final String editedItem = _editOrderController.text;
    if (editedItem.isNotEmpty) {
      setState(() {
        widget.table.orderList[editingIndex] = editedItem;
        isEditing = false;
        editingIndex = -1;
        _editOrderController.clear();
      });
    }
  }

  void _cancelEdit() {
    setState(() {
      isEditing = false;
      editingIndex = -1;
      _editOrderController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' ${widget.table.tableNumber} 테이블 주문 관리'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: isEditing ? _editOrderController : _orderController,
            decoration: const InputDecoration(labelText: '주문 항목'),
          ),
          ElevatedButton(
            onPressed: isEditing ? _saveEdit : _addToOrderList,
            child: Text(isEditing ? '저장' : '주문 추가'),
          ),
          if (isEditing)
            ElevatedButton(
              onPressed: _cancelEdit,
              child: const Text('취소'),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.table.orderList.length,
              itemBuilder: (context, index) {
                final item = widget.table.orderList[index];
                return ListTile(
                  title: Text(item),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          _startEditing(index);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          _removeFromOrderList(item);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
