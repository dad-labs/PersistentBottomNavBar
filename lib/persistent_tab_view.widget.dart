// Author: Bilal Shahid
// For queries, contact me at bilalscheema@gmail.com

// ignore_for_file: overridden_fields

part of persistent_bottom_nav_bar;

///A highly customizable persistent navigation bar for flutter.
///
///To learn more, check out the [Readme](https://github.com/BilalShahid13/PersistentBottomNavBar).

class PersistentTabView extends PersistentTabViewBase {
  PersistentTabView(this.context,
      {required this.screens,
      final Key? key,
      final List<PersistentBottomNavBarItem> items = const [],
      this.controller,
      final double navBarHeight = kBottomNavigationBarHeight,
      this.margin = EdgeInsets.zero,
      this.backgroundColor = CupertinoColors.white,
      final ValueChanged<int>? onItemSelected,
      final NeumorphicProperties? neumorphicProperties,
      this.floatingActionButton,
      final EdgeInsets padding = EdgeInsets.zero,
      final NavBarDecoration decoration = const NavBarDecoration(),
      this.resizeToAvoidBottomInset = false,
      this.bottomScreenMargin,
      this.selectedTabScreenContext,
      this.hideNavigationBarWhenKeyboardAppears = true,
      // final MainAxisAlignment navBarItemsAlignment = MainAxisAlignment.spaceAround,
      final PopBehavior popBehaviorOnSelectedNavBarItemPress = PopBehavior.all,
      this.confineToSafeArea = true,
      this.onWillPop,
      this.hideOnScrollSettings = const HideOnScrollSettings(),
      this.stateManagement = true,
      this.handleAndroidBackButtonPress = true,
      this.isVisible = true,
      // this.navBarPosition = NavBarPosition.bottom,
      this.animationSettings = const NavBarAnimationSettings(),
      final NavBarStyle navBarStyle = NavBarStyle.style1})
      : assert(assertMidButtonStyles(navBarStyle, items.length),
            "NavBar styles 15-18 only accepts the property `List<PersistentBottomNavBarItem> items` with 3 or 5 length."),
        assert(items.length == screens.length,
            "screens and items length should be same. If you are using the onPressed callback function of 'PersistentBottomNavBarItem', enter a dummy screen like Container() in its place in the screens"),
        assert(items.length >= 2 && items.length <= 6,
            "NavBar should have at least 2 or maximum 6 items (Except for styles 15-18)"),
        super(
          key: key,
          context: context,
          screens: screens,
          controller: controller,
          margin: margin,
          items: items,
          padding: padding,
          decoration: decoration,
          hideOnScrollSettings: hideOnScrollSettings,
          hideNavigationBarWhenKeyboardAppears:
              hideNavigationBarWhenKeyboardAppears,
          animationSettings: animationSettings,
          navBarStyle: navBarStyle,
          navBarItemsAlignment: MainAxisAlignment.spaceAround,
          popBehaviorOnSelectedNavBarItemPress:
              popBehaviorOnSelectedNavBarItemPress,
          navBarHeight: navBarHeight,
          backgroundColor: backgroundColor,
          onItemSelected: onItemSelected,
          neumorphicProperties: neumorphicProperties,
          floatingActionButton: floatingActionButton,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          bottomScreenMargin: bottomScreenMargin,
          onWillPop: onWillPop,
          isCustomWidget: false,
          confineToSafeArea: confineToSafeArea,
          stateManagement: stateManagement,
          handleAndroidBackButtonPress: handleAndroidBackButtonPress,
          isVisible: isVisible,
          navBarPosition: NavBarPosition.bottom,
        );

