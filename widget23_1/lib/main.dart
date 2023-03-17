 import 'package:flutter/material.dart';
 import 'package:widget23_1/neon_button.dart';
 import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Flutter Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}
enum ButtonState { init, loading, done}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading =false;
  ButtonState state = ButtonState.init;
  @override
  Widget build(BuildContext context) {
  final width =MediaQuery.of(context).size.width;
  final isDone= state == ButtonState.done;
  //bool isStretched = isAnimating || state == ButtonState.init;

    // ? LoadingPage():
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 24),
                minimumSize: const Size.fromHeight(60),
                shape: const StadiumBorder(),
              ),
              onPressed: () async {
              setState(() {
                isLoading = true;
              });
              await Future.delayed(const Duration(seconds: 3));
              setState(() {
                isLoading =false;
              });

            }, child: isLoading
            ? Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(color: Colors.white),
                SizedBox(width: 24),
                Text('Plase Wait...')
              ],
            )
            //? const CircularProgressIndicator(color: Colors.white)
            : const 
            Text('Login')),
            NeonButton(Colors.red),
            NeonButton(Colors.greenAccent.shade700),
            NeonButton(Colors.blueAccent.shade700),
            NeonButton(Colors.yellowAccent.shade700),
            NeonButton(Colors.red),
            NeonButton(Colors.red),
          ],
        ),
         
      )
      
    );
  }
  }




//stl
class LoadingPage extends StatelessWidget {
   
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Center(
      child: SpinKitCircle(
              size: 140,
              itemBuilder: ((context, index) {
                final colors = [Colors.green, Colors.red, Colors.yellow];
                final color = colors[index % colors.length];
                return DecoratedBox
                (decoration: BoxDecoration(color: color, shape: BoxShape.circle));
              }),
            ) ,
    );
  }
}