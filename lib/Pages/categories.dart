import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,      // finalise the no. of columns in each row
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,   // spacing between the columns
          mainAxisSpacing: 20     // spacing between two row 
        ),
       children: const [
          Text('1',style: TextStyle(color: Colors.white),),
          Text('2',style: TextStyle(color: Colors.white),),
          Text('3',style: TextStyle(color: Colors.white),),
          Text('4',style: TextStyle(color: Colors.white),),
          Text('5',style: TextStyle(color: Colors.white),),
          Text('6',style: TextStyle(color: Colors.white),),
          Text('7',style: TextStyle(color: Colors.white),),
       ],
      ),
    );
  }
}