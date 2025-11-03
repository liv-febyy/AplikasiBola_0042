import 'package:flutter/material.dart';
import 'package:project_aplikasi_bola/tambah_pemain_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Persib App')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/logo persib.jpg', height: 100),
            const SizedBox(height: 20),
            const Text(
              'Selamat Datang di Persib Bandung App',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TambahPemainPage(),
                  ),
                );
              },
              child: const Text('Tambah Pemain Baru'),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'tambah_pemain_page.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Persib App')),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Image.network(
//               'https://upload.wikimedia.org/wikipedia/en/4/4f/Persib_logo.svg',
//               height: 100,
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               'Selamat Datang di Persib Bandung App',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 40),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const TambahPemainPage(),
//                   ),
//                 );
//               },
//               child: const Text('Tambah Pemain Baru'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
