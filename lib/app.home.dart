import 'package:flutter/material.dart';

class AppHome extends StatefulWidget {
  AppHome({Key? key}) : super(key: key);

  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();
  double resultado = 0;

  @override
  Widget build(BuildContext context) {
    // Paleta de colores personalizable (Negro y Rojo)
    const Color fondoNegro = Color(0xFF0D0D0D);
    const Color tarjetaOscura = Color(0xFF1A1A1A);
    const Color rojoVibrante = Color(0xFFE50914);
    const Color rojoOscuro = Color(0xFF8E0000);

    return Scaffold(
      backgroundColor: fondoNegro,
      appBar: AppBar(
        title: const Text(
          'OPERACIONES',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: tarjetaOscura,
        elevation: 4,
        shadowColor: rojoVibrante.withOpacity(0.4),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0),
          child: Container(
            color: rojoVibrante,
            height: 2.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Encabezado de sección
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: tarjetaOscura,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: rojoOscuro, width: 1.5),
                ),
                child: const Text(
                  "SUMA",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: rojoVibrante,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 3.0,
                  ),
                ),
              ),
              const SizedBox(height: 25),

              // Campo Primer Número
              const Text(
                "Ingrese primer número",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: num1,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.white, fontSize: 18),
                cursorColor: rojoVibrante,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: tarjetaOscura,
                  prefixIcon: const Icon(Icons.looks_one, color: rojoVibrante),
                  hintText: "0.0",
                  hintStyle: const TextStyle(color: Colors.white24),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.white12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: rojoVibrante, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Campo Segundo Número
              const Text(
                "Ingrese segundo número",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: num2,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.white, fontSize: 18),
                cursorColor: rojoVibrante,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: tarjetaOscura,
                  prefixIcon: const Icon(Icons.looks_two, color: rojoVibrante),
                  hintText: "0.0",
                  hintStyle: const TextStyle(color: Colors.white24),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.white12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: rojoVibrante, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Botones de Operaciones (Responsivos con Wrap para evitar desbordamiento)
              Center(
                child: Wrap(
                  spacing: 12.0,
                  runSpacing: 12.0,
                  alignment: WrapAlignment.center,
                  children: [
                    _buildActionButton("Sumar", Icons.add, rojoVibrante),
                    _buildActionButton("Restar", Icons.remove, rojoVibrante),
                    _buildActionButton("Multiplicar", Icons.close, rojoVibrante),
                    _buildActionButton("Dividir", Icons.percent, rojoVibrante),
                  ],
                ),
              ),
              const SizedBox(height: 35),

              // Tarjeta de Resultado
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [tarjetaOscura, Color(0xFF260507)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: rojoVibrante, width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: rojoVibrante.withOpacity(0.2),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      "RESULTADO",
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "$resultado",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget auxiliar únicamente de diseño para mantener estilizados los botones
  Widget _buildActionButton(String texto, IconData icono, Color colorRojo) {
    return ElevatedButton.icon(
      onPressed: sumar, // Se mantiene exactamente la misma función asignada
      icon: Icon(icono, size: 18, color: Colors.white),
      label: Text(
        texto,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.8,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: colorRojo,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        elevation: 6,
        shadowColor: colorRojo.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  // Lógica original intacta
  void sumar() {
    double n1 = double.tryParse(num1.text) ?? 0;
    double n2 = double.tryParse(num2.text) ?? 0;
    setState(() {
      resultado = n1 + n2;
    });
  }
}