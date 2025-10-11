import 'package:flutter/material.dart';
import 'dart:math';

class TakeTicketScreen extends StatefulWidget {
  const TakeTicketScreen({super.key});

  @override
  State<TakeTicketScreen> createState() => _TakeTicketScreenState();
}

class _TakeTicketScreenState extends State<TakeTicketScreen> {
  String? ticketNumber;

  void generateTicket() {
    // Randomly generate a ticket number (e.g. A001, A002, etc.)
    final random = Random();
    int number = random.nextInt(900) + 100; // range 100–999
    setState(() {
      ticketNumber = "A$number";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take a Ticket'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Tap the button to get your queue ticket',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: generateTicket,
                icon: const Icon(Icons.confirmation_number),
                label: const Text('Generate Ticket'),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
              ),
              const SizedBox(height: 40),
              if (ticketNumber != null)
                Column(
                  children: [
                    const Text(
                      'Your Ticket Number:',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      ticketNumber!,
                      style: const TextStyle(
                        fontSize: 40,
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
