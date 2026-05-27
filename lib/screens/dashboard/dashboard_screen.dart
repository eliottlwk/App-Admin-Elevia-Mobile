import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Dashboard',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1A2E),
                        ),
                      ),
                      Text(
                        'Elevia Agency',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    backgroundColor: Color(0xFF6C63FF),
                    child: Text('EL', style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // KPI Cards
              Row(
                children: const [
                  Expanded(
                    child: _KpiCard(
                      title: 'CA encaissé',
                      value: '10 600 €',
                      subtitle: 'Factures payées',
                      color: Color(0xFF6C63FF),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _KpiCard(
                      title: 'En attente',
                      value: '350 €',
                      subtitle: 'Factures envoyées',
                      color: Color(0xFFFF9800),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: const [
                  Expanded(
                    child: _KpiCard(
                      title: 'Devis',
                      value: '1 270 €',
                      subtitle: '2 envoyés',
                      color: Color(0xFF6C63FF),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _KpiCard(
                      title: 'Projets actifs',
                      value: '4',
                      subtitle: '5 au total',
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Projets récents
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Projets récents',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                  Text(
                    'Voir tout →',
                    style: TextStyle(color: Color(0xFF6C63FF), fontSize: 13),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const _ProjetItem(
                nom: 'Site Lois',
                client: 'Lois',
                tag: 'Vitrine',
                montant: '1 000 €',
                statut: 'En cours',
                statutColor: Color(0xFF6C63FF),
                progress: 0.3,
              ),
              const _ProjetItem(
                nom: 'site du bg',
                client: 'Lois',
                tag: 'Autre',
                montant: '10 000 €',
                statut: 'En cours',
                statutColor: Color(0xFF6C63FF),
                progress: 0.6,
              ),
              const _ProjetItem(
                nom: 'Test des tâches',
                client: 'King Kong',
                tag: 'Vitrine',
                montant: '800 €',
                statut: 'Devis',
                statutColor: Color(0xFFFF9800),
                progress: 0.1,
              ),
              const _ProjetItem(
                nom: 'Création d\'un site vitrine',
                client: 'Eliott Lauwick',
                tag: 'App web',
                montant: '600 €',
                statut: 'En cours',
                statutColor: Color(0xFF6C63FF),
                progress: 0.5,
              ),
              const SizedBox(height: 24),

              // Facturation récente
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Facturation récente',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                  Text(
                    'Voir →',
                    style: TextStyle(color: Color(0xFF6C63FF), fontSize: 13),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const _FactureItem(
                client: 'Lois',
                ref: 'FAC-202605-003',
                montant: '10 000 €',
                statut: 'Payé',
                statutColor: Color(0xFF4CAF50),
              ),
              const _FactureItem(
                client: 'Lois',
                ref: 'DEV-202605-005',
                montant: '10 000 €',
                statut: 'Accepté',
                statutColor: Color(0xFF6C63FF),
              ),
              const _FactureItem(
                client: 'Test',
                ref: 'FAC-202605-002',
                montant: '350 €',
                statut: 'Envoyé',
                statutColor: Color(0xFFFF9800),
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
  final String subtitle;
  final Color color;

  const _KpiCard({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 4),
          Text(value,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: color)),
          Text(subtitle,
              style: const TextStyle(color: Colors.grey, fontSize: 11)),
        ],
      ),
    );
  }
}

class _ProjetItem extends StatelessWidget {
  final String nom;
  final String client;
  final String tag;
  final String montant;
  final String statut;
  final Color statutColor;
  final double progress;

  const _ProjetItem({
    required this.nom,
    required this.client,
    required this.tag,
    required this.montant,
    required this.statut,
    required this.statutColor,
    required this.progress,
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
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(nom,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 14)),
                  const SizedBox(width: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0EEFF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(tag,
                        style: const TextStyle(
                            fontSize: 10, color: Color(0xFF6C63FF))),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(montant,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 13)),
                  Text(statut,
                      style: TextStyle(color: statutColor, fontSize: 12)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(client,
              style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: const Color(0xFFEEEEEE),
            color: const Color(0xFF6C63FF),
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      ),
    );
  }
}

class _FactureItem extends StatelessWidget {
  final String client;
  final String ref;
  final String montant;
  final String statut;
  final Color statutColor;

  const _FactureItem({
    required this.client,
    required this.ref,
    required this.montant,
    required this.statut,
    required this.statutColor,
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
              Text(client,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 14)),
              Text(ref,
                  style:
                      const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(montant,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 14)),
              Text(statut,
                  style: TextStyle(color: statutColor, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}