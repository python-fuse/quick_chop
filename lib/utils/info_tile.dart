import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoCard extends StatefulWidget {
  final IconData icon;
  final String title;

  const InfoCard({super.key, required this.icon, required this.title});

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(255, 61, 61, 61),
              blurRadius: 4,
              spreadRadius: 2),
        ],
      ),
      child: ListTile(
        leading: Icon(
          widget.icon,
          color: Colors.pinkAccent,
        ),
        title: Text(widget.title,
            style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
