import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiru/home/bloc/home_feed_bloc.dart';
import 'package:kiru/kiruAssets/AppImages.dart';
import 'package:kiru/kiruAssets/colors.dart';
import 'package:kiru/models/feed_tab.dart';

class TopBar extends StatelessWidget {
  final Function(FeedTab) onTabChanged;

  const TopBar({super.key, required this.onTabChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppImages.searchicon, width: 28, height: 28),
        Expanded(
          child: Center(
            child: BlocBuilder<HomeFeedBloc, HomeFeedState>(
              builder: (context, state) {
                return _AnimatedTabSelector(
                  currentTab: state.currentTab,
                  onTabChanged: onTabChanged,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _AnimatedTabSelector extends StatelessWidget {
  final FeedTab currentTab;
  final Function(FeedTab) onTabChanged;

  const _AnimatedTabSelector({
    required this.currentTab,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isRecommendations = currentTab == FeedTab.recommendations;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 18,
      children: [
        // Подписки
        GestureDetector(
          onTap: () => onTabChanged(FeedTab.subscriptions),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: 35,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            decoration: BoxDecoration(
              color: !isRecommendations ? AppColors.black : Colors.transparent,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Text(
                'Подписки',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: !isRecommendations
                      ? AppColors.pureWhite
                      : AppColors.black,
                ),
              ),
            ),
          ),
        ),

        // Рекомендации
        GestureDetector(
          onTap: () => onTabChanged(FeedTab.recommendations),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: 35,
            width: 127,
            decoration: BoxDecoration(
              color: isRecommendations ? AppColors.black : Colors.transparent,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Text(
                'Рекомендации',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: isRecommendations
                      ? AppColors.pureWhite
                      : AppColors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
