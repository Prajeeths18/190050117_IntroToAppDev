import 'package:flutter/material.dart';

bool isDigit(String s, int idx) {
  return s[idx] == "0" ||
      s[idx] == "1" ||
      s[idx] == "2" ||
      s[idx] == "3" ||
      s[idx] == "4" ||
      s[idx] == "5" ||
      s[idx] == "6" ||
      s[idx] == "7" ||
      s[idx] == "8" ||
      s[idx] == "9";
}

void main() {
  runApp(MaterialApp(home: CalculatorApp()));
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String display = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Container(
              color: Colors.black,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text("$display",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.w400)),
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: OutlinedButton(
                      child: Text(
                        "AC",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 40,
                            fontWeight: FontWeight.w400),
                      ),
                      onPressed: () {
                        setState(() {
                          display = "";
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                      ),
                    ),
                  ),
                  Expanded(
                    child: OutlinedButton(
                      child: Text(
                        "+/-",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 40,
                            fontWeight: FontWeight.w400),
                      ),
                      onPressed: () {
                        setState(() {
                          if (display.length > 0) {
                            if (display[0] == '-') {
                              display = display.substring(1, display.length);
                            } else {
                              display = '-' + display;
                            }
                          }
                        });
                      },
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.grey[300]),
                    ),
                  ),
                  Expanded(
                    child: OutlinedButton(
                      child: Icon(
                        Icons.backspace_rounded,
                        size: 40,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          if (display.length > 1) {
                            display = display.substring(0, display.length - 1);
                          } else if (display.length <= 1) {
                            display = "";
                          }
                        });
                      },
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.grey[300]),
                    ),
                  ),
                  Expanded(
                    child: OutlinedButton(
                      child: Text(
                        "/",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w400),
                      ),
                      onPressed: () {
                        setState(() {
                          display += '/';
                        });
                      },
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.orange[400]),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: OutlinedButton(
                    child: Text(
                      "7",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w400),
                    ),
                    onPressed: () {
                      setState(() {
                        display += '7';
                      });
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.black54),
                  ),
                ),
                Expanded(
                  child: OutlinedButton(
                    child: Text(
                      "8",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w400),
                    ),
                    onPressed: () {
                      setState(() {
                        display += '8';
                      });
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.black54),
                  ),
                ),
                Expanded(
                  child: OutlinedButton(
                    child: Text(
                      "9",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w400),
                    ),
                    onPressed: () {
                      setState(() {
                        display += '9';
                      });
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.black54),
                  ),
                ),
                Expanded(
                  child: OutlinedButton(
                    child: Text(
                      "x",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w400),
                    ),
                    onPressed: () {
                      setState(() {
                        display += 'x';
                      });
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.orange[400]),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: OutlinedButton(
                    child: Text(
                      "4",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w400),
                    ),
                    onPressed: () {
                      setState(() {
                        display += '4';
                      });
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.black54),
                  ),
                ),
                Expanded(
                  child: OutlinedButton(
                    child: Text(
                      "5",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w400),
                    ),
                    onPressed: () {
                      setState(() {
                        display += '5';
                      });
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.black54),
                  ),
                ),
                Expanded(
                  child: OutlinedButton(
                    child: Text(
                      "6",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w400),
                    ),
                    onPressed: () {
                      setState(() {
                        display += '6';
                      });
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.black54),
                  ),
                ),
                Expanded(
                  child: OutlinedButton(
                    child: Text(
                      "-",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w400),
                    ),
                    onPressed: () {
                      display += '-';
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.orange[400]),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: OutlinedButton(
                    child: Text(
                      "1",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w400),
                    ),
                    onPressed: () {
                      setState(() {
                        display += '1';
                      });
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.black54),
                  ),
                ),
                Expanded(
                  child: OutlinedButton(
                    child: Text(
                      "2",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w400),
                    ),
                    onPressed: () {
                      setState(() {
                        display += '2';
                      });
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.black54),
                  ),
                ),
                Expanded(
                  child: OutlinedButton(
                    child: Text(
                      "3",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w400),
                    ),
                    onPressed: () {
                      setState(() {
                        display += '3';
                      });
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.black54),
                  ),
                ),
                Expanded(
                  child: OutlinedButton(
                    child: Text(
                      "+",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w400),
                    ),
                    onPressed: () {
                      setState(() {
                        display += '+';
                      });
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.orange[400]),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 2,
                  child: OutlinedButton(
                    child: Text(
                      "0",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w400),
                    ),
                    onPressed: () {
                      setState(() {
                        display += '0';
                      });
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.black54),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: OutlinedButton(
                    child: Text(
                      ".",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w400),
                    ),
                    onPressed: () {
                      setState(() {
                        display += '.';
                      });
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.black54),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: OutlinedButton(
                    child: Text(
                      "=",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w400),
                    ),
                    onPressed: () {
                      if (display.length == 0) {
                        return;
                      }
                      setState(() {
                        var num1 = 0.0, num2 = 0.0;
                        var pos = 0;
                        String s1 = "";
                        var ok = 0;
                        if (display[0] == '-') {
                          ok = 1;
                          pos = 1;
                        }
                        if (display[0] == '+') {
                          pos = 1;
                        }
                        while (pos < display.length &&
                            (isDigit(display, pos) || display[pos] == '.')) {
                          s1 += display[pos];
                          pos++;
                        }
                        dynamic result = 0;
                        if (pos != display.length) {
                          var op = display[pos];
                          ++pos;
                          num1 = double.parse(s1);
                          if (ok == 1) {
                            num1 *= -1;
                          }
                          String sub = display.substring(pos, display.length);
                          num2 = double.parse(sub);
                          if (op == '+') {
                            result = num1 + num2;
                          } else if (op == '-') {
                            result = num1 - num2;
                          } else if (op == 'x') {
                            result = num1 * num2;
                          } else if (op == '/') {
                            result = num1 / num2;
                          }
                          if (result.toInt() == result) {
                            result = result.toInt();
                          }
                          display = result.toString();
                        } else {
                          display = "INVALID";
                        }
                      });
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.orange[400]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

// // StatelessWidget -> cannot change the state after initialization
// class Home extends StatelessWidget {
//   // const Home({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("My First App!"),
//         centerTitle: true,
//         backgroundColor: Colors.red,
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(flex: 2, child: Image.asset("assets/pic1.jpeg")),
//           Expanded(
//             flex: 3,
//             child: Container(
//                 padding: EdgeInsets.all(30),
//                 color: Colors.cyan,
//                 child: Text("1")),
//           ),
//           Expanded(
//             flex: 2,
//             child: Container(
//                 padding: EdgeInsets.all(30),
//                 color: Colors.pinkAccent,
//                 child: Text("2")),
//           ),
//           Expanded(
//             flex: 1,
//             child: Container(
//                 padding: EdgeInsets.all(30),
//                 color: Colors.amber,
//                 child: Text("3")),
//           )
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Text("click"),
//         onPressed: () => {},
//         backgroundColor: Colors.red[600],
//       ),
//     );
//   }
// }
