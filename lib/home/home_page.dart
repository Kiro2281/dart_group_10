import 'package:flutter/material.dart';
import 'package:iconsax_latest/iconsax_latest.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyAppState();
}

class _MyAppState extends State<MyHomePage> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 280,
            child: Stack(
              children: [
                PageView.builder(
                  controller: _controller,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      "images/1.png",
                      fit: BoxFit.cover,
                    );
                  },
                ),
                Positioned(
                  bottom: 16,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: 6,
                      effect: WormEffect(),
                      onDotClicked: (index) {
                        _controller.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 8,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 16,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.black87,
                        child: IconButton(
                          icon: const Icon(Icons.favorite_border, color: Colors.white),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 12),
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.black87,
                        child: IconButton(
                          icon: const Icon(Icons.ios_share, color: Colors.white),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, top: 24 , right: 42),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Наушники Beats by Dre',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Text(
                            '400 000 ₩',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 12,),
                          const Text(
                            'Договорная',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFE25532)
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 24,),
                      Column(
                        children: [
                          Text(
                            'Описание',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8,),
                      Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.all(20),
                          child: Text('Эти наушники — верный спутник в мире звука и стиля. '
                              'С их элегантным дизайном и превосходным качеством звучания вы погружаетесь в музыкальный опыт нового уровня. '
                              'Наушники идеально сбалансированы между комфортом и функциональностью, обеспечивая чистоту звука и ясные высокие частоты. '
                              'Идеальный выбор для тех, кто ценит каждую ноту и стремится к идеальному звучанию в любой обстановке.',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white
                            ),
                          ),
                        ),
                      SizedBox(height: 12,),
                      Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text('Продавец',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox( height: 12),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade900,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 32,
                                  backgroundImage: AssetImage('images/Ivan0001.png'),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Иванов Иван',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          const Icon(Icons.star, color: Colors.deepOrangeAccent, size: 16),
                                          const SizedBox(width: 4),
                                          Text(
                                            'Отзывы',
                                            style: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontSize: 12,
                                            ),
                                          ),
                                          const SizedBox(width: 6),
                                          const Text(
                                            '(20)',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(Icons.chevron_right, color: Colors.white),
                              ],
                            ),
                          ),
                          SizedBox(height: 18),
                          Center(
                            child: Container(
                              width: double.infinity,
                              height: 45,
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: Colors.deepOrangeAccent,
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child: Column(
                                crossAxisAlignment: .center,
                                children: [
                                Text(
                                'Связаться с продавцом',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600
                                ),
                                ),
                                ],
                              )
                              )
                            ),
                          SizedBox(height: 12,),
                          Center(
                            child: Container(
                                width: 114,
                                height: 28,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade900,
                                    borderRadius: BorderRadius.circular(4)
                                ),
                                child: Row(
                                  children: [
                                    Padding(padding: EdgeInsets.only(right: 4 , left : 8 , bottom: 2),
                                    child:  Text(
                                      'Пожаловаться',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only( right: 2 , bottom: 2),
                                    child:    Icon(Icons.warning_amber_rounded,color: Colors.red,))
                                  ],
                                )
                            ),
                          ),
                          SizedBox(height: 24,)
                        ],
                      )
                    ],
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