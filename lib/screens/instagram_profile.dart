import 'package:flutter/material.dart';
import '../widgets/stat_column.dart';
import '../widgets/edit_button.dart';
import '../widgets/story_highlight.dart';

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
      appBar: _buildAppBar(),
      body: _buildProfileBody(),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  PreferredSizeWidget _buildAppBar() => AppBar(
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
  );

  Widget _buildProfileBody() => SingleChildScrollView(
    child: Column(
      children: [
        _buildTopProfile(),
        _buildBio(),
        _buildFacebookLink(),
        _buildProfessionalTools(),
        _buildHighlights(),
        _buildTabs(),
        _buildGridImages(),
      ],
    ),
  );

  Widget _buildTopProfile() => Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          clipBehavior: Clip.none,
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
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(3),
                child: const Icon(Icons.add, color: Colors.white, size: 16),
              ),
            ),
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
                child: const Center(
                  child: Text(
                    'Bạn có gì mới vậy?',
                    style: TextStyle(color: Color(0xFFA8A8A8), fontSize: 12),
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
              const Text('Nhật Hào Võ', style: TextStyle(fontSize: 15)),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  StatColumn(count: '12', label: 'bài viết'),
                  StatColumn(count: '100K', label: 'người theo dõi'),
                  StatColumn(count: '512', label: 'đang theo dõi'),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget _buildBio() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Blog cá nhân', style: TextStyle(color: Color(0xFFA8A8A8))),
          SizedBox(height: 4),
          Text('❤️'),
        ],
      ),
    ),
  );

  Widget _buildFacebookLink() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Row(
      children: [
        Icon(Icons.facebook_sharp, color: Colors.grey[400]),
        const SizedBox(width: 8),
        const Text(
          'Nhât Hào Võ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );

  Widget _buildProfessionalTools() => Padding(
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
              const Text(
                "Công cụ chuyên nghiệp",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 4),
              Text(
                "10K lượt xem trong 30 ngày qua",
                style: TextStyle(color: Colors.grey[400], fontSize: 14),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: const [
            Expanded(child: EditButton(label: 'Chỉnh sửa trang cá nhân')),
            SizedBox(width: 8),
            Expanded(child: EditButton(label: 'Chia sẻ trang cá nhân')),
          ],
        ),
      ],
    ),
  );

  Widget _buildHighlights() => SizedBox(
    height: 100,
    child: ListView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: const [
        StoryHighlight(icon: Icons.add, label: 'Mới'),
        StoryHighlight(label: 'Homie..', imageIndex: 20),
        StoryHighlight(label: 'Là tôi nè', imageIndex: 30),
        StoryHighlight(label: 'TDTU', imageIndex: 40),
      ],
    ),
  );

  Widget _buildTabs() => const Padding(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(Icons.grid_on, size: 28),
        Icon(Icons.ondemand_video_outlined, size: 28),
        Icon(Icons.person_pin_outlined, size: 28),
      ],
    ),
  );

  Widget _buildGridImages() => GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 2,
      mainAxisSpacing: 2,
      childAspectRatio: 307 / 410,
    ),
    itemCount: 12,
    itemBuilder: (context, index) {
      return Image.network(
        'https://picsum.photos/307/410?image=${index + 100}',
        fit: BoxFit.cover,
      );
    },
  );

  Widget _buildBottomNav() => BottomNavigationBar(
    currentIndex: _selectedIndex,
    onTap: _onItemTapped,
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.grey,
    items: [
      _navItem(Icons.home, Icons.home_outlined, 0),
      _navItem(Icons.search, Icons.search_outlined, 1),
      _navItem(Icons.add_box, Icons.add_box_outlined, 2),
      _navItem(Icons.live_tv, Icons.ondemand_video_outlined, 3),
      BottomNavigationBarItem(
        icon: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: const DecorationImage(
              image: NetworkImage('https://picsum.photos/100'),
              fit: BoxFit.cover,
            ),
            border:
                _selectedIndex == 4
                    ? Border.all(color: Colors.white, width: 2)
                    : null,
          ),
        ),
        label: '',
      ),
    ],
  );

  BottomNavigationBarItem _navItem(
    IconData selected,
    IconData unselected,
    int index,
  ) {
    return BottomNavigationBarItem(
      icon: Icon(
        _selectedIndex == index ? selected : unselected,
        color: _selectedIndex == index ? Colors.white : Colors.grey,
        size: 28,
      ),
      label: '',
    );
  }
}
