import 'package:flutter/material.dart';
import 'package:learnpythonapp/screens/reminders_screen.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  final List<String> _selectedGoals = [];
  final List<String> _goals = [
    'Start with the basics — no experience needed',
    'Build cool things like calculators, games, or automations',
    'Grow your skills to pursue a job in coding',
    'Prepare for job interviews or internships',
  ];

  void _toggleGoal(String goal) {
    setState(() {
      if (_selectedGoals.contains(goal)) {
        _selectedGoals.remove(goal);
      } else {
        _selectedGoals.add(goal);
      }
    });
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
              Center(
                child: const Text(
                  textAlign: TextAlign.center,
                  'Let\'s understand your goals\nwith Python — select all that\napply.',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4C4C4C),
                    height: 1.3,
                  ),
                ),
              ),
              SizedBox(height: mediaQuery.height * 0.04),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: _goals.length,
                  itemBuilder: (context, index) {
                    final goal = _goals[index];
                    return _buildGoalButton(goal);
                  },
                ),
              ),
              SizedBox(height: mediaQuery.height * 0.02),
              _buildContinueButton(),
              SizedBox(height: mediaQuery.height * 0.04),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGoalButton(String text) {
    final isSelected = _selectedGoals.contains(text);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: GestureDetector(
        onTap: () => _toggleGoal(text),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF496CFB),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    4,
                  ), // Subtle rounded corners for the checkbox
                ),
                child: isSelected
                    ? const Icon(
                        Icons.check_rounded,
                        color: Color(
                          0xFF496CFB,
                        ), // Blue color for the checkmark
                        size: 20,
                      )
                    : const SizedBox(),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContinueButton() {
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
          onTap: () {
             Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RemindersScreen(),
                      ),
                    );
          },
          borderRadius: BorderRadius.circular(30),
          child: const Center(
            child: Text(
              'CONTINUE',
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
