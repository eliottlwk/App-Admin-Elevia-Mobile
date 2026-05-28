import 'package:flutter/material.dart';

class AddProjetScreen extends StatefulWidget {
  final Function(Map<String, dynamic>) onAjouter;

  const AddProjetScreen({super.key, required this.onAjouter});

  @override
  State<AddProjetScreen> createState() => _AddProjetScreenState();
}

class _AddProjetScreenState extends State<AddProjetScreen> {
  final _nomController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _montantController = TextEditingController();
  String _tag = 'Vitrine';
  String _statut = 'Devis';
  String _client = 'Lois';
  bool _isLoading = false;

  final List<String> _tags = ['Vitrine', 'App web', 'E-commerce', 'Autre'];
  final List<String> _statuts = ['Devis', 'En cours', 'Livré'];
  final List<String> _clients = [
    'Lois',
    'King Kong',
    'Eliott Lauwick',
    'Mairie de Toulon',
    'Restaurant Le Provençal',
  ];

  void _submit() async {
    if (_nomController.text.isEmpty || _montantController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez remplir les champs obligatoires'),
          backgroundColor: Color(0xFFE53935),
        ),
      );
      return;
    }
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      widget.onAjouter({
        'nom': _nomController.text,
        'client': _client,
        'tag': _tag,
        'montant': '${_montantController.text} €',
        'statut': _statut,
        'progress': 0.0,
        'taches': 0,
        'tachesFaites': 0,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Projet créé avec succès !'),
          backgroundColor: Color(0xFF4CAF50),
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Color(0xFF1A1A2E)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Nouveau projet',
          style: TextStyle(
            color: Color(0xFF1A1A2E),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          TextButton(
            onPressed: _isLoading ? null : _submit,
            child: const Text(
              'Créer',
              style: TextStyle(
                color: Color(0xFF6C63FF),
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Section(
              titre: 'Informations',
              child: Column(
                children: [
                  _Field(
                    controller: _nomController,
                    label: 'Nom du projet *',
                    icon: Icons.folder_outlined,
                  ),
                  const SizedBox(height: 12),
                  _Field(
                    controller: _descriptionController,
                    label: 'Description',
                    icon: Icons.notes,
                    maxLines: 3,
                  ),
                  const SizedBox(height: 12),
                  _Field(
                    controller: _montantController,
                    label: 'Budget (€) *',
                    icon: Icons.euro_outlined,
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            _Section(
              titre: 'Client',
              child: DropdownButtonFormField<String>(
                value: _client,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person_outline,
                      color: Color(0xFF6C63FF), size: 20),
                  filled: true,
                  fillColor: const Color(0xFFF5F7FA),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                items: _clients
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                onChanged: (v) => setState(() => _client = v!),
              ),
            ),
            const SizedBox(height: 16),

            _Section(
              titre: 'Type de projet',
              child: Wrap(
                spacing: 10,
                children: _tags.map((tag) {
                  final selected = _tag == tag;
                  return GestureDetector(
                    onTap: () => setState(() => _tag = tag),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: selected
                            ? const Color(0xFF6C63FF)
                            : const Color(0xFFF0EEFF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        tag,
                        style: TextStyle(
                          color: selected
                              ? Colors.white
                              : const Color(0xFF6C63FF),
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),

            _Section(
              titre: 'Statut',
              child: Row(
                children: _statuts.map((s) {
                  final selected = _statut == s;
                  return GestureDetector(
                    onTap: () => setState(() => _statut = s),
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: selected
                            ? const Color(0xFF6C63FF)
                            : const Color(0xFFF0EEFF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        s,
                        style: TextStyle(
                          color: selected
                              ? Colors.white
                              : const Color(0xFF6C63FF),
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6C63FF),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: _isLoading
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : const Text(
                        'Créer le projet',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String titre;
  final Widget child;

  const _Section({required this.titre, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titre,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A2E),
            ),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class _Field extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final TextInputType keyboardType;
  final int maxLines;

  const _Field({
    required this.controller,
    required this.label,
    required this.icon,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: const Color(0xFF6C63FF), size: 20),
        filled: true,
        fillColor: const Color(0xFFF5F7FA),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      ),
    );
  }
}