import 'package:flutter/material.dart';
import 'package:wedding_invitation/src/views.dart';

class CoverScreen extends StatelessWidget {
  final String guest;

  const CoverScreen({
    Key? key,
    required this.guest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100.0),
        child: Center(
          child: SizedBox(
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 20),
                Image.asset(
                  "assets/img/img-logo-inisial.png",
                  fit: BoxFit.cover,
                  width: 275,
                ),
                Column(
                  children: [
                    InviteeName(guest: guest),
                    const SizedBox(height: 20),
                    ButtonBukaUndangan(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const HomeScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InviteeName extends StatelessWidget {
  const InviteeName({
    Key? key,
    required this.guest,
  }) : super(key: key);

  final String guest;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 100,
        maxWidth: 300,
        minHeight: 75,
      ),
      decoration: BoxDecoration(
        color: Colors.pinkAccent.withOpacity(0.15),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Dear:'),
            Text(
              guest,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonBukaUndangan extends StatelessWidget {
  const ButtonBukaUndangan({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 75,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.pinkAccent.withOpacity(0.15),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(UniconsLine.envelope_open, size: 32),
            Text("Buka Undangan"),
          ],
        ),
      ),
    );
  }
}
