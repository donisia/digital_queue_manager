import 'package:flutter/material.dart';
import 'view_queue.dart';

void main() {
  runApp(const DigitalQueueManager());
}

class DigitalQueueManager extends StatelessWidget {
  const DigitalQueueManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Queue Manager',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Digital Queue Manager'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.confirmation_number_outlined,
                size: 100,
                color: Colors.indigo,
              ),
              const SizedBox(height: 30),
              const Text(
                'Welcome to Digital Queue Manager!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TakeTicketScreen()),
                  );
                },
                icon: const Icon(Icons.add_circle_outline),
                label: const Text('Take a Ticket'),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ViewQueueScreen()),
                  );
                },
                icon: const Icon(Icons.queue),
                label: const Text('View Queue'),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TakeTicketScreen extends StatefulWidget {
  const TakeTicketScreen({super.key});

  @override
  State<TakeTicketScreen> createState() => _TakeTicketScreenState();
}

class _TakeTicketScreenState extends State<TakeTicketScreen> {
  int ticketNumber = 0;

  void generateTicket() {
    setState(() {
      ticketNumber++;
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
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ticketNumber == 0
                    ? 'Press below to get your ticket'
                    : 'Your Ticket Number:',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              if (ticketNumber > 0)
                Text(
                  'A${ticketNumber.toString().padLeft(3, '0')}',
                  style: const TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: generateTicket,
                icon: const Icon(Icons.confirmation_number),
                label: const Text('Get Ticket'),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
