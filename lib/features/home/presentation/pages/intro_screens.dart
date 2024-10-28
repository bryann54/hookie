import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroScreens extends StatefulWidget {
  const IntroScreens({super.key});

  @override
  State<IntroScreens> createState() => _IntroScreensState();
}

class _IntroScreensState extends State<IntroScreens> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<IntroContent> _contents = [
    IntroContent(
      title: 'Find Your Perfect Match',
      subtitle: 'Connect with amazing people',
      description: 'Discover meaningful connections',
      image:
          'https://assets2.lottiefiles.com/packages/lf20_z4cshyhf.json', // Dating/Connection animation
    ),
    IntroContent(
      title: 'Safe & Secure',
      subtitle: 'Your privacy matters',
      description: 'Advanced security features',
      image:
        'https://assets2.lottiefiles.com/packages/lf20_z4cshyhf.json', // Security shield animation
    ),
    IntroContent(
      title: 'Start Your Journey',
      subtitle: 'Begin your adventure',
      description: 'Join our growing community',
      image:
          'https://assets2.lottiefiles.com/packages/lf20_z4cshyhf.json', // Journey/Adventure animation
    ),
  ];

  @override
  void initState() {
    super.initState();
    // Auto-play setup
    Future.delayed(const Duration(seconds: 1), () {
      autoPlay();
    });
  }

  void autoPlay() {
    Future.delayed(const Duration(seconds: 3), () {
      if (_currentPage < _contents.length - 1) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
        autoPlay();
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50.withOpacity(.9),
      body: Stack(
        children: [
          // Background design elements
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.pink.shade100.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -30,
            left: -30,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.pink.shade200.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                flex: 3,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: _contents.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 200,
                              child: Lottie.network(
                                _contents[index].image,
                                fit: BoxFit.contain,
                                repeat: true,
                                animate: true,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              _contents[index].title,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              _contents[index].subtitle,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink.shade100.withOpacity(0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          _contents[_currentPage].description,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        // Page indicators
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            _contents.length,
                            (index) => Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: _currentPage == index ? 25 : 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: _currentPage == index
                                    ? Colors.pinkAccent
                                    : Colors.pink.shade100,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                        // Next button
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              if (_currentPage < _contents.length - 1) {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              } else {
                                // Navigate to next screen
                                // Navigator.pushReplacement(...);
                              }
                            },
                            child: Container(
                              height: 50,
                              width: 300,
                              decoration: BoxDecoration(
                                color: Colors.pinkAccent,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.pinkAccent.withOpacity(0.3),
                                    blurRadius: 12,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  _currentPage == _contents.length - 1
                                      ? 'Get Started'
                                      : 'Next',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class IntroContent {
  final String title;
  final String subtitle;
  final String description;
  final String image;

  IntroContent({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.image,
  });
}
