import 'package:flutter/material.dart';

class TachesScreen extends StatefulWidget {
  const TachesScreen({super.key});

  @override
  State<TachesScreen> createState() => _TachesScreenState();
}

class _TachesScreenState extends State<TachesScreen> {
  String _filtre = 'Tous';

  final List<Map<String, dynamic>> _taches = [
    {
      'titre': 'Maquette site vitrine',
      'projet': 'Création d\'un site vitrine',
      'assigné': 'Eliott Lauwick',
      'priorite': 'Haute',
      'statut': 'Terminé',
      'échéance': '20/05/2026',
    },
    {
      'titre': 'Intégration page d\'accueil',
      'projet': 'Site Lois',
      'assigné': 'Eliott Lauwick',
      'priorite': 'Haute',
      'statut': 'En cours',
      'échéance': '30/05/2026',
    },
    {
      'titre': 'Rédaction contenu SEO',
      'projet': 'Site Lois',
      'assigné': 'Lois',
      'priorite': 'Moyenne',
      'statut': 'À faire',
      'échéance': '05/06/2026',
    },
    {
      'titre': 'Configuration hébergement',
      'projet': 'site du bg',
      'assigné': 'Eliott Lauwick',
      'priorite': 'Haute',
      'statut': 'En retard',
      'échéance': '15/05/2026',
    },
    {
      'titre': 'Envoi devis client',
      'projet': 'Test des tâches',
      'assigné': 'Eliott Lauwick',
      'priorite': 'Moyenne',
      'statut': 'À faire',
      'échéance': '28/05/2026',
    },
    {
      'titre': 'Correction bugs formulaire',
      'projet': 'Site Lois',
      'assigné': 'Eliott Lauwick',
      'priorite': 'Basse',
      'statut': 'En cours',
      'échéance': '01/06/2026',
    },
  ];

  final List<String> _filtres = ['Tous', 'À faire', 'En cours', 'Terminé', 'En retard'];

  List<Map<String, dynamic>> get _filtered => _filtre == 'Tous'
      ? _taches
      : _taches.where((t) => t['statut'] == _filtre).toList();

  Color _statutColor(String statut) {
    switch (statut) {
      case 'Terminé':
        return const Color(0xFF4CAF50);
      case 'En cours':
        return const Color(0xFF6C63FF);
      case 'À faire':
        return const Color(0xFFFF9800);
      case 'En retard':
        return const Color(0xFFE53935);
      default:
        return Colors.grey;
    }
  }

  Color _prioriteColor(String priorite) {
    switch (priorite) {
      case 'Haute':
        return const Color(0xFFE53935);
      case 'Moyenne':
        return const Color(0xFFFF9800);
      case 'Basse':
        return const Color(0xFF4CAF50);
      default:
        return Colors.grey;
    }
  }

  IconData _statutIcon(String statut) {
    switch (statut) {
      case 'Terminé':
        return Icons.check_circle;
      case 'En cours':
        return Icons.timelapse;
      case 'À faire':
        return Icons.radio_button_unchecked;
      case 'En retard':
        return Icons.warning_amber;
      default:
        return Icons.circle;
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
                    'Tâches',
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
                      '+ Tâche',
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
                '${_filtered.length} tâche(s)',
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
                  final tache = _filtered[index];
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          _statutIcon(tache['statut']),
                          color: _statutColor(tache['statut']),
                          size: 22,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tache['titre'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 14),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                tache['projet'],
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 12),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  Icon(Icons.person_outline,
                                      size: 12, color: Colors.grey[400]),
                                  const SizedBox(width: 4),
                                  Text(
                                    tache['assigné'],
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 11),
                                  ),
                                  const SizedBox(width: 12),
                                  Icon(Icons.calendar_today_outlined,
                                      size: 12, color: Colors.grey[400]),
                                  const SizedBox(width: 4),
                                  Text(
                                    tache['échéance'],
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 11),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 3),
                          decoration: BoxDecoration(
                            color: _prioriteColor(tache['priorite'])
                                .withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            tache['priorite'],
                            style: TextStyle(
                              fontSize: 10,
                              color: _prioriteColor(tache['priorite']),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
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