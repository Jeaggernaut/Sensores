import 'package:flutter/material.dart';
import '../widgets/heart_rate_info_card.dart';
import '../widgets/health_tip_card.dart';

class HeartRateInfoPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tarjeta de rango saludable
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey.shade800
                      : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.red.shade600,
                          size: 28,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Ritmo Cardíaco Normal',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.grey.shade800,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      '60 - 100 bpm',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade600,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Este es el rango saludable en reposo para adultos.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white70
                            : Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),

              // Sección de información
              Text(
                'Información',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.grey.shade800,
                ),
              ),
              SizedBox(height: 15),

              // Card 1: Factores que afectan
              HeartRateInfoCard(
                icon: Icons.trending_up,
                title: '¿Qué afecta tu ritmo cardíaco?',
                description:
                    'El estrés, la actividad física, la cafeína, el sueño y la temperatura pueden aumentar o disminuir tu ritmo cardíaco.',
                color: Colors.orange,
              ),
              SizedBox(height: 15),

              // Card 2: Actividad física
              HeartRateInfoCard(
                icon: Icons.directions_run,
                title: 'Durante el ejercicio',
                description:
                    'Es normal que tu ritmo cardíaco aumente durante la actividad física. Puede alcanzar 150-200 bpm según la intensidad.',
                color: Colors.blue,
              ),
              SizedBox(height: 15),

              // Card 3: Sueño
              HeartRateInfoCard(
                icon: Icons.bedtime,
                title: 'Durante el sueño',
                description:
                    'Tu ritmo cardíaco puede ser más bajo mientras duermes, entre 40-60 bpm. Esto es completamente normal.',
                color: Colors.indigo,
              ),
              SizedBox(height: 25),

              // Sección de consejos
              Text(
                'Consejos para mantener un corazón saludable',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.grey.shade800,
                ),
              ),
              SizedBox(height: 15),

              HealthTipCard(title: 'Ejercicio regular', description: 'Realiza al menos 150 minutos de actividad moderada a la semana.'),
              SizedBox(height: 12),
              HealthTipCard(title: 'Alimentación sana', description: 'Consume frutas, verduras y alimentos bajos en sodio y grasas saturadas.'),
              SizedBox(height: 12),
              HealthTipCard(title: 'Manejo del estrés', description: 'Practica meditación, yoga o técnicas de respiración para reducir el estrés.'),
              SizedBox(height: 12),
              HealthTipCard(title: 'Duerme bien', description: 'Intenta dormir 7-9 horas cada noche para una buena recuperación.'),
              SizedBox(height: 12),
              HealthTipCard(title: 'Controla tu peso', description: 'Mantén un peso saludable según tu IMC para reducir el esfuerzo cardíaco.'),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
