import 'package:flutter/material.dart';
import 'izin.dart';
import 'jadwal.dart';
import 'presensi_wajah.dart';
import 'tema.dart';
import 'data.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: biruMuda,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(),
              const SizedBox(height: 14),
              _infoWaktu(),
              const SizedBox(height: 18),
              const Text('Presensi',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              _kartuPresensi(context),
              const SizedBox(height: 18),
              _judulJadwal(context),
              const SizedBox(height: 8),
              _daftarJadwal(),
              const SizedBox(height: 18),
              const Text('Perizinan',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              _kartuIzin(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() => Row(
        children:  [
          CircleAvatar(
            radius: 26,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 32, color: Colors.grey),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hai,', style: TextStyle(fontSize: 13)),
              Text(siswaAktif?.nama ?? 'Nama',
                  style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text('${siswaAktif?.nis ?? 'NIS'}  |  ${siswaAktif?.kelas ?? 'Kelas'}', style: TextStyle(fontSize: 12)),
            ],
          ),
        ],
      );

  Widget _infoWaktu() => Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: kartu(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _itemWaktu(Icons.calendar_month, '13/10', 'Tanggal'),
            _itemWaktu(Icons.access_time, '06.00', 'Masuk'),
            _itemWaktu(Icons.access_time, '14.30', 'Pulang'),
          ],
        ),
      );

  Widget _itemWaktu(IconData ikon, String nilai, String label) => Row(
        children: [
          Icon(ikon, color: biru, size: 30),
          const SizedBox(width: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(nilai, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(label, style: const TextStyle(fontSize: 10)),
            ],
          ),
        ],
      );

  Widget _kartuPresensi(BuildContext context) => Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF8FC1F5),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            ValueListenableBuilder<String>(
              valueListenable: statusMasuk,
              builder: (context, value, _) => _barisPresensi(
                  context, 'Presensi Masuk', value),
            ),
            const SizedBox(height: 10),
            ValueListenableBuilder<String>(
              valueListenable: statusPulang,
              builder: (context, value, _) => _barisPresensi(
                  context, 'Presensi Pulang', value),
            ),
          ],
        ),
      );

  Widget _barisPresensi(BuildContext context, String judul, String status) =>
      InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const PresensiWajah()),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 18,
                backgroundColor: Color(0xFFE0E0E0),
                child: Icon(Icons.person, color: Colors.grey),
              ),
              Expanded(
                child: Text(judul,
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.bold)),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  border: Border.all(color: biru),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(status,
                    style: const TextStyle(fontSize: 10, color: biru)),
              ),
            ],
          ),
        ),
      );

  Widget _judulJadwal(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Jadwal Pelajaran',
              style: TextStyle(fontWeight: FontWeight.bold)),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Jadwal()),
            ),
            child: const Text('semua',
                style: TextStyle(color: biru, fontSize: 12)),
          ),
        ],
      );

  Widget _daftarJadwal() => SizedBox(
        height: 100,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          separatorBuilder: (_, __) => const SizedBox(width: 10),
          itemBuilder: (context, i) {
            final j = dataJadwal[i];
            return Container(
              width: 170,
              padding: const EdgeInsets.all(12),
              decoration: kartu(),
              child: kontenJadwal(j),
            );
          },
        ),
      );

  Widget _kartuIzin(BuildContext context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: kartu(),
        child: InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const Izin()),
          ),
          child: const Column(
            children: [
              Icon(Icons.note_add_outlined, color: biru, size: 34),
              SizedBox(height: 6),
              Text('Ajukan Izin',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Ajukan Izin Jika Kamu Berhalangan Hadir',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 11)),
            ],
          ),
        ),
      );
}