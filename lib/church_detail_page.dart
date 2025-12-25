import 'package:flutter/material.dart';

class ChurchDetailPage extends StatelessWidget {
  final String churchName;
  final String? logoPath;

  const ChurchDetailPage({
    super.key,
    required this.churchName,
    this.logoPath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(churchName),
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Título superior
            Text(
              'Iglesia Bautista Reformada del Vedado CF 1689',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            // Tarjeta unificada superior (logo e info de contacto)
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Sección del logo
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          if (logoPath != null)
                            Image.asset(
                              logoPath!,
                              height: 150,
                              fit: BoxFit.contain,
                            )
                          else
                            Icon(
                              Icons.church,
                              size: 100,
                              color: Colors.blue[600],
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Sección de información de contacto
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildContactItem(
                            Icons.location_on,
                            'Dirección de la iglesia',
                          ),
                          const SizedBox(height: 12),
                          _buildContactItem(
                            Icons.phone,
                            '+1 234 567 890',
                          ),
                          const SizedBox(height: 12),
                          _buildContactItem(
                            Icons.email,
                            'contacto@iglesia.com',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Tarjeta de horarios de servicios
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Horarios de Servicios',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[800],
                      ),
                    ),
                    const Divider(height: 24),
                    _buildIBRVServices(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: Colors.blue[600],
          size: 20,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIBRVServices() {
    return Column(
      children: [
        _buildServiceSection(
          title: 'Culto de Oración',
          time: '10:15 am',
          items: [
            ServiceItem(label: 'Lectura', content: 'Salmo 145:18,19'),
            ServiceItem(label: 'Himno de respuesta', content: 'Corro a Cristo'),
          ],
        ),
        const SizedBox(height: 24),
        _buildServiceSection(
          title: 'Culto de Adoración',
          time: '11:00 am',
          items: [
            ServiceItem(
              label: 'Llamado a la adoración',
              content: 'Hebreos 10:19-23',
            ),
            ServiceItem(
              label: 'Respuesta al llamado',
              content:
                  'Pastor: Dios que te ha llamado a la comunión con su Hijo, Jesucristo, nuestro Señor, es fiel.\n\n'
                  'Congregación: Él es un Señor fiel, que mantiene su pacto de amor por mil generaciones a aquellos que lo aman y guardan sus mandamientos.\n\n'
                  'Pastor: Su fidelidad alcanza los cielos y continúa a través de todas las generaciones hasta la eternidad.\n\n'
                  'Todos: Por lo tanto, alabamos la fidelidad de nuestro Señor Jesucristo en esta asamblea diciendo: ¡Grande es tu fidelidad! Exaltaremos y alabaremos tu nombre, porque en perfecta fidelidad has hecho maravillas. Grande es tu fidelidad para con nosotros, oh Señor nuestro Dios.',
            ),
            ServiceItem(
              label: 'Himno de respuesta',
              content: 'Grande es tu fidelidad',
            ),
            ServiceItem(label: '', content: 'Oración de invocación'),
            ServiceItem(
              label: 'Lectura de la Ley',
              content: 'Amos 5:21-24',
            ),
            ServiceItem(
              label: 'Himno de respuesta',
              content: 'Cristo hazme ver tu Cruz',
            ),
            ServiceItem(
              label: 'Lectura del evangelio',
              content: '2 Corintios 5:17-21',
            ),
            ServiceItem(label: 'Himno de respuesta', content: 'Solo en Jesús'),
            ServiceItem(
              label: 'Catecismo',
              content:
                  'Pregunta 30. ¿Cómo ejecuta Cristo el oficio de profeta?\n'
                  'R. Cristo ejecuta el oficio de un profeta, revelándonos, por medio de su Palabra y Espíritu, la voluntad de Dios para nuestra salvación.\n\n'
                  'Pregunta 31. ¿Cómo ejecuta Cristo el oficio de sacerdote?\n'
                  'R. Cristo ejecuta el oficio de sacerdote, en Su ofrenda de sí mismo, un sacrificio para satisfacer la justicia divina, y reconciliarnos con Dios, y en la continua intercesión por nosotros.\n\n'
                  'Pregunta 32. ¿Cómo ejecuta Cristo el oficio de rey?\n'
                  'R. Cristo ejecuta el oficio de un rey, sometiéndonos a sí mismo, gobernándonos y defendiéndonos; y conteniendo y conquistando a todos sus enemigos.',
            ),
            ServiceItem(
              label: 'Himno de respuesta',
              content: 'Mirad bendecid a Jehová',
            ),
            ServiceItem(
              label: '',
              content: 'Oración pastoral por la predicación de la palabra de Dios',
            ),
            ServiceItem(
              label: 'Predicación',
              content:
                  'Efesios 5:1-2\n"Amar como el amó: La llama del amor sacrificial"',
            ),
            ServiceItem(label: 'Cena del Señor', content: ''),
            ServiceItem(
              label: 'Himno de respuesta',
              content: 'Tu obra sola, oh Cristo',
            ),
            ServiceItem(label: 'Ofrenda', content: ''),
            ServiceItem(label: 'Doxología', content: 'Tu reino amo oh Dios'),
            ServiceItem(
              label: 'Bendición final',
              content: 'Filipenses 4:19-20',
            ),
          ],
        ),
        const SizedBox(height: 24),
        _buildServiceSection(
          title: 'Clase Dominical',
          time: '1:30 pm',
          items: [
            ServiceItem(label: 'Tema', content: '¿En qué nos diferenciamos?'),
          ],
        ),
      ],
    );
  }

  Widget _buildServiceSection({
    required String title,
    required String time,
    required List<ServiceItem> items,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.access_time, color: Colors.blue[800], size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Horario: $time',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.blue[700],
            ),
          ),
          const SizedBox(height: 12),
          ...items.map((item) => _buildServiceItem(item)),
        ],
      ),
    );
  }

  Widget _buildServiceItem(ServiceItem item) {
    if (item.label.isEmpty && item.content.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          item.content,
          style: TextStyle(
            fontSize: 14,
            fontStyle: FontStyle.italic,
            color: Colors.blue[900],
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (item.label.isNotEmpty)
            Text(
              item.label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
            ),
          if (item.label.isNotEmpty && item.content.isNotEmpty)
            const SizedBox(height: 4),
          if (item.content.isNotEmpty)
            Text(
              item.content,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black87,
                height: 1.4,
              ),
            ),
        ],
      ),
    );
  }
}

class ServiceItem {
  final String label;
  final String content;

  ServiceItem({required this.label, required this.content});
}
