import 'package:flutter/material.dart';
import 'tema.dart';

// Data contoh (nanti diganti data dari server)
const List<Map<String, String>> dataJadwal = [
  {'mapel': 'SEJARAH', 'jam': '07.30–08.44', 'guru': 'Nama Guru'},
  {'mapel': 'MATEMATIKA', 'jam': '08.45–10.00', 'guru': 'Nama Guru'},
  {'mapel': 'PJOK', 'jam': '10.01–11.30', 'guru': 'Nama Guru'},
  {'mapel': 'B. JEPANG', 'jam': '12.30–13.00', 'guru': 'Nama Guru'},
  {'mapel': 'B. INGGRIS', 'jam': '13.01–14.38', 'guru': 'Nama Guru'},
];
Widget kontenJadwal(Map<String, String> j) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(j['mapel']!, style: const TextStyle(fontWeight: FontWeight.bold)),
        Row(children: [
          const Icon(Icons.access_time, size: 16, color: biru),
          const SizedBox(width: 6),
          Text(j['jam']!, style: const TextStyle(fontSize: 12)),
        ]),
        Row(children: [
          const Icon(Icons.person_outline, size: 16, color: biru),
          const SizedBox(width: 6),
          Text(j['guru']!, style: const TextStyle(fontSize: 12)),
        ]),
      ],
    );

class Jadwal extends StatelessWidget {
  const Jadwal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: biruMuda,
      appBar: appBarBiru('Jadwal Pelajaran'),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: dataJadwal.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, i) => Container(
          height: 90,
          padding: const EdgeInsets.all(12),
          decoration: kartu(),
          child: kontenJadwal(dataJadwal[i]),
        ),
      ),
    );
  }
}
