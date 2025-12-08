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
        child: Column(
          children: [
            // ПАНЕЛЬ С КНОПКАМИ
            SizedBox(
              height: 64,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // TODO: кнопка настройки
                      },
                      child: Image.asset(
                        AppImages.settings,
                        width: 24,
                        height: 24,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // TODO: кнопка options(три точки)
                      },
                      child: Image.asset(
                        AppImages.option,
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ПРОФИЛЬ БАННЕР
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: 45,
                      left: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.pureWhite,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 50),
                            // имя профиля
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Akiyama Mizuki',
                                      style: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Inter",
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Image.asset(
                                      AppImages.VerifiedIconPng,
                                      width: 12,
                                      height: 12,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 10),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildStatColumn('3.8K', 'Подписчики'),
                                const SizedBox(width: 31),
                                _buildStatColumn('5.4K', 'Лайки'),
                                const SizedBox(width: 31),
                                _buildStatColumn('7', 'Публикации'),
                              ],
                            ),

                            const SizedBox(height: 10),

                            // кнопкии
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 55.0,
                              ),
                              child: Row(
                                children: [
                                  // Кнопка "Редактировать" (адаптивная ширина)
                                  Expanded(
                                    flex: 3,
                                    child: _buildButton(
                                      text: 'Редактировать',
                                      backgroundColor: AppColors.background,
                                      textColor: AppColors.black,
                                      onTap: () {
                                        // TODO: Логика редактирования
                                      },
                                    ),
                                  ),

                                  const SizedBox(width: 10),

                                  // Кнопка Телеграм
                                  Expanded(
                                    flex: 0,
                                    child: _buildSocialButton(
                                      icon: AppImages.telegramIcon,
                                      onTap: () {
                                        // TODO: Логика перехода в Telegram
                                      },
                                    ),
                                  ),

                                  const SizedBox(width: 10),

                                  // Кнопка Инстаграм
                                  Expanded(
                                    flex: 0,
                                    child: _buildSocialButton(
                                      icon: AppImages.InstagramIcon,
                                      onTap: () {
                                        // TODO: Логика перехода в Instagram
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 38,
                              ),
                              child: Text(
                                'Сотворю твой успех с помощью 100+ огненных образов. Моими капсулами пользуются более 2500 девушек — присоединяйся и ты!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ),

                            const SizedBox(height: 16),
                            // TODO: остальной контент
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.pureWhite,
                              width: 4,
                            ),
                            image: const DecorationImage(
                              image: AssetImage(AppImages.profilePicture),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            // ignore: deprecated_member_use
            color: AppColors.black.withOpacity(0.45),
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required String icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(14),
        ),
        alignment: Alignment.center,
        child: Image.asset(icon, width: 20, height: 20),
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(14),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
