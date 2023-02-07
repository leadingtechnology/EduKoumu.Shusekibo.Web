import 'package:flutter/material.dart';

class NavBarItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final Function touched;
  final bool active;
  final String menuId;
  final int menuNo;
  NavBarItem({
    required this.icon,
    required this.title,
    required this.touched,
    required this.active,
    required this.menuId,
    required this.menuNo,
  });
  @override
  _NavBarItemState createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {widget.touched();},
        splashColor: Colors.white,
        hoverColor: Colors.white12,
        child: Container(
          //color: Colors.red,
          padding: const EdgeInsets.symmetric(vertical: 3.0),
          child: Row(
            children: [
              Container(
                //color: Colors.blue,
                height: 60.0,
                width: 80.0,
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 175),
                      height: 35.0,
                      width: 5.0,
                      decoration: BoxDecoration(
                        color: widget.active ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Icon(
                              widget.icon,
                              color: widget.active ? Colors.white : Colors.white54,
                              size: 20.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              '${widget.title}', 
                              style: TextStyle(
                                color: widget.active ? Colors.white : Colors.white54,
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,  
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
