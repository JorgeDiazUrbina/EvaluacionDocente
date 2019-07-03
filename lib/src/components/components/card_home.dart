import 'package:evaluacion_docente/src/components/components/text_content.dart';
import 'package:evaluacion_docente/src/pages/login_school_page.dart';
import 'package:evaluacion_docente/src/pages/login_student_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeCardWidget extends StatelessWidget {
  final int user;
  final String title;
  final String description;
  final String footer;
  HomeCardWidget(this.user, this.title, this.description, this.footer);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: _cardContent(context, user, title, description, footer),
    );
  }
}

_cardContent(context, user, title, description, footer) {
  return Material(
    elevation: 0.0,
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    child: InkWell(
      onTap: () {
        if(user == 1){    
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginStudentPage()),
        ); 
        }else{
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginSchoolPage(user)),
        ); 
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          image: DecorationImage(
            image:AssetImage('assets/images/banner_shape.jpg'),
            fit: BoxFit.cover
          ),
        ),
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 7,
                child: Container(
                  padding: EdgeInsets.only(right: 5.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    child: TextContent(title, 20.0,
                                        TextAlign.start, Colors.white, true),
                                  )),
                              Container(
                                color: Colors.black,
                                height: 1.0,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  padding:
                                      EdgeInsets.only(right: 5.0, top: 10.0),
                                  child: TextContent(description, 18.0,
                                      TextAlign.start, Colors.white, false),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  height: 3.0,
                                  width: 30.0,
                                  color: Colors.white,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  margin: EdgeInsets.only(top:3.0),
                                  child: TextContent(footer, 13.0,
                                      TextAlign.end, Colors.white,true),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            Expanded(
              child: Container(
              child: Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 40.0,
                ),
              ),
             )
            ),
          ],
        ),
      ),
    ),
  );
}