import 'package:flutter/material.dart';
import 'church_detail_page.dart';

class ChurchesListPage extends StatelessWidget {
  const ChurchesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iglesias de la Asociación'),
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            ChurchCard(
              name: 'IBRV 1689',
              logoPath: 'assets/images/ibrv_1689_logo.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChurchDetailPage(
                      churchName: 'IBRV 1689',
                      logoPath: 'assets/images/ibrv_1689_logo.png',
                    ),
                  ),
                );
              },
            ),
            // Aquí puedes agregar más iglesias
            ChurchCard(
              name: 'Iglesia 2',
              logoPath: null,
              onTap: () {
                // Navegar a detalles de otra iglesia
              },
            ),
            ChurchCard(
              name: 'Iglesia 3',
              logoPath: null,
              onTap: () {
                // Navegar a detalles de otra iglesia
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ChurchCard extends StatelessWidget {
  final String name;
  final String? logoPath;
  final VoidCallback onTap;

  const ChurchCard({
    super.key,
    required this.name,
    this.logoPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (logoPath != null)
                Expanded(
                  child: Image.asset(
                    logoPath!,
                    fit: BoxFit.contain,
                  ),
                )
              else
                Expanded(
                  child: Icon(
                    Icons.church,
                    size: 60,
                    color: Colors.blue[600],
                  ),
                ),
              const SizedBox(height: 12),
              Text(
                name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
