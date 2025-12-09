import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiru/kiruAssets/AppImages.dart';
import 'package:kiru/kiruAssets/colors.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const SizedBox(height: 16),

            // ВЕРХНЯЯ ПАНЕЛЬ
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: _TopBar(),
            ),

            const SizedBox(height: 43),

            // GRID ФОТОК
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: _PostsGrid(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// MARK: кнопки сверху
class _TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppImages.searchicon, width: 28, height: 28),
        Expanded(
          child: Center(
            child: const Text(
              'Избранное',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(width: 28),
      ],
    );
  }
}

// MARK: PHOTO-grid
class _PostsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 240,
      ),
      itemBuilder: (_, index) {
        final photos = [
          AppImages.asset1,
          AppImages.asset2,
          AppImages.asset3,
          AppImages.asset4,
        ];

        return _PostItem(
          image: photos[index % photos.length],
          liked: index.isEven,
        );
      },
    );
  }
}

// MARK: карточка фото
class _PostItem extends StatelessWidget {
  final String image;
  final bool liked;

  const _PostItem({required this.image, required this.liked});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),

        Positioned(
          bottom: 8,
          right: 8,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: Colors.white.withOpacity(0.9),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                liked ? AppImages.heartPNG : AppImages.unfilledHeartPNG,
                width: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
