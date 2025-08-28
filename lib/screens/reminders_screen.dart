import 'package:flutter/material.dart';
import 'package:learnpythonapp/auth/signup_signin_screen.dart';
import 'package:learnpythonapp/screens/goals_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemindersScreen extends StatefulWidget {
  const RemindersScreen({super.key});

  @override
  State<RemindersScreen> createState() => _RemindersScreenState();
}

class _RemindersScreenState extends State<RemindersScreen> {
  // Initial reminder time
  TimeOfDay _selectedTime = const TimeOfDay(hour: 10, minute: 0);

  // Function to show the time picker
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: mediaQuery.height * 0.04),
              const Text(
                'One last thing',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4C4C4C),
                  height: 1.3,
                ),
              ),
              SizedBox(height: mediaQuery.height * 0.02),
              const Text(
                '93% of our users appreciate the\ntimely reminders sent to them to\nkeep their learning progress on\ntrack.',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF828282),
                  height: 1.4,
                ),
              ),
              const Spacer(),
              // Custom bell image widget
              Center(
                child: Transform.rotate(
                  angle: 0.4,
                  child: Image.asset(
                    'assets/bell.gif',
                    height: mediaQuery.height * 0.45,
                  ),
                ),
              ),
              const Spacer(),
              Center(
                child: Column(
                  children: [
                    const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.access_time, color: Color(0xFF4C4C4C)),
                        SizedBox(width: 8),
                        Text(
                          'Reminder Time',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF4C4C4C),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () => _selectTime(context),
                      child: Text(
                        _selectedTime.format(context),
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF496CFB),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              _buildDoneButton(),
              SizedBox(height: mediaQuery.height * 0.04),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildDoneButton() {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          colors: [Color(0xFF5B69F8), Color(0xFF4C4EFB)],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.4),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setBool(
              'first_launch',
              false,
            ); // ✅ Mark onboarding complete

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const GoalsScreen()),
            );

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUpSignInScreen()),
            );
            print("Done! Selected Time: ${_selectedTime.format(context)}");
          },
          borderRadius: BorderRadius.circular(30),
          child: const Center(
            child: Text(
              'DONE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
