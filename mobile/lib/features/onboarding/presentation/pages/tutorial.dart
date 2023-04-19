import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile/core/routing/router.dart';
import 'package:mobile/core/utils/extensions.dart';
import 'package:mobile/features/shared/presentation/widgets/buttons.dart';
import 'package:mobile/generated/assets.dart';
import 'package:shared_utils/shared_utils.dart';

/// This is the tutorial screen of the application.
/// It is displayed when the user first opens the app.
class TutorialPage extends StatefulWidget {
  const TutorialPage({Key? key}) : super(key: key);

  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  final _pageController = PageController(),
      kDefaultDuration = const Duration(milliseconds: 300);
  var _currentPage = 0;

  Widget get _buildContentForCurrentPage {
    Widget content = const SizedBox.shrink();
    switch (_currentPage) {
      case 0:
        content = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            context.localizer.quickHelp.h5(context, weight: FontWeight.bold),
            context.localizer.quickHelpDesc
                .bodyText1(context, emphasis: kEmphasisMedium)
                .top(8),
          ],
        );
        break;
      case 1:
        content = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            context.localizer.freeGiveaway.h5(context, weight: FontWeight.bold),
            context.localizer.freeGiveawayDesc
                .bodyText1(context, emphasis: kEmphasisMedium)
                .top(8),
          ],
        );
        break;
      case 2:
        content = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            context.localizer.trips.h5(context, weight: FontWeight.bold),
            context.localizer.tripsDesc
                .bodyText1(context, emphasis: kEmphasisMedium)
                .top(8),
          ],
        );
        break;
      default:
        content = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            context.localizer.events.h5(context, weight: FontWeight.bold),
            context.localizer.eventsDesc
                .bodyText1(context, emphasis: kEmphasisMedium)
                .top(8),
          ],
        );
        break;
    }
    return content.top(24).horizontal(24);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(backgroundColor: context.colorScheme.background),
        body: Column(
          children: [
            // page view
            Expanded(
              flex: 5,
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                onPageChanged: (page) => setState(() => _currentPage = page),
                children: [
                  Lottie.asset(Assets.animSearchOnMap).centered(),
                  Lottie.asset(Assets.animGiveaway).centered(),
                  Lottie.asset(Assets.animTrip).centered(),
                  Lottie.asset(Assets.animEvent).centered(),
                ],
              ),
            ),

            // bottom content
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  // metadata
                  Expanded(
                    child: _buildContentForCurrentPage,
                  ),

                  SafeArea(
                    top: false,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildIndicatorDashes(),
                        RoundedIconButton(
                          icon: _currentPage == 3
                              ? FeatherIcons.check
                              : Icons.arrow_right_alt,
                          color: context.colorScheme.tertiary,
                          onTap: () => _currentPage == 3
                              ? context.navigator
                                  .popAndPushNamed(AppRouter.registerNewAccountRoute)
                              : _pageController.animateToPage(++_currentPage,
                                  duration: kDefaultDuration,
                                  curve: Curves.easeInOut),
                        ),
                      ],
                    ).horizontal(24).bottom(8),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  /// Builds the indicator dots.
  Widget _buildIndicatorDashes() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          4,
          (index) => AnimatedContainer(
            duration: kDefaultDuration,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            height: 8,
            width: _currentPage == index ? 40 : 8,
            decoration: BoxDecoration(
              color: _currentPage == index
                  ? context.colorScheme.tertiary
                  : context.colorScheme.onBackground
                      .withOpacity(kEmphasisLowest),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      );
}
