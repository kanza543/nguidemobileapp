import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForumScreen extends StatelessWidget {
  const ForumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      appBar: AppBar(
        title: Text("Community Forum", style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          _buildPostInput(),
          const SizedBox(height: 30),
          _buildPostItem(
            user: "Sarah Khan",
            time: "2h ago",
            title: "Pothole on Main Boulevard",
            content: "There's a huge pothole near the Shell petrol pump. Driving is getting dangerous here.",
            status: "Pending",
            statusColor: Colors.red,
            upvotes: 24,
          ),
          _buildPostItem(
            user: "Ahmed Ali",
            time: "5h ago",
            title: "Street Lights Not Working",
            content: "Sector G street lights have been off for 3 days. We need this resolved for security.",
            status: "Resolved",
            statusColor: Colors.green,
            upvotes: 56,
          ),
          _buildPostItem(
            user: "Mike Ross",
            time: "1d ago",
            title: "Bus 14A Route Change?",
            content: "Does anyone know if the 14A route has changed? It didn't stop at the usual station today.",
            status: "In Progress",
            statusColor: Colors.blue,
            upvotes: 12,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text("New Report"),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }

  Widget _buildPostInput() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              "What's happening in your area?",
              style: GoogleFonts.outfit(color: Colors.grey),
            ),
          ),
          const Icon(Icons.image_outlined, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildPostItem({
    required String user,
    required String time,
    required String title,
    required String content,
    required String status,
    required Color statusColor,
    required int upvotes,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.blue.withOpacity(0.1),
                child: Text(user[0], style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user, style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 14)),
                  Text(time, style: GoogleFonts.outfit(color: Colors.grey, fontSize: 11)),
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  status,
                  style: GoogleFonts.outfit(color: statusColor, fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(title, style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 5),
          Text(
            content,
            style: GoogleFonts.outfit(color: Colors.grey[700], fontSize: 13, height: 1.5),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Icon(Icons.thumb_up_alt_outlined, size: 16, color: Colors.grey[600]),
              const SizedBox(width: 5),
              Text("$upvotes", style: const TextStyle(fontSize: 12)),
              const SizedBox(width: 20),
              Icon(Icons.comment_outlined, size: 16, color: Colors.grey[600]),
              const SizedBox(width: 5),
              const Text("12 Comments", style: TextStyle(fontSize: 12)),
              const Spacer(),
              const Icon(Icons.share_outlined, size: 16, color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }
}
