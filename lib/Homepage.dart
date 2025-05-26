import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ostello/card_wigt.dart';
import 'package:ostello/dropdown_widget.dart';
import 'package:ostello/imageandtext.dart';
import 'package:ostello/price_widget.dart';
import 'package:ostello/time_prover2.dart';
import 'package:ostello/timer_widget.dart';


final carouselIndexProvider = StateProvider<int>((ref) => 0);

class TimerScreen extends ConsumerWidget {
  const TimerScreen({super.key});

  String twoDigits(int n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTime = ref.watch(currentTimeProvider);
    final currentIndex = ref.watch(carouselIndexProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Text(
                'The Ultimate Fluency\n     Mastery Course',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Image.asset('asset/image/Frame 1707480242.png'),
              const SizedBox(height: 20),
              currentTime.when(
                data: (now) {
                  final hours = twoDigits(now.hour);
                  final minutes = twoDigits(now.minute);
                  final seconds = twoDigits(now.second);

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TimeBlock(value: hours, label: 'HRS'),
                      const SizedBox(width: 16),
                      TimeBlock(value: minutes, label: 'MIN'),
                      const SizedBox(width: 16),
                      TimeBlock(value: seconds, label: 'SEC'),
                    ],
                  );
                },
                loading: () => const CircularProgressIndicator(),
                error: (err, stack) => Text('Error: $err'),
              ),
              const SizedBox(height: 20),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Imageandtext(
                      image: 'asset/image/Frame 1707480231.png',
                      text: 'Live Access',
                    ),
                    SizedBox(width: 20),
                    Imageandtext(
                      image: 'asset/image/Frame 1707480232.png',
                      text: 'AI doubt Solver',
                    ),
                    SizedBox(width: 20),
                    Imageandtext(
                      image: 'asset/image/Frame 1707480232-1.png',
                      text: 'Learning Materials',
                    ),
                    SizedBox(width: 20),
                    Imageandtext(
                      image: 'asset/image/Frame 1707480232-2.png',
                      text: 'Gamified ',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

           
              CarouselSlider(
                options: CarouselOptions(
                  height: 270,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  viewportFraction: 0.85,
                  onPageChanged: (index, reason) {
                    ref.read(carouselIndexProvider.notifier).state = index;
                  },
                ),
                items: const [
                  CardWigt(
                    image: 'asset/image/image_placeholder.png',
                    name: 'John Doe',
                    text:
                        """Their attention to detail and creative design approach transformed our website into a visually stunning and highly functional platform. We’ve seen a 30% increase in traffic since the relaunch. I highly recommend them to anyone seeking professional web design services!""",
                  ),
                  CardWigt(
                    image: 'asset/image/image_placeholder.png',
                    name: 'Jane Smith',
                    text:
                        """Working with the team was an absolute pleasure. They listened carefully and delivered a design that truly represented our brand. Our clients love it!""",
                  ),
                  CardWigt(
                    image: 'asset/image/image_placeholder.png',
                    name: 'Mike Taylor',
                    text:
                        """Exceptional professionalism and creativity. The new design not only looks great but also improved user experience significantly.""",
                  ),
                ],
              ),
              const SizedBox(height: 12),

              DotsIndicator(
                dotsCount: 3,
                position: currentIndex.toDouble(),
                decorator: DotsDecorator(
                  color: Colors.grey,
                  activeColor: Colors.purple,
                  size: const Size.square(10.0),
                  activeSize: const Size(12.0, 8.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),const SizedBox(height: 17),

              const Center(child: Text('Frequently Asked Question s',style: 
              TextStyle(fontSize: 25,
              fontWeight: FontWeight.w600,
              fontFamily: 'Schyler'),
              )),
              const SizedBox(height: 20),

              const ExpandableCard(
                title: 'What does this course include?', 
                content: 'What does this course include?'),

                const SizedBox(height: 20),

              const ExpandableCard(
                title: 'What does this course include?', 
                content: 'What does this course include?'),

                const SizedBox(height: 20),

              const ExpandableCard(
                title: 'Can I access the course content after \ncompleting it?', 
                content: 'What does this course include?'),

                const SizedBox(height: 20),

              const ExpandableCard(
                title: 'Will I get a certificate after completing the \ncourse?', 
                content: 'What does this course include?'),

              const SizedBox(height: 20),
               const ThreeOptionSelector(

               ),const SizedBox(height: 20),

               SizedBox(width: double.infinity,
               height: 50,
                 child: ElevatedButton(
                  onPressed: (){},style: ButtonStyle(backgroundColor: const WidgetStatePropertyAll(Colors.purple),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                 ), 
                 child: const Text('Subscribe Now',style: TextStyle(color: Colors.white,
                 fontFamily: 'Schyler',fontWeight: FontWeight.bold,
                 fontSize: 16),),
                 ),
               ),
               Container(height: 50,),
            ],

           
          ),
        ),
      ),
    );
  }
}
