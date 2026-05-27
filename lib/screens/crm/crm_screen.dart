import 'package:flutter/material.dart';

class CrmScreen extends StatefulWidget {
  const CrmScreen({super.key});

  @override
  State<CrmScreen> createState() => _CrmScreenState();
}

class _CrmScreenState extends State<CrmScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _search = '';

  final List<Map<String, dynamic>> _clients = [
    {
      'nom': 'Lois',
      'email': 'lois@example.com',
      'telephone': '06 12 34 56 78',
      'projets': 2,
      'statut': 'Actif',
      'initiales': 'LO',
      'color': Color(0xFF6C63FF),
    },
    {
      'nom': 'King Kong',
      'email': 'king@kong.com',
      'telephone': '06 98 76 54 32',
      'projets': 1,
      'statut': 'Actif',
      'initiales': 'KK',
      'color': Color(0xFF43C6AC),
    },
    {
      'nom': 'Eliott Lauwick',
      'email': 'eliott@elevia.app',
      'telephone': '06 11 22 33 44',
      'projets': 1,
      'statut': 'Actif',
      'initiales': 'EL',
      'color': Color(0xFFFF6584),
    },
    {
      'nom': 'Mairie de Toulon',
      'email': 'contact@mairie-toulon.fr',
      'telephone': '04 94 36 30 00',
      'projets': 1,
      'statut': 'Inactif',
      'initiales': 'MT',
      'color': Color(0xFFFF9800),
    },
    {
      'nom': 'Restaurant Le Provençal',
      'email': 'leprovencal@resto.fr',
      'telephone': '04 94 12 34 56',
      'projets': 1,
      'statut': 'Prospect',
      'initiales': 'RP',
      'color': Color(0xFF4CAF50),
    },
  ];

  List<Map<String, dynamic>> get _filtered => _clients
      .where((c) =>
          c['nom'].toLowerCase().contains(_search.toLowerCase()) ||
          c['email'].toLowerCase().contains(_search.toLowerCase()))
      .toList();

  Color _statutColor(String statut) {
    switch (statut) {
      case 'Actif':
        return const Color(0xFF4CAF50);
      case 'Inactif':
        return Colors.grey;
      case 'Prospect':
        return const Color(0xFF6C63FF);
      default:
        return Colors.grey;
    }
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
                    'CRM',
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
                      '+ Client',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Barre de recherche
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: _searchController,
                onChanged: (v) => setState(() => _search = v),
                decoration: InputDecoration(
                  hintText: 'Rechercher un client...',
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Compteur
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '${_filtered.length} client(s)',
                style: const TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ),
            const SizedBox(height: 8),

            // Liste
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _filtered.length,
                itemBuilder: (context, index) {
                  final client = _filtered[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(14),
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
                      children: [
                        CircleAvatar(
                          backgroundColor: client['color'],
                          child: Text(
                            client['initiales'],
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                client['nom'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 14),
                              ),
                              Text(
                                client['email'],
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 12),
                              ),
                              Text(
                                client['telephone'],
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: _statutColor(client['statut'])
                                    .withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                client['statut'],
                                style: TextStyle(
                                  fontSize: 11,
                                  color: _statutColor(client['statut']),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${client['projets']} projet(s)',
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 11),
                            ),
                          ],
                        ),
                      ],
                    ),
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