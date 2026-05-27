import 'package:flutter/material.dart';
import 'facture_detail_screen.dart';

class FacturationScreen extends StatefulWidget {
  const FacturationScreen({super.key});

  @override
  State<FacturationScreen> createState() => _FacturationScreenState();
}

class _FacturationScreenState extends State<FacturationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> _factures = [
    {
      'ref': 'FAC-202605-003',
      'client': 'Lois',
      'montant': '10 000 €',
      'statut': 'Payé',
      'date': '26/05/2026',
    },
    {
      'ref': 'FAC-202605-002',
      'client': 'Test',
      'montant': '350 €',
      'statut': 'Envoyé',
      'date': '24/05/2026',
    },
    {
      'ref': 'FAC-202605-001',
      'client': 'Mairie de Toulon',
      'montant': '3 200 €',
      'statut': 'En retard',
      'date': '10/05/2026',
    },
  ];

  final List<Map<String, dynamic>> _devis = [
    {
      'ref': 'DEV-202605-005',
      'client': 'Lois',
      'montant': '10 000 €',
      'statut': 'Accepté',
      'date': '25/05/2026',
    },
    {
      'ref': 'DEV-202605-004',
      'client': 'Test',
      'montant': '350 €',
      'statut': 'Envoyé',
      'date': '24/05/2026',
    },
    {
      'ref': 'DEV-202605-003',
      'client': 'Restaurant Le Provençal',
      'montant': '1 800 €',
      'statut': 'En attente',
      'date': '20/05/2026',
    },
  ];

  Color _statutColor(String statut) {
    switch (statut) {
      case 'Payé':
      case 'Accepté':
        return const Color(0xFF4CAF50);
      case 'Envoyé':
        return const Color(0xFFFF9800);
      case 'En retard':
        return const Color(0xFFE53935);
      case 'En attente':
        return const Color(0xFF6C63FF);
      default:
        return Colors.grey;
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildList(List<Map<String, dynamic>> items) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => FactureDetailScreen(
                facture: item,
                isDevis: items == _devis,
              ),
            ),
          ),
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['client'],
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      item['ref'],
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    Text(
                      item['date'],
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      item['montant'],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: _statutColor(item['statut']).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        item['statut'],
                        style: TextStyle(
                          fontSize: 11,
                          color: _statutColor(item['statut']),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Facturation',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF6C63FF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      '+ Nouveau',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Tabs
            TabBar(
              controller: _tabController,
              labelColor: const Color(0xFF6C63FF),
              unselectedLabelColor: Colors.grey,
              indicatorColor: const Color(0xFF6C63FF),
              tabs: const [
                Tab(text: 'Factures'),
                Tab(text: 'Devis'),
              ],
            ),

            // Contenu
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildList(_factures),
                  _buildList(_devis),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}