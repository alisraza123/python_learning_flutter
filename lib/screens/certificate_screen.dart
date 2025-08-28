import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:learnpythonapp/auth/username.dart';
import 'package:learnpythonapp/data/python_topics.dart';
import 'package:file_saver/file_saver.dart';
import 'package:toastification/toastification.dart';

class CertificateScreen extends StatefulWidget {
  final bool isCourseCompleted;
  const CertificateScreen({super.key, required this.isCourseCompleted});

  @override
  State<CertificateScreen> createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {
  bool certificateGenerated = false;
  GlobalKey certificateKey = GlobalKey();
  String userName = "";
  Map<String, dynamic> quizScores = {};
  int totalMCQs = 0;
  int correctMCQs = 0;
  double percentage = 0.0;
  bool isLoading = true;

  Future<Uint8List?> _captureCertificate() async {
    try {
      RenderRepaintBoundary boundary =
          certificateKey.currentContext!.findRenderObject()
              as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      return byteData?.buffer.asUint8List();
    } catch (e) {
      print("Error capturing certificate: $e");
      return null;
    }
  }

  Future<void> saveCertificate(Uint8List? imageBytes) async {
    if (imageBytes == null) {
      toastification.show(
        title: Text("No image data to save"),
        autoCloseDuration: const Duration(seconds: 2),
        type: ToastificationType.info,
        style: ToastificationStyle.minimal,
        alignment: Alignment.topCenter,
        direction: TextDirection.ltr,
        showProgressBar: true,
        progressBarTheme: ProgressIndicatorThemeData(color: Colors.red),
        closeOnClick: true,
        pauseOnHover: true,
        dragToClose: true,
      );
      return;
    }

    try {
      String fileName =
          "Python_Certificate_${DateTime.now().millisecondsSinceEpoch}";

      String? savedPath = await FileSaver.instance.saveAs(
        name: fileName,
        bytes: imageBytes,
        fileExtension: "png",
        mimeType: MimeType.png,
        includeExtension: true,
      );

      if (savedPath == null || savedPath.isEmpty) {
        toastification.show(
          title: Text("Failed to save the certificate"),
          autoCloseDuration: const Duration(seconds: 2),
          type: ToastificationType.error,
          style: ToastificationStyle.minimal,
          alignment: Alignment.topCenter,
          direction: TextDirection.ltr,
          showProgressBar: true,
          progressBarTheme: ProgressIndicatorThemeData(color: Colors.red),
          closeOnClick: true,
          pauseOnHover: true,
          dragToClose: true,
        );
        return;
      }
       toastification.show(
          title: Text("Saved at: $savedPath"),
          autoCloseDuration: const Duration(seconds: 2),
          type: ToastificationType.success,
          style: ToastificationStyle.minimal,
          alignment: Alignment.topCenter,
          direction: TextDirection.ltr,
          showProgressBar: true,
          progressBarTheme: ProgressIndicatorThemeData(color: Colors.red),
          closeOnClick: true,
          pauseOnHover: true,
          dragToClose: true,
        );
      print("File saved at: $savedPath");
    } catch (e) {
      toastification.show(
          title: Text("Error saving certificate: $e"),
          autoCloseDuration: const Duration(seconds: 2),
          type: ToastificationType.error,
          style: ToastificationStyle.minimal,
          alignment: Alignment.topCenter,
          direction: TextDirection.ltr,
          showProgressBar: true,
          progressBarTheme: ProgressIndicatorThemeData(color: Colors.red),
          closeOnClick: true,
          pauseOnHover: true,
          dragToClose: true,
        );
      print("Error saving certificate: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    getuserName();
    fetchQuizScoresAndCalculatePercentage();
  }

  void getuserName() async {
    String fetchedName = await getUserName();
    setState(() {
      userName = fetchedName;
    });
  }

  Future<void> fetchQuizScoresAndCalculatePercentage() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .get();

      if (!userDoc.exists) return;

      Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
      Map<String, dynamic> progress = userData['progress'] ?? {};
      Map<String, dynamic> quizScores = Map<String, dynamic>.from(
        progress['quizScores'] ?? {},
      );

      int totalMCQs = 0;
      int correctMCQs = 0;

      // Loop through pythonTopics to calculate total MCQs
      for (var topic in pythonTopics) {
        String topicId = topic.id;
        List<dynamic> quizQuestions = topic.quizQuestions ;

        totalMCQs += quizQuestions.length;

        if (quizScores.containsKey(topicId)) {
          correctMCQs += (quizScores[topicId] as int? ?? 0);
        }
      }

      double percentage = totalMCQs == 0
          ? 0.0
          : (correctMCQs / totalMCQs) * 100;

      setState(() {
        this.quizScores = quizScores;
        this.totalMCQs = totalMCQs;
        this.correctMCQs = correctMCQs;
        this.percentage = double.parse(percentage.toStringAsFixed(2));
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching quiz scores: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Certificate",
          style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
        ),
      ),
      body: widget.isCourseCompleted
          ? isLoading
                ? CircularProgressIndicator()
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RepaintBoundary(
                          key: certificateKey,
                          child: Container(
                            width:double.infinity,
                            padding: const EdgeInsets.all(30),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.15),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                              
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Opacity(
                                    opacity: 0.03,
                                    child: CustomPaint(
                                      painter: _CertificatePatternPainter(),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: -10,
                                  left: -10,
                                  child: Transform.rotate(
                                    angle: -0.3,
                                    child: _Ribbon(
                                      color: const Color(0xFFea67e7),
                                      size: 80,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: -10,
                                  right: -10,
                                  child: Transform.rotate(
                                    angle: 0.3,
                                    child: _Ribbon(
                                      color: const Color(0xFF7f4bde),
                                      size: 80,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: -10,
                                  left: -10,
                                  child: Transform.rotate(
                                    angle: -2.5,
                                    child: _Ribbon(
                                      color: const Color(0xFF7f4bde),
                                      size: 80,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: -10,
                                  right: -10,
                                  child: Transform.rotate(
                                    angle: 2.5,
                                    child: _Ribbon(
                                      color: const Color(0xFFea67e7),
                                      size: 80,
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        const Icon(
                                          Icons.circle_outlined,
                                          size: 80,
                                          color: Color(0xFF7f4bde),
                                        ),
                                        const Icon(
                                          Icons.workspace_premium,
                                          size: 50,
                                          color: Color(0xFF7f4bde),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      "CERTIFICATE OF COMPLETION",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF7f4bde),
                                        letterSpacing: 1.5,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 25),
                                    Container(
                                      height: 2,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xFFea67e7),
                                            Color(0xFF7f4bde),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          2,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 25),
                                    Text(
                                      "This certifies that",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[700],
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Text(
                                      userName.toUpperCase(),
                                      style: const TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF333333),
                                        letterSpacing: 1.2,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 15),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: Text(
                                        "has successfully completed the Python Programming Course with dedication and excellence.",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[700],
                                          height: 1.5,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(
                                          0xFF7f4bde,
                                        ).withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                        border: Border.all(
                                          color: const Color(
                                            0xFF7f4bde,
                                          ).withOpacity(0.3),
                                          width: 1,
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            "PERFORMANCE SUMMARY",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: const Color(
                                                0xFF7f4bde,
                                              ),
                                              letterSpacing: 1.0,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            "$percentage %",
                                            style: TextStyle(
                                              fontSize: 24,
                                              color: const Color(
                                                0xFF7f4bde,
                                              ),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            "Score: $correctMCQs/$totalMCQs",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey[700],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Image.asset(
                                                "assets/sign.png",
                                                width:
                                                    MediaQuery.of(
                                                      context,
                                                    ).size.width *
                                                    0.1,
                                              ),
                                              Container(
                                                width: 100,
                                                height: 2,
                                                color: const Color(
                                                  0xFF7f4bde,
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                "Director",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey[600],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Image.asset(
                                                "assets/sign.png",
                                                width:
                                                    MediaQuery.of(
                                                      context,
                                                    ).size.width *
                                                    0.1,
                                              ),
                                              Container(
                                                width: 100,
                                                height: 2,
                                                color: const Color(
                                                  0xFF7f4bde,
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                "Python Academy",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight:
                                                      FontWeight.bold,
                                                  color: Colors.grey[800],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      "Issued on ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[600],
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        if (!certificateGenerated)
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF7f4bde),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 25,
                                vertical: 15,
                              ),
                              elevation: 5,
                            ),
                            onPressed: () async {
                              Uint8List? pngBytes =
                                  await _captureCertificate();
                              await saveCertificate(pngBytes);
                            },
                            child: const Text(
                              "Save Certificate",
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        else
                          Column(
                            children: [
                              const Text(
                                "Certificate has been saved successfully!",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Icon(
                                Icons.verified,
                                color: Colors.green[700],
                                size: 40,
                              ),
                            ],
                          ),
                      ],
                    ),
                  )
          : Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 15,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                  border: Border.all(
                    color: Colors.purple.withOpacity(0.2),
                    width: 1.5,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 18,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lock_open_rounded,
                      color: Colors.purple,
                      size: 28,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "Complete the course to unlock your certificate 🎓",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w500,
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

// Add the missing classes at the end of the file
class _Ribbon extends StatelessWidget {
  final Color color;
  final double size;

  const _Ribbon({required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _RibbonPainter(color: color),
    );
  }
}

class _RibbonPainter extends CustomPainter {
  final Color color;

  _RibbonPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path();

    // Draw ribbon shape
    path.moveTo(size.width * 0.5, 0);
    path.lineTo(size.width * 0.2, size.height * 0.3);
    path.lineTo(0, size.height * 0.5);
    path.lineTo(size.width * 0.3, size.height * 0.7);
    path.lineTo(size.width * 0.5, size.height);
    path.lineTo(size.width * 0.7, size.height * 0.7);
    path.lineTo(size.width, size.height * 0.5);
    path.lineTo(size.width * 0.8, size.height * 0.3);
    path.close();

    canvas.drawPath(path, paint);

    // Draw ribbon folds
    final foldPaint = Paint()
      ..color = color.withOpacity(0.7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    canvas.drawLine(
      Offset(size.width * 0.3, size.height * 0.4),
      Offset(size.width * 0.5, size.height * 0.6),
      foldPaint,
    );

    canvas.drawLine(
      Offset(size.width * 0.5, size.height * 0.6),
      Offset(size.width * 0.7, size.height * 0.4),
      foldPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _CertificatePatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF7f4bde)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8;

    // Draw grid pattern
    for (double i = 0; i < size.width; i += 20) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (double i = 0; i < size.height; i += 20) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }

    // Draw corner decorations
    final cornerPaint = Paint()
      ..color = const Color(0xFF7f4bde)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    const cornerSize = 30.0;
    // Top left corner
    canvas.drawLine(const Offset(0, cornerSize), Offset.zero, cornerPaint);
    canvas.drawLine(Offset.zero, Offset(cornerSize, 0), cornerPaint);

    // Top right corner
    canvas.drawLine(
      Offset(size.width - cornerSize, 0),
      Offset(size.width, 0),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(size.width, 0),
      Offset(size.width, cornerSize),
      cornerPaint,
    );

    // Bottom left corner
    canvas.drawLine(
      Offset(0, size.height - cornerSize),
      Offset(0, size.height),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(0, size.height),
      Offset(cornerSize, size.height),
      cornerPaint,
    );

    // Bottom right corner
    canvas.drawLine(
      Offset(size.width - cornerSize, size.height),
      Offset(size.width, size.height),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(size.width, size.height - cornerSize),
      Offset(size.width, size.height),
      cornerPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
