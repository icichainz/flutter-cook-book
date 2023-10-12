import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

@immutable
class PhysicsCardDragDemo extends StatelessWidget {
  const PhysicsCardDragDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Physics simulation animation"),),body: const DraggableCard(child:FlutterLogo(size: 128,)),);
  }
}


class DraggableCard extends StatefulWidget {
  final Widget child ;
  const DraggableCard({super.key, required this.child});

  @override
  State<DraggableCard> createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard> with SingleTickerProviderStateMixin {

 // the controller will be used to handle the animation state.
 late AnimationController _controller ;
 // add alignment feature to the app.
 Alignment _drageAlignment =  Alignment.center ;

 // animator of the widget
 late Animation<Alignment> _animation ;

// calculate and run a [SpringSimulation]
 void _runAnimation(Offset pixelsPerSecond,Size size){

 _animation = _controller.drive(
  AlignmentTween(
    begin: _drageAlignment,
    end: Alignment.center
  )
 );
 // Calculate the velocity relative to the unit interval.
 final unitsPerSecondX = pixelsPerSecond.dx / size.width ;
 final unitsPerSecondY = pixelsPerSecond.dy / size.height ;
 final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
 final unitVelocity = unitsPerSecond.distance ;
 const spring = SpringDescription(mass: 30, stiffness: 1, damping: 1) ;
 final  simulation = SpringSimulation(spring, 0, 1, -unitVelocity);

// Add the spring simulation to the controller.
 _controller.animateWith(simulation) ;
 }

  @override
  void initState() {
    
    super.initState();
    _controller = AnimationController(vsync: this,duration: const Duration(seconds: 1));
    _controller.addListener(() { 
      setState(() {
        _drageAlignment =_animation.value ;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size ;
    return GestureDetector(onPanDown: (details){
      // stop the controller when the pan is down.
      _controller.stop();
    },
    // re-calculate the deplacement when the drag change.
    onPanUpdate: (details){
      setState(() {
        _drageAlignment += Alignment(details.delta.dx / (size.width/2), details.delta.dy / (size.height/2)) ;
      });
    },onPanEnd: (details){
      // execute the animation when the end of the drag is achieved.
      _runAnimation(details.velocity.pixelsPerSecond,size);
    },child: Align(alignment: _drageAlignment,child: Card(child: widget.child),));
  }
}