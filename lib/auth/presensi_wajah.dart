import 'package:flutter/material.dart';
import 'ringkasan_presensi.dart';
import 'tema.dart';

class PresensiWajah extends StatelessWidget {
  const PresensiWajah({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBiru('Presensi Wajah'),
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.face, size: 120, color: Colors.white54),
                  SizedBox(height: 12),
                  Text('Arahkan wajah ke kamera',
                      style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: InkWell(
              onTap: () => Navigator.push(
                context, 
                MaterialPageRoute(builder : (_) => const RingkasanPresensi())),
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: const BoxDecoration(
                  color: biru,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.camera_alt,
                    color: Colors.white, size: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
