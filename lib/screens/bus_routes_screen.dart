import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BusRoutesScreen extends StatelessWidget {
  const BusRoutesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      appBar: AppBar(
        title: Text("Bus Routes", style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          _buildRouteHeader(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                _buildRouteCard("14A", "Gulberg to Liberty", "5 mins", Colors.green),
                _buildRouteCard("32B", "Mall Road to Airport", "12 mins", Colors.blue),
                _buildRouteCard("09", "Defence to Johar Town", "Delayed", Colors.red),
                _buildRouteCard("22", "Model Town to Cantt", "8 mins", Colors.orange),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRouteHeader() {
    return Container(
      padding: const EdgeInsets.all(24),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5)],
                    ),
                    child: const Center(child: Text("Bus", style: TextStyle(fontWeight: FontWeight.bold))),
                  ),
                ),
                const Expanded(child: Center(child: Text("Metro", style: TextStyle(color: Colors.grey)))),
                const Expanded(child: Center(child: Text("Train", style: TextStyle(color: Colors.grey)))),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Icon(Icons.my_location, color: Colors.blue, size: 20),
              const SizedBox(width: 10),
              Text("Your Location", style: GoogleFonts.outfit(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRouteCard(String no, String route, String eta, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                no,
                style: GoogleFonts.outfit(color: color, fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(route, style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 15)),
                Text("Every 15 mins • Next in $eta", style: GoogleFonts.outfit(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
        ],
      ),
    );
  }
}