  const PersistentTabView.custom(
    this.context, {
    required final Widget customWidget,
    required final int itemCount,
    required this.screens,
    final Key? key,
    this.controller,
    this.margin = EdgeInsets.zero,
    this.floatingActionButton,
    this.resizeToAvoidBottomInset = false,
    this.bottomScreenMargin,
    this.selectedTabScreenContext,
    this.hideNavigationBarWhenKeyboardAppears = true,
    this.backgroundColor = CupertinoColors.white,
    final _CustomWidgetRouteAndNavigatorSettings routeAndNavigatorSettings =
        const _CustomWidgetRouteAndNavigatorSettings(),
    this.confineToSafeArea = true,
    this.onWillPop,
    this.hideOnScrollSettings = const HideOnScrollSettings(),
    this.stateManagement = true,
    this.handleAndroidBackButtonPress = true,
    // this.navBarPosition = NavBarPosition.bottom,
    this.isVisible = true,
    this.animationSettings = const NavBarAnimationSettings(),
    final double navBarHeight = kBottomNavigationBarHeight,
  })  : assert(itemCount == screens.length,
            "screens and items length should be same. If you are using the onPressed callback function of 'PersistentBottomNavBarItem', enter a dummy screen like Container() in its place in the screens"),
        super(
          key: key,
          context: context,
          screens: screens,
          controller: controller,
          margin: margin,
          hideOnScrollSettings: hideOnScrollSettings,
          routeAndNavigatorSettings: routeAndNavigatorSettings,
          backgroundColor: backgroundColor,
          floatingActionButton: floatingActionButton,
          customWidget: customWidget,
          itemCount: itemCount,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          bottomScreenMargin: bottomScreenMargin,
          onWillPop: onWillPop,
          confineToSafeArea: confineToSafeArea,
          stateManagement: stateManagement,
          handleAndroidBackButtonPress: handleAndroidBackButtonPress,
          isVisible: isVisible,
          isCustomWidget: true,
          decoration: const NavBarDecoration(),
          navBarPosition: NavBarPosition.bottom,
          navBarHeight: navBarHeight,
        );

  ///Screens that will be displayed on tapping of persistent bottom navigation bar items.
  @override
  final List<Widget> screens;

  ///Controller for persistent bottom navigation bar. Will be declared if left empty.
  @override
  final PersistentTabController? controller;

  ///Background color of bottom navigation bar. `white` by default.
  @override
  final Color backgroundColor;

  ///A custom widget which is displayed at the bottom right of the display at all times.
  @override
  final Widget? floatingActionButton;

  ///Specifies the navBarHeight
  ///
  ///Defaults to `kBottomNavigationBarHeight` which is `56.0`.
  //final double navBarHeight;

  ///The margin around the navigation bar.
  @override
  final EdgeInsets margin;

  ///Will confine the NavBar's items in the safe area defined by the device.
  @override
  final bool confineToSafeArea;

  ///Handles android back button actions. Defaults to `true`.
  ///
  ///Action based on scenarios:
  ///1. If the you are on the first tab with all screens popped of the given tab, the app will close.
  ///2. If you are on another tab with all screens popped of that given tab, you will be switched to first tab.
  ///3. If there are screens pushed on the selected tab, a screen will pop on a respective back button press.
  @override
  final bool handleAndroidBackButtonPress;

  ///Bottom margin of the screen.
  @override
  final double? bottomScreenMargin;

  @override
  final bool resizeToAvoidBottomInset;

  ///Preserves the state of each tab's screen. `true` by default.
  @override
  final bool stateManagement;

  ///If you want to perform a custom action on Android when exiting the app, you can write your logic here. Returns context of the selected screen.
  @override
  final Future<bool> Function(BuildContext?)? onWillPop;

  ///Returns the context of the selected tab.
  @override
  final Function(BuildContext?)? selectedTabScreenContext;

  ///Screen transition animation properties when switching tabs.
  @override
  final NavBarAnimationSettings animationSettings;

  @override
  final bool hideNavigationBarWhenKeyboardAppears;

  ///Hides the navigation bar with a transition animation when set to `false`. Use it in conjunction with [Provider](https://pub.dev/packages/provider) for better results.
  @override
  final bool isVisible;

  @override

  ///When these scroll controllers detect a scroll down motion, the navigation bar hides automatically. A hidden navigation bar appears again when scroll up motion is detected.
  final HideOnScrollSettings hideOnScrollSettings;

  // @override
  // //Navigation bar's position on the screen.
  // final NavBarPosition navBarPosition;

  @override
  final BuildContext context;
}

