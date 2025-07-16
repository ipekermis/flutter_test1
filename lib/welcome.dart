import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'deneme.dart';
import 'home.dart';
class Welcome extends StatelessWidget {
  const Welcome({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/aspen.png', fit: BoxFit.cover),
          Positioned(
            top: 100,
            left: 75,
            child: Image.asset('assets/images/Aspentext.png', fit: BoxFit.cover),
          ),

          Positioned(
            width: 300,
            height: 140,
            bottom: 150,
            left: 32,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [

                Text(
                  'Plan your',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),

                Text(
                  'Luxurious Vacation',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 60,
            left: 20,
            right: 20,
            child: SizedBox(
              width: 300,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 44,
                    vertical: 13,
                  ),
                ),
                child: const Text(
                  'Explore',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

