import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeContent extends ConsumerStatefulWidget {
  const HomeContent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeContentState();
}

class _HomeContentState extends ConsumerState<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 25,
          children: [
            Center(
              child: SearchBar(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

                elevation: WidgetStatePropertyAll(0.5),

                leading: Row(
                  children: [
                    Icon(Icons.location_on),
                    const SizedBox(width: 85),
                    Container(
                      width: 1,
                      height: 24,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
                trailing: [
                  IconButton(icon: const Icon(Icons.search), onPressed: () {}),
                ],
                hintText: "Search Destination",
              ),
            ),

            Center(
              child: Container(
                width: 350,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  // color: Colors.grey,
                  border: Border.all(color: Colors.grey),
                ),

                child: Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.sunny),
                            const SizedBox(width: 3),
                            Text("Mountain"),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.beach_access),
                            const SizedBox(width: 3),
                            Text("Beach"),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.location_city),
                            const SizedBox(width: 3),
                            Text("Urban"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  "Cultural Heritages",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Text("See More", style: TextStyle(fontSize: 15)),
                Icon(Icons.arrow_forward_ios, size: 14),
              ],
            ),

            CarouselSlider(
              items: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/images/janaki.png",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/images/pashupatinath.jpg",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/images/patan.jpg",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/images/swoyambhu.jpg",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
              options: CarouselOptions(
                height: 250.0,

                autoPlay: true,
                autoPlayInterval: Duration(seconds: 4),
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
              ),
            ),

            Row(
              children: [
                Text(
                  "Beautiful Nepal",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Text("See More", style: TextStyle(fontSize: 15)),
                Icon(Icons.arrow_forward_ios, size: 14),
              ],
            ),

            CarouselSlider(
              items: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/images/patan.jpg",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/images/swoyambhu.jpg",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/images/pashupatinath.jpg",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/images/janaki.png",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
              options: CarouselOptions(
                height: 250.0,

                autoPlay: true,
                autoPlayInterval: Duration(seconds: 2),
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