class PersistentTabViewBase extends StatefulWidget {
  const PersistentTabViewBase({
    final Key? key,
    this.screens = const [],
    this.controller,
    this.floatingActionButton,
    this.hideOnScrollSettings = const HideOnScrollSettings(),
    this.margin = EdgeInsets.zero,
    this.confineToSafeArea = true,
    this.handleAndroidBackButtonPress = true,
    this.bottomScreenMargin,
    this.resizeToAvoidBottomInset = true,
    this.stateManagement = true,
    this.animationSettings = const NavBarAnimationSettings(),
    this.isVisible = true,
    this.context,
    this.items = const [],
    this.backgroundColor,
    this.onItemSelected,
    this.decoration = const NavBarDecoration(),
    this.padding = EdgeInsets.zero,
    this.navBarStyle = NavBarStyle.simple,
    this.neumorphicProperties,
    this.navBarHeight = kBottomNavigationBarHeight,
    this.customWidget,
    this.itemCount = 0,
    this.popBehaviorOnSelectedNavBarItemPress = PopBehavior.all,
    this.onWillPop,
    this.hideNavigationBarWhenKeyboardAppears = true,
    this.isCustomWidget = false,
    this.selectedTabScreenContext,
    this.routeAndNavigatorSettings,
    this.navBarItemsAlignment = MainAxisAlignment.spaceAround,
    this.navBarPosition = NavBarPosition.bottom,
  }) : super(key: key);

  ///List of persistent bottom navigation bar items to be displayed in the navigation bar.
  final List<PersistentBottomNavBarItem> items;

  ///Screens that will be displayed on tapping of persistent bottom navigation bar items.
  final List<Widget> screens;

  ///Controller for persistent bottom navigation bar. Will be declared if left empty.
  final PersistentTabController? controller;

  ///Background color of bottom navigation bar. `white` by default.
  final Color? backgroundColor;

  ///Callback when page or tab change is detected.
  final ValueChanged<int>? onItemSelected;

  ///Specifies the curve properties of the NavBar.
  final NavBarDecoration decoration;

  ///`padding` for the persistent navigation bar content.
  ///
  ///`USE WITH CAUTION, MAY CAUSE LAYOUT ISSUES`.
  final EdgeInsets padding;

  ///Style for persistent bottom navigation bar. Accepts `NavBarStyle` to determine the theme.
  final NavBarStyle navBarStyle;

  ///Style the `neumorphic` navigation bar item.
  ///
  ///Works only with style `neumorphic`.
  final NeumorphicProperties? neumorphicProperties;

  ///A custom widget which is displayed at the bottom right of the display at all times.
  final Widget? floatingActionButton;

  ///Specifies the navBarHeight
  ///
  ///Defaults to `kBottomNavigationBarHeight` which is `56.0`.
  final double navBarHeight;

  ///The margin around the navigation bar.
  final EdgeInsets margin;

  ///Custom navigation bar widget. To be only used when `navBarStyle` is set to `NavBarStyle.custom`.
  final Widget? customWidget;

  ///If using `custom` navBarStyle, define this instead of the `items` property
  final int itemCount;

  ///Will confine the NavBar's items in the safe area defined by the device.
  final bool confineToSafeArea;

  ///Handles android back button actions. Defaults to `true`.
  ///
  ///Action based on scenarios:
  ///1. If the you are on the first tab with all screens popped of the given tab, the app will close.
  ///2. If you are on another tab with all screens popped of that given tab, you will be switched to first tab.
  ///3. If there are screens pushed on the selected tab, a screen will pop on a respective back button press.
  final bool handleAndroidBackButtonPress;

  ///Bottom margin of the screen.
  final double? bottomScreenMargin;

  ///Defines the pop behavior when an already selected nav bar item/tab is pressed.
  final PopBehavior popBehaviorOnSelectedNavBarItemPress;

  final bool resizeToAvoidBottomInset;

  ///Preserves the state of each tab's screen. `true` by default.
  final bool stateManagement;

  ///If you want to perform a custom action on Android when exiting the app, you can write your logic here.
  final Future<bool> Function(BuildContext)? onWillPop;

  final bool hideNavigationBarWhenKeyboardAppears;

