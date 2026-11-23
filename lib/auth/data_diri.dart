import 'package:flutter/material.dart';
import 'tema.dart';

class DataDiri extends StatelessWidget {
  const DataDiri({super.key});

  // Data contoh (nanti diganti data dari server)
  static const Map<String, String> data = {
    'Nama Lengkap': '-',
    'NIS': '-',
    'Kelas': '-',
    'Jurusan': '-',
    'Tempat, Tanggal Lahir': '-',
    'Jenis Kelamin': '-',
    'Alamat': '-',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarBiru('Data Diri'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: data.entries
            .map((e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(e.key, style: const TextStyle(fontSize: 12)),
                      Text(e.value, style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}
