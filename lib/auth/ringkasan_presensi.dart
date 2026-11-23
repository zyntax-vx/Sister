import 'package:flutter/material.dart';
import 'tema.dart';

class RingkasanPresensi extends StatelessWidget {
  const RingkasanPresensi({super.key});


  String _jam() {
    final n = DateTime.now();
    final h = n.hour.toString().padLeft(2, '0');
    final m = n.minute.toString().padLeft(2, '0');
    return '$h.$m WIB';
  }

  Widget _info(IconData ikon, String judul, String isi, [String? sub]) =>
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: biruMuda,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(ikon, color: Colors.grey),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(isi, style: const TextStyle(fontSize: 12)),
                if (sub != null)
                  Text(sub,
                      style:
                          const TextStyle(fontSize: 10, color: Colors.grey)),
              ],
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBiru('Ringkasan Presensi'),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: const SizedBox(
              width: double.infinity,
              child: ColoredBox(
                color: Colors.black87,
                child: Icon(Icons.face, size: 120, color: Colors.white54),
                  
            ),
          ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Lokasi Presensi',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                // TODO: ganti dengan lokasi GPS asli (package geolocator)
                _info(Icons.location_on, 'Lokasi Presensi',
                    'SMK Negeri 1 Bukateja', 'Lokasi Terdeteksi'),
                const SizedBox(height: 12),
                const Text('Waktu Presensi',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                _info(Icons.access_time, 'Waktu Presensi', _jam()),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: biru,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22)),
                    ),
                    onPressed: () {
                      if (statusMasuk.value == 'Belum Presensi') {
                        statusMasuk.value = 'Tepat Waktu';
                      } else {
                        statusPulang.value = 'Tepat Waktu';
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Presensi terkirim')),
                      );
                      Navigator.popUntil(context, (r) => r.isFirst);
                    },
                    child: const Text('Kirim Presensi'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
