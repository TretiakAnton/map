import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:map/logic/login_bloc/login_cubit.dart';
import 'package:map/logic/map_bloc/map_cubit.dart';
import 'package:map/screens/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyAZvvlvCdI9SnOwqg8qHN8u1GXxscmNsTk',
    appId: '1:485461131405:android:0fa536a70847bb031a62c4',
    messagingSenderId: '485461131405',
    projectId: 'mapflutter-ac326',
    storageBucket: 'mapflutter-ac326.appspot.com',
  ));
  Location location = Location();
  bool isEnabled = await location.serviceEnabled();
  if (!isEnabled) {
    await location.requestService();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
        BlocProvider<MapCubit>(
            create: (context) => MapCubit()..updateGpsLocation()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
