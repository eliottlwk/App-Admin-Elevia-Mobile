import 'package:flutter/material.dart';
import 'projet_detail_screen.dart';

class ProjetsScreen extends StatefulWidget {
  const ProjetsScreen({super.key});

  @override
  State<ProjetsScreen> createState() => _ProjetsScreenState();
}

class _ProjetsScreenState extends State<ProjetsScreen> {
  String _filtre = 'Tous';

  final List<Map<String, dynamic>> _projets = [
    {
      'nom': 'Site Lois',
      'client': 'Lois',
      'tag': 'Vitrine',
      'montant': '1 000 €',
      'statut': 'En cours',
      'progress': 0.3,
      'taches': 4,
      'tachesFaites': 1,
    },
    {
      'nom': 'site du bg',
      'client': 'Lois',
      'tag': 'Autre',
      'montant': '10 000 €',
      'statut': 'En cours',
      'progress': 0.6,
      'taches': 3,
      'tachesFaites': 2,
    },
    {
      'nom': 'test notif',
      'client': 'Test',
      'tag': 'Autre',
      'montant': '350 €',
      'statut': 'En cours',
      'progress': 0.2,
      'taches': 2,
      'tachesFaites': 0,
    },
    {
      'nom': 'Test des tâches',
      'client': 'King Kong',
      'tag': 'Vitrine',
      'montant': '800 €',
      'statut': 'Devis',
      'progress': 0.1,
      'taches': 1,
      'tachesFaites': 0,
    },
    {
      'nom': 'Création d\'un site vitrine',
      'client': 'Eliott Lauwick',
      'tag': 'App web',
      'montant': '600 €',
      'statut': 'En cours',
      'progress': 0.5,
      'taches': 3,
      'tachesFaites': 1,
    },
  ];

  final List<String> _filtres = ['Tous', 'En cours', 'Devis', 'Livré'];

  List<Map<String, dynamic>> get _filtered => _filtre == 'Tous'
      ? _projets
      : _projets.where((p) => p['statut'] == _filtre).toList();

  Color _statutColor(String statut) {
    switch (statut) {
      case 'En cours':
        return const Color(0xFF6C63FF);
      case 'Devis':
        return const Color(0xFFFF9800);
      case 'Livré':
        return const Color(0xFF4CAF50);
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
                    'Projets',
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
                      '+ Projet',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Filtres
            SizedBox(
              height: 36,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _filtres.length,
                itemBuilder: (context, index) {
                  final filtre = _filtres[index];
                  final selected = _filtre == filtre;
                  return GestureDetector(
                    onTap: () => setState(() => _filtre = filtre),
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: selected
                            ? const Color(0xFF6C63FF)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Text(
                        filtre,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: selected ? Colors.white : Colors.grey,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),

            // Compteur
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '${_filtered.length} projet(s)',
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
                  final projet = _filtered[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProjetDetailScreen(projet: projet),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    projet['nom'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF0EEFF),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      projet['tag'],
                                      style: const TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFF6C63FF)),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                projet['montant'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            projet['client'],
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 12),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${projet['tachesFaites']}/${projet['taches']} tâches',
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 12),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: _statutColor(projet['statut'])
                                      .withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  projet['statut'],
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: _statutColor(projet['statut']),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          LinearProgressIndicator(
                            value: projet['progress'],
                            backgroundColor: const Color(0xFFEEEEEE),
                            color: const Color(0xFF6C63FF),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ],
                      ),
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