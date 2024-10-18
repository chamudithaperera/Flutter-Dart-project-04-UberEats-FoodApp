import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  // Sample order data
  final List<Map<String, dynamic>> orders = [
    {
      'id': 'OD001',
      'status': 'Delivered',
      'date': '2024-10-18',
      'time': '12:30 PM',
      'total': '\$45.99',
      'items': [
        {'name': 'Burger', 'quantity': 2, 'price': '\$10.99'},
        {'name': 'Fries', 'quantity': 1, 'price': '\$5.50'},
        {'name': 'Coke', 'quantity': 2, 'price': '\$2.50'}
      ]
    },
    {
      'id': 'OD002',
      'status': 'In Progress',
      'date': '2024-10-17',
      'time': '6:45 PM',
      'total': '\$29.99',
      'items': [
        {'name': 'Pizza', 'quantity': 1, 'price': '\$15.99'},
        {'name': 'Garlic Bread', 'quantity': 1, 'price': '\$4.50'},
        {'name': 'Lemonade', 'quantity': 2, 'price': '\$3.50'}
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Sidebar menu action
          },
        ),
        title: Row(
          children: [
            Icon(Icons.location_on),
            SizedBox(width: 5),
            Text(
              'Western Province, Kalutara',
              style: TextStyle(fontSize: 13),
            ), // Location text
            Spacer(),
            CircleAvatar(
              backgroundImage: AssetImage('assets/profile_image.png'), // Profile image
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF06C167), // Fixed green color
                borderRadius: BorderRadius.circular(20), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 5), // Shadow effect
                  ),
                ],
              ),
              child: ExpansionTile(
                leading: _getStatusIcon(order['status']),
                title: Text(
                  'Order ID: ${order['id']}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Status: ${order['status']}',
                      style: TextStyle(color: Colors.white70),
                    ),
                    Text(
                      'Date: ${order['date']} - ${order['time']}',
                      style: TextStyle(color: Colors.white70),
                    ),
                    Text(
                      'Total: ${order['total']}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                children: order['items'].map<Widget>((item) {
                  return ListTile(
                    tileColor: Colors.white, // White background for items
                    title: Text(item['name'], style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('Quantity: ${item['quantity']}'),
                    trailing: Text(item['price']),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }

  // Function to get an icon based on the status of the order
  Widget _getStatusIcon(String status) {
    if (status == 'Delivered') {
      return Icon(Icons.check_circle, color: Colors.white);
    } else if (status == 'In Progress') {
      return Icon(Icons.local_shipping, color: Colors.white);
    } else {
      return Icon(Icons.cancel, color: Colors.white);
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: OrdersPage(),
  ));
}
