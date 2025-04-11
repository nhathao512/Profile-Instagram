import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const InstagramProfile(),
    );
  }
}

class InstagramProfile extends StatefulWidget {
  const InstagramProfile({super.key});

  @override
  _InstagramProfileState createState() => _InstagramProfileState();
}

class _InstagramProfileState extends State<InstagramProfile> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Text(
              'nhathao512_',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(width: 8),
            Icon(Icons.keyboard_arrow_down, size: 20),
          ],
        ),
        actions: const [
          Icon(Icons.add_box_outlined, size: 28),
          SizedBox(width: 16),
          Icon(Icons.menu, size: 28),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none, // Allow overflow
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage('https://picsum.photos/100'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Icon plus blue
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(3),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                      // Note instagram
                      Positioned(
                        top: -20,
                        left: 0,
                        right: 0,
                        child: Container(
                          margin: const EdgeInsets.only(top: 4),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 2,
                              vertical: 4,
                            ),
                            child: Center(
                              child: Text(
                                'Bạn có gì mới vậy?',
                                textAlign: TextAlign.center,

                                style: TextStyle(
                                  color: Color(0xFFA8A8A8),
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nhật Hào Võ', style: TextStyle(fontSize: 15)),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildStatColumn('12', 'bài viết'),
                            _buildStatColumn('100K', 'người theo dõi'),
                            _buildStatColumn('104', 'đang theo dõi'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Blog cá nhân',
                      style: TextStyle(color: Color(0xFFA8A8A8)),
                    ),
                    const SizedBox(height: 4),
                    Text('❤️'),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.facebook_sharp, color: Colors.grey[400]),
                    SizedBox(width: 8),
                    Text(
                      'Nhât Hào Võ',

                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Công cụ chuyên nghiệp",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "10K lượt xem trong 30 ngày qua",
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(child: _buildButton('Chỉnh sửa trang cá nhân')),
                      const SizedBox(width: 8),
                      Expanded(child: _buildButton('Chia sẻ trang cá nhân')),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildStoryHighlight(Icons.add, 'Mới'),
                  _buildStoryHighlight(null, 'Homie..', imageIndex: 20),
                  _buildStoryHighlight(null, 'Là tôi nè', imageIndex: 30),
                  _buildStoryHighlight(null, 'TDTU', imageIndex: 40),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(Icons.grid_on, size: 28),
                Icon(Icons.ondemand_video_outlined, size: 28),
                Icon(Icons.person_pin_outlined, size: 28),
              ],
            ),
            const SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                childAspectRatio:
                    307 / 410, // Specifically 307:410 aspect ratio
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                return Image.network(
                  'https://picsum.photos/307/410?image=${index + 100}',
                  fit: BoxFit.cover,
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(
                  _selectedIndex == 0 ? Icons.home : Icons.home_outlined,
                  size: 28,
                  color: _selectedIndex == 0 ? Colors.white : Colors.white,
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(
                  _selectedIndex == 1 ? Icons.search : Icons.search_outlined,
                  size: 28,
                  color: _selectedIndex == 1 ? Colors.white : Colors.grey,
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(
                  _selectedIndex == 2 ? Icons.add_box : Icons.add_box_outlined,
                  size: 28,
                  color: _selectedIndex == 2 ? Colors.white : Colors.grey,
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(
                  _selectedIndex == 3
                      ? Icons.live_tv
                      : Icons.ondemand_video_outlined,
                  size: 28,
                  color: _selectedIndex == 3 ? Colors.white : Colors.grey,
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage('https://picsum.photos/100'),
                      fit: BoxFit.cover,
                    ),
                    border:
                        _selectedIndex == 4
                            ? Border.all(color: Colors.white, width: 2)
                            : null,
                  ),
                ),
              ],
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildStatColumn(String count, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          count,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(label, style: TextStyle(color: Colors.grey[400])),
      ],
    );
  }

  Widget _buildButton(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildStoryHighlight(IconData? icon, String label, {int? imageIndex}) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey[800]!, width: 4),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child:
                  icon != null
                      ? Icon(icon, size: 30, color: Colors.white)
                      : Container(
                        width: 65,
                        height: 65,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://picsum.photos/100?image=${imageIndex ?? 1}',
                            ),
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(color: Colors.black, width: 3),
                        ),
                      ),
            ),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
