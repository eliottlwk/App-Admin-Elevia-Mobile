import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              const Text(
                'Bonjour, Eliott 👋',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A2E),
                ),
              ),
              const Text(
                'Voici un résumé de votre activité',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 24),

              // Cartes KPI
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.4,
                children: const [
                  _KpiCard(
                    title: 'Chiffre d\'affaires',
                    value: '24 500 €',
                    icon: Icons.euro,
                    color: Color(0xFF6C63FF),
                  ),
                  _KpiCard(
                    title: 'Devis en cours',
                    value: '8',
                    icon: Icons.description,
                    color: Color(0xFFFF6584),
                  ),
                  _KpiCard(
                    title: 'Clients actifs',
                    value: '13',
                    icon: Icons.people,
                    color: Color(0xFF43C6AC),
                  ),
                  _KpiCard(
                    title: 'Tâches en retard',
                    value: '3',
                    icon: Icons.warning_amber,
                    color: Color(0xFFFF9800),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // Activité récente
              const Text(
                'Activité récente',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A2E),
                ),
              ),
              const SizedBox(height: 12),
              const _ActivityItem(
                icon: Icons.receipt_long,
                color: Color(0xFF6C63FF),
                title: 'Facture #2024-031 envoyée',
                subtitle: 'Client : Mairie de Toulon · 3 200 €',
                time: 'Il y a 2h',
              ),
              const _ActivityItem(
                icon: Icons.person_add,
                color: Color(0xFF43C6AC),
                title: 'Nouveau client ajouté',
                subtitle: 'Sophie Bernard · Architecte',
                time: 'Hier',
              ),
              const _ActivityItem(
                icon: Icons.check_circle,
                color: Color(0xFF4CAF50),
                title: 'Tâche terminée',
                subtitle: 'Maquette site vitrine · Projet Dubois',
                time: 'Hier',
              ),
              const _ActivityItem(
                icon: Icons.description,
                color: Color(0xFFFF6584),
                title: 'Devis #2024-018 accepté',
                subtitle: 'Client : Restaurant Le Provençal · 1 800 €',
                time: 'Il y a 2 jours',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _KpiCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _KpiCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: color, size: 28),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActivityItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final String time;

  const _ActivityItem({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            time,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}