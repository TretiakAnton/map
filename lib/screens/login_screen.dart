import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:map/logic/login_bloc/login_cubit.dart';
import 'package:map/screens/map_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginCubit>();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: double.infinity,
            height: 200,
            child: CachedNetworkImage(
              imageUrl:
                  'https://cdn.icon-icons.com/icons2/2631/PNG/512/google_maps_new_logo_icon_159147.png',
              placeholder: (context, url) => const CircularProgressIndicator(),
            ),
          ),
          OutlinedButton.icon(
              onPressed: () async {
                final bool isSuccess = await bloc.googleLogin();
                if (isSuccess) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MapScreen()));
                }
              },
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(100, 50),
              ),
              icon: const FaIcon(
                FontAwesomeIcons.google,
                color: Colors.red,
              ),
              label: const Text('Sign Up with Google'))
        ],
      ),
    );
  }
}
