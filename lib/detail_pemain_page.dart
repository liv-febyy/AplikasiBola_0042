import 'package:flutter/material.dart';
import 'pemain.dart';

class DetailPemainPage extends StatefulWidget {
  final Pemain pemain;
  const DetailPemainPage({super.key, required this.pemain});

  @override
  State<DetailPemainPage> createState() => _DetailPemainPageState();
}

class _DetailPemainPageState extends State<DetailPemainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pemain'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama: ${widget.pemain.nama}',
              style: const TextStyle(fontSize: 19),
            ),
            Text(
              'Posisi: ${widget.pemain.posisi}',
              style: const TextStyle(fontSize: 19),
            ),
            Text(
              'Nomor Punggung: ${widget.pemain.nomorPunggung}',
              style: const TextStyle(fontSize: 19),
            ),
            Text(
              'Kewarga Negaraan: ${widget.pemain.kewargaNegaraan}',
              style: const TextStyle(fontSize: 19),
            ),
            Text(
              'Usia: ${widget.pemain.usia} tahun',
              style: const TextStyle(fontSize: 19),
            ),
            Text(
              'Tinggi Badan: ${(widget.pemain.tingiBadan / 180).toStringAsFixed(3)} meter',
              style: const TextStyle(fontSize: 19),
            ),
            Text(
              'Jenis Kelamin: ${widget.pemain.jenisKelamin}',
              style: const TextStyle(fontSize: 19),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Kembali'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: const Text('Simpan'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