  ///Navigation Bar animation properties.
  final NavBarAnimationSettings animationSettings;

  ///Hides the navigation bar with an transition animation. Use it in conjuction with [Provider](https://pub.dev/packages/provider) for better results.
  final bool isVisible;

  ///Define navigation bar route name and settings here.
  ///
  ///If you want to programmatically pop to initial screen on a specific use this route name when popping.
  final _CustomWidgetRouteAndNavigatorSettings? routeAndNavigatorSettings;

  ///When these scroll controllers detect a scroll down motion, the navigation bar hides automatically. A hidden navigation bar appears again when scroll up motion is detected.
  final HideOnScrollSettings hideOnScrollSettings;

  final bool isCustomWidget;

  final BuildContext? context;

  final Function(BuildContext)? selectedTabScreenContext;

  final MainAxisAlignment navBarItemsAlignment;

  final NavBarPosition navBarPosition;

  @override
  _PersistentTabViewState createState() => _PersistentTabViewState();
}

class _PersistentTabViewState extends State<PersistentTabView>
    with SingleTickerProviderStateMixin {
  late List<BuildContext?> _contextList;
  late PersistentTabController _controller;
  late double _navBarHeight;
  late int _previousIndex;
  late int _currentIndex;
  bool? _isCompleted;
  bool? _isAnimating;
  late bool _sendScreenContext;
  late bool _hideNavigationBar;
  late bool _hideNavigationAfterScrollDown;
  late final AnimationController _navBarHideAnimationController;
  late final Animation<double> _navBarHeightFactor;
  late final HashMap<ScrollController, _NavBarScrollModel> _lastScrollOffset =
      HashMap();

  @override
  void initState() {
    super.initState();

    _navBarHideAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
    _navBarHeightFactor =
        Tween<double>(begin: 1, end: 0).animate(_navBarHideAnimationController);

    _contextList = List<BuildContext?>.filled(
        widget.items.isEmpty ? widget.itemCount : widget.items.length, null);

    _hideNavigationBar = !widget.isVisible;

    _navBarHeight = widget.navBarHeight;

    _controller = widget.controller ?? PersistentTabController();

    _previousIndex = _controller.index;
    _currentIndex = _controller.index;

    _isCompleted = false;
    _isAnimating = false;
    _sendScreenContext = false;
    _hideNavigationAfterScrollDown = false;

    _controller.addListener(() {
      if (_controller.index != _currentIndex) {
        if (widget.selectedTabScreenContext != null) {
          _sendScreenContext = true;
        }
        if (mounted) {
          setState(
            () => _currentIndex = _controller.index,
          );
        }
      }
    });
    if (widget.selectedTabScreenContext != null) {
      WidgetsBinding.instance.addPostFrameCallback((final _) {
        widget.selectedTabScreenContext!(_contextList[_controller.index]);
      });
    }

    //Populate offset hashmap
    for (final element in widget.hideOnScrollSettings.scrollControllers) {
      _lastScrollOffset[element] = _NavBarScrollModel();
    }

    //Initialize listeners
    for (final element in widget.hideOnScrollSettings.scrollControllers) {
      element.addListener(() {
        if (_lastScrollOffset[element]!.lastOffset < element.offset) {
          _lastScrollOffset[element]!.isScrollingUp = false;
        } else if (_lastScrollOffset[element]!.lastOffset > element.offset) {
          _lastScrollOffset[element]!.isScrollingUp = true;
        }

        _lastScrollOffset[element]!.lastOffset = element.offset;

        _lastScrollOffset[element]!.maxOffset =
            max(_lastScrollOffset[element]!.maxOffset, element.offset);
        _lastScrollOffset[element]!.minimumOffset =
            min(_lastScrollOffset[element]!.minimumOffset, element.offset);

        if (element.offset > 0 &&
            _lastScrollOffset[element]!.minimumOffset + 120 < element.offset &&
            !_hideNavigationAfterScrollDown &&
            !_lastScrollOffset[element]!.isScrollingUp) {
          setState(() {
            _lastScrollOffset[element]!.maxOffset = element.offset;
            _lastScrollOffset[element]!.minimumOffset = element.offset;
            _hideNavigationAfterScrollDown = true;
          });
        } else if ((element.offset <= 0) ||
            (element.offset + 10 >= element.position.maxScrollExtent) ||
            (_lastScrollOffset[element]!.maxOffset > element.offset + 120 &&
                _hideNavigationAfterScrollDown &&
                _lastScrollOffset[element]!.isScrollingUp)) {
          setState(() {
            _lastScrollOffset[element]!.maxOffset = element.offset;
            _lastScrollOffset[element]!.minimumOffset = element.offset;
            _hideNavigationAfterScrollDown = false;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _navBarHideAnimationController.dispose();
    super.dispose();
  }

  Widget _buildScreen(final int index) {
    final RouteAndNavigatorSettings routeAndNavigatorSettings = widget
            .isCustomWidget
        ? RouteAndNavigatorSettings(
            defaultTitle: widget.routeAndNavigatorSettings?.defaultTitle,
            initialRoute: widget.routeAndNavigatorSettings?.initialRoute,
            navigatorKey:
                widget.routeAndNavigatorSettings?.navigatorKeys == null
                    ? null
                    : widget.routeAndNavigatorSettings
                        ?.navigatorKeys![_controller.index],
            navigatorObservers:
                widget.routeAndNavigatorSettings?.navigatorObservers ?? [],
            onGenerateRoute: widget.routeAndNavigatorSettings?.onGenerateRoute,
            onUnknownRoute: widget.routeAndNavigatorSettings?.onUnknownRoute,
            routes: widget.routeAndNavigatorSettings?.routes,
          )
        : widget.items[index].routeAndNavigatorSettings;

    if (widget.navBarStyle == NavBarStyle.style15) {
      return Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SizedBox.expand(
            child: _CustomTabView(
              routeAndNavigatorSettings: routeAndNavigatorSettings,
              builder: (final screenContext) {
                _contextList[index] = screenContext;
                if (_sendScreenContext) {
                  _sendScreenContext = false;
                  widget.selectedTabScreenContext!(_contextList[index]);
                }
                return Material(child: widget.screens[index]);
              },
            ),
          ),
          if (_navBarHeight == 0)
            const SizedBox.shrink()
          else
            Positioned(
              bottom: (_navBarHeight - (widget.bottomScreenMargin ?? 0)).abs(),
              child: GestureDetector(
                onTap: () {
                  if (widget
                          .items[(widget.items.length / 2).floor()].onPressed !=
                      null) {
                    widget.items[(widget.items.length / 2).floor()]
                        .onPressed!(_contextList[_controller.index]);
                  } else {
                    _controller.index = (widget.items.length / 2).floor();
                  }
                },
                child: Center(
                  child: Container(
                    height: 21.0 +
                        min(
                            widget.navBarHeight,
                            max(
                                    widget.decoration.borderRadius?.topRight
                                            .y ??
                                        0,
                                    widget.decoration.borderRadius?.topLeft.y ??
                                        0) +
                                (widget.decoration.border != null
                                    ? widget.decoration.border?.dimensions
                                            .vertical ??
                                        0
                                    : 0.0)),
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 2 -
                            (MediaQuery.of(context).size.width / 5.0 - 30.0) /
                                2),
                    width: MediaQuery.of(context).size.width / 5.0 - 30.0,
                    decoration: const BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                        )),
                  ),
                ),
              ),
            ),
        ],
      );
    } else if (widget.navBarStyle == NavBarStyle.style16) {
      return Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SizedBox.expand(
            child: _CustomTabView(
              routeAndNavigatorSettings: routeAndNavigatorSettings,
              builder: (final screenContext) {
                _contextList[index] = screenContext;
                if (_sendScreenContext) {
                  _sendScreenContext = false;
                  widget.selectedTabScreenContext?.call(_contextList[index]);
                }
                return Material(child: widget.screens[index]);
              },
            ),
          ),
          if (_navBarHeight == 0)
            const SizedBox.shrink()
          else
            Positioned(
              bottom: (_navBarHeight - (widget.bottomScreenMargin ?? 0)).abs(),
              child: GestureDetector(
                onTap: () {
                  if (widget
                          .items[(widget.items.length / 2).floor()].onPressed !=
                      null) {
                    widget.items[(widget.items.length / 2).floor()]
                        .onPressed!(_contextList[_controller.index]);
                  } else {
                    _controller.index = (widget.items.length / 2).floor();
                  }
                },
                child: Center(
                  child: Container(
                    height: 21 +
                        min(
                            widget.navBarHeight,
                            max(
                                    widget.decoration.borderRadius?.topRight
                                            .y ??
                                        0,
                                    widget.decoration.borderRadius?.topLeft.y ??
                                        0) +
                                (widget.decoration.border != null
                                    ? widget
                                        .decoration.border!.dimensions.vertical
                                    : 0.0)),
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 2 -
                            (MediaQuery.of(context).size.width / 5.0 - 30.0) /
                                2),
                    width: MediaQuery.of(context).size.width / 5.0 - 30.0,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
        ],
      );
    } else {
      return _CustomTabView(
          routeAndNavigatorSettings: routeAndNavigatorSettings,
          builder: (final screenContext) {
            _contextList[index] = screenContext;
            if (_sendScreenContext) {
              _sendScreenContext = false;
              widget.selectedTabScreenContext?.call(_contextList[index]);
            }
            return Material(child: widget.screens[index]);
          });
    }
  }

  Widget navigationBarWidget() => _PersistentTabScaffold(
        controller: _controller,
        navBarHeightFactor: _navBarHeightFactor,
        itemCount:
            widget.items.isEmpty ? widget.itemCount : widget.items.length,
        bottomScreenMargin:
            _hideNavigationBar ? 0.0 : widget.bottomScreenMargin,
        stateManagement: widget.stateManagement,
        animationSettings: widget.animationSettings,
        hideNavBar: _hideNavigationBar,
        resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
        floatingActionWidget: widget.floatingActionButton,
        navBarPosition: widget.navBarPosition,
        confineToSafeArea: (widget.items.isNotEmpty &&
                    widget.items[_controller.index].opacity < 1.0) ||
                (!widget.isVisible && (_isCompleted ?? false))
            ? false
            : widget.margin.bottom > 0
                ? false
                : widget.confineToSafeArea,
        tabBar: _PersistentBottomNavBar(
          navBarEssentials: _NavBarEssentials(
            selectedIndex: _controller.index,
            previousIndex: _previousIndex,
            padding: widget.padding,
            navBarItemsAlignment: widget.navBarItemsAlignment,
            selectedScreenBuildContext: _contextList[_controller.index],
            itemAnimationProperties:
                widget.animationSettings.navBarItemAnimation,
            items: widget.items,
            backgroundColor: widget.backgroundColor,
            navBarHeight: _navBarHeight,
            onItemSelected: widget.onItemSelected != null
                ? (final index) {
                    if (_controller.index != _previousIndex) {
                      _previousIndex = _controller.index;
                    }

                    _controller.index = index;
                    widget.onItemSelected?.call(index);
                    if (_previousIndex == index) {
                      if (widget.items[_controller.index]
                              .scrollToTopOnNavBarItemPress &&
                          !Navigator.of(_contextList[_controller.index]!)
                              .canPop()) {
                        widget.items[_controller.index].scrollController
                            ?.animateTo(0,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease);
                      }
                      popAllScreens();
                    }
                  }
                : (final index) {
                    if (_controller.index != _previousIndex) {
                      _previousIndex = _controller.index;
                    }
                    _controller.index = index;

                    if (_previousIndex == index) {
                      if (widget.items[_controller.index]
                              .scrollToTopOnNavBarItemPress &&
                          !Navigator.of(_contextList[_controller.index]!)
                              .canPop()) {
                        widget.items[_controller.index].scrollController
                            ?.animateTo(0,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease);
                      }
                      popAllScreens();
                    }
                  },
          ),
          navBarHideAnimationController: _navBarHideAnimationController,
          isCustomWidget: widget.isCustomWidget,
          navBarDecoration: widget.decoration,
          margin: widget.margin,
          confineToSafeArea:
              widget.margin.bottom > 0 ? false : widget.confineToSafeArea,
          hideNavigationBar: _hideNavigationBar,
          navBarStyle: widget.navBarStyle,
          neumorphicProperties: widget.neumorphicProperties,
          customNavBarWidget: widget.customWidget,
          onAnimationComplete: (final isAnimating, final isCompleted) {
            if (_isAnimating != isAnimating) {
              setState(() {
                _isAnimating = isAnimating;
              });
            }
            if (_isCompleted != isCompleted) {
              setState(() {
                _isCompleted = isCompleted;
              });
            }
          },
        ),
        tabBuilder: (final context, final index) => _buildScreen(index),
      );

  @override
  Widget build(final BuildContext context) {
    _navBarHeight = widget.navBarHeight;
    _hideNavigationBar = !widget.isVisible ||
        (_hideNavigationAfterScrollDown &&
            widget.hideOnScrollSettings.hideNavBarOnScroll) ||
        (widget.hideNavigationBarWhenKeyboardAppears &&
            MediaQuery.of(widget.context).viewInsets.bottom > 0);
    if (_contextList.length !=
        (widget.items.isEmpty ? widget.itemCount : widget.items.length)) {
      _contextList = List<BuildContext?>.filled(
          widget.items.isEmpty ? widget.itemCount : widget.items.length, null);
    }

    if (widget.handleAndroidBackButtonPress || widget.onWillPop != null) {
      return WillPopScope(
        onWillPop: !widget.handleAndroidBackButtonPress &&
                widget.onWillPop != null
            ? () async {
                final result =
                    await widget.onWillPop!(_contextList[_controller.index]);
                return Future.value(result);
              }
            : widget.handleAndroidBackButtonPress && widget.onWillPop != null
                ? () async {
                    if (_controller.index == 0 &&
                        !Navigator.canPop(_contextList.first!)) {
                      return widget.onWillPop!(_contextList.first);
                    } else {
                      if (Navigator.canPop(_contextList[_controller.index]!)) {
                        Navigator.pop(_contextList[_controller.index]!);
                      } else {
                        widget.onItemSelected?.call(0);
                        _controller.index = 0;
                      }
                      return false;
                    }
                  }
                : () async {
                    if (_controller.index == 0 &&
                        !Navigator.canPop(_contextList.first!)) {
                      return true;
                    } else {
                      if (Navigator.canPop(_contextList[_controller.index]!)) {
                        Navigator.pop(_contextList[_controller.index]!);
                      } else {
                        widget.onItemSelected?.call(0);
                        _controller.index = 0;
                      }
                      return false;
                    }
                  },
        child: navigationBarWidget(),
      );
    } else {
      return navigationBarWidget();
    }
  }

  void popAllScreens() {
    if (widget.items[_controller.index].onSelectedTabPressWhenNoScreensPushed !=
            null &&
        !Navigator.of(_contextList[_controller.index]!).canPop()) {
      widget.items[_controller.index].onSelectedTabPressWhenNoScreensPushed!();
    }

    if (widget.popBehaviorOnSelectedNavBarItemPress == PopBehavior.once) {
      if (Navigator.of(_contextList[_controller.index]!).canPop()) {
        Navigator.of(_contextList[_controller.index]!).pop(context);
        return;
      }
    } else {
      Navigator.popUntil(
          _contextList[_controller.index]!,
          ModalRoute.withName(widget.isCustomWidget
              ? (widget.routeAndNavigatorSettings?.initialRoute ??
                  "/9f580fc5-c252-45d0-af25-9429992db112")
              : widget.items[_controller.index].routeAndNavigatorSettings
                      .initialRoute ??
                  "/9f580fc5-c252-45d0-af25-9429992db112"));
    }
  }
}

//asserts

bool assertMidButtonStyles(final NavBarStyle navBarStyle, final int itemCount) {
  if (navBarStyle == NavBarStyle.style15 ||
      navBarStyle == NavBarStyle.style16 ||
      navBarStyle == NavBarStyle.style17 ||
      navBarStyle == NavBarStyle.style18) {
    if (itemCount % 2 != 0) {
      return true;
    } else {
      return false;
    }
  }
  return true;
}