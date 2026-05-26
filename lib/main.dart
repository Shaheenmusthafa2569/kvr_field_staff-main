import 'package:flutter/material.dart';
import 'package:kvr_field_staff/views/auth/splash_screen.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:kvr_field_staff/views/auth/login_screen.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// import 'core/constants/supabase_constants.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Supabase.initialize(
//     url: SupabaseConfig.supabaseUrl,
//     anonKey: SupabaseConfig.supabaseAnonKey,
//   );

//   runApp(
//     const ProviderScope(
//       child: Myloginpage(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'KVR Field Staff',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('KVR Motors'),
//         ),
//         body: const Center(
//           child: Text('Supabase Connected'),
//         ),
//       ),
//     );
//   }
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MySplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
