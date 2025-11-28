import 'package:flutter/material.dart';

class AddRatingScreen extends StatefulWidget {
  const AddRatingScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddRatingScreenState();
  }
}

class _AddRatingScreenState extends State<AddRatingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '',
        ),
        
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 15.0,
          ),
          child: Column(
            children: [
              
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10),
                  Image.asset(
                    'assets/images/movie1.png',
                    height: 172,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: 30),
                  Text(
                    "Mango",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(width: 10),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 60),
                  Text(
                    "Rate",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(width: 30),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      // color: Colors.grey[200],
                      gradient: LinearGradient(
                        colors: [
                          Color(0x00FFFFFF).withOpacity(0.4),
                          Color(0x00FFFFFF).withOpacity(0.2),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    width: 140,
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: "Your Rating",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(width: 60),
                ],
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  // color: Colors.grey[200],
                  gradient: LinearGradient(
                        colors: [
                          Color(0x00FFFFFF).withOpacity(0.4),
                          Color(0x00FFFFFF).withOpacity(0.2),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                  borderRadius: BorderRadius.circular(30),
                ),
                //width: 140,
                height: 350,
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: 3,
                  decoration: InputDecoration(
                    hintText: "Write down your review...",
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 30,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Publish",
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium!.copyWith(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
