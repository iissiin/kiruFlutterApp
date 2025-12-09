import 'package:flutter/material.dart';
import 'package:kiru/kiruAssets/AppImages.dart';
import 'package:kiru/kiruAssets/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              const SizedBox(height: 16),

              // ВЕРХНЯЯ ПАНЕЛЬ
              _TopBar(),

              const SizedBox(height: 50),

              // КАРТОЧКА ПРОФИЛЯ
              _ProfileCard(),

              const SizedBox(height: 16),

              // КАРТОЧКА ПОСТОВ
              _PostsCard(),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(AppImages.settings, width: 24, height: 24),
        Image.asset(AppImages.option, width: 24, height: 24),
      ],
    );
  }
}

class _ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // БЕЛЫЙ БЛОК
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(16, 60, 16, 20),
          decoration: BoxDecoration(
            color: AppColors.pureWhite,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            children: [
              // Имя + галочка
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Akiyama Mizuki',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Image.asset(AppImages.VerifiedIconPng, width: 16),
                ],
              ),

              const SizedBox(height: 14),

              // Статистика
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _Stat('3.8K', 'Подписчики'),
                  _Stat('5.4K', 'Лайки'),
                  _Stat('7', 'Публикации'),
                ],
              ),

              const SizedBox(height: 16),

              // Кнопки
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _BigButton(text: 'Редактировать', onTap: () {}),
                  const SizedBox(width: 10),
                  _SmallIcon(AppImages.telegramIcon),
                  const SizedBox(width: 10),
                  _SmallIcon(AppImages.InstagramIcon),
                ],
              ),

              const SizedBox(height: 14),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Text(
                  'Mizuki is a moody person and is obsessed with cute things. They were captivated by the music Kanade Yoisaki composed and made videos using them. ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    height: 1.38,
                    color: AppColors.black.withOpacity(0.85),
                  ),
                ),
              ),
            ],
          ),
        ),

        // АВАТАР
        Positioned(
          top: -45,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.pureWhite, width: 4),
                image: const DecorationImage(
                  image: AssetImage(AppImages.profilePicture),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Stat extends StatelessWidget {
  final String value;
  final String label;

  const _Stat(this.value, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            // ignore: deprecated_member_use
            color: AppColors.black.withOpacity(0.45),
          ),
        ),
      ],
    );
  }
}

class _PostsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.pureWhite,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          _BigButton(
            text: "Опубликовать",
            icon: Image.asset(AppImages.plusIconPNG, width: 21),
            onTap: () {},
          ),

          const SizedBox(height: 16),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.75,
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
          ),
        ],
      ),
    );
  }
}

class _BigButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Widget? icon;

  const _BigButton({required this.text, required this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 42,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(14),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[icon!, const SizedBox(width: 8)],
            Text(
              text,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SmallIcon extends StatelessWidget {
  final String icon;

  const _SmallIcon(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Center(child: Image.asset(icon, width: 20)),
    );
  }
}

// MARK: PHOTO
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
