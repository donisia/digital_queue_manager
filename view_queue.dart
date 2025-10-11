import 'package:flutter/material.dart';

class ViewQueueScreen extends StatelessWidget {
  const ViewQueueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // temporary list of queued users
    final List<Map<String, dynamic>> queueList = [
      {'ticket': 'A001', 'service': 'Customer Service', 'status': 'Waiting'},
      {'ticket': 'A002', 'service': 'ID Replacement', 'status': 'Being Served'},
      {'ticket': 'A003', 'service': 'Passport Renewal', 'status': 'Waiting'},
      {'ticket': 'A004', 'service': 'Business Permit', 'status': 'Done'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('View Queue'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: queueList.length,
        itemBuilder: (context, index) {
          final item = queueList[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            elevation: 3,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.indigo,
                child: Text(
                  item['ticket'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(item['service']),
              subtitle: Text('Status: ${item['status']}'),
              trailing: const Icon(Icons.chevron_right),
            ),
          );
        },
      ),
    );
  }
}
