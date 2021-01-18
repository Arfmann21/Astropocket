import 'package:astropocket/ui/screens/drawer/drawer.dart';
import 'package:flutter/material.dart';

class SlidingDrawerMain extends StatefulWidget {
    final Widget child;

  const SlidingDrawerMain({Key key, @required this.child}) : super(key: key);

  static SlidingDrawerMainState of(BuildContext context) =>
      context.findAncestorStateOfType<SlidingDrawerMainState>();

  @override
  SlidingDrawerMainState createState() => SlidingDrawerMainState();
}

class SlidingDrawerMainState extends State<SlidingDrawerMain> with SingleTickerProviderStateMixin {

  static const Duration toggleDuration = Duration(milliseconds: 150);
  static const double maxSlide = 225;
  static const double minDragStartEdge = 60;
  static const double maxDragStartEdge = maxSlide - 16;
  AnimationController _animationController;
  bool _canBeDragged = false;

  @override
  void initState() { 
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: SlidingDrawerMainState.toggleDuration,
    );
  }

  void close() => _animationController.reverse();

  void open() => _animationController.forward();

  void toggleDrawer() => _animationController.isCompleted ? close() : open();


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_animationController.isCompleted) {
          close();
          return false;
        }
        return true;
      },
          child: GestureDetector(
        onHorizontalDragStart:  _onDragStart,
        onHorizontalDragUpdate: _onDragUpdate,
        onHorizontalDragEnd: _onDragEnd,
            child: AnimatedBuilder(
              child: widget.child,
          animation: _animationController,
          builder: (context, _) {
             double animValue = _animationController.value;
            final slideAmount = maxSlide * animValue;
            final contentScale = 1.0 - (0.3 * animValue);
            return Stack(
              children: [
              DrawerHome(),
              Transform(
                transform: Matrix4.identity()
                ..translate(slideAmount)
                ..scale(contentScale, contentScale),
                alignment: Alignment.centerLeft,
                child: widget.child
                )
            ],
            );
          },
        ),
      ),
    );
  }

  void _onDragStart(DragStartDetails details) {
    bool isDragOpenFromLeft = _animationController.isDismissed && details.globalPosition.dx < minDragStartEdge;
    bool isDragCloseFromRight = _animationController.isCompleted && details.globalPosition.dx > maxDragStartEdge;

    _canBeDragged = isDragOpenFromLeft || isDragCloseFromRight;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if(_canBeDragged){
      double delta = details.primaryDelta / maxSlide;
      _animationController.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    if(_animationController.isDismissed || _animationController.isCompleted)
    return ;

    if(details.velocity.pixelsPerSecond.dx.abs() >=  365.0)  {
      double visualVelocity = details.velocity.pixelsPerSecond.dx / MediaQuery.of(context).size.width;

      _animationController.fling(velocity: visualVelocity);
    } else if (_animationController.value < 0.5) {
      close();
    } else open();
  }
}