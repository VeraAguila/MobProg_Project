import 'package:flutter/material.dart';
import 'package:puso_malaya/model/base_app_movie.dart';
import 'package:puso_malaya/model/base_app_user.dart';
import 'package:puso_malaya/service/review_service.dart';

class AddRatingScreen extends StatefulWidget {
  const AddRatingScreen({super.key, required this.currentUser,required this.item});

  final BaseAppMovie item;
  final BaseAppUser currentUser;

  @override
  State<StatefulWidget> createState() {
    return _AddRatingScreenState();
  }
}

class _AddRatingScreenState extends State<AddRatingScreen> {
  final rateService = ReviewService();
  final formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  var enteredRating = '';
  var enteredreview = '';
  var isSending = false;

  void addReview() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isSending = true;
      });

      formKey.currentState!.save();

      final newReview = await rateService.addreview(
        context: context,
        userId: widget.currentUser.SK,
        movieId: widget.item.SK,
        rating: enteredRating,
        content: enteredreview,
      );

      // var newUser = 'ewa';
      setState(() {
        isSending = false;
        Navigator.pop(context);
      });

    }
  }
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
          child: Form(
            key: formKey,
            child: Column(
              children: [
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 10),
                    Image.network(
                      widget.item.s3Image!,
                      height: 172,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 30),
                    SizedBox(
                      width: 210,
                      child: Text(
                        widget.item.title,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 22
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter your rating';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          enteredRating = value!;
                        },
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your review';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      enteredreview = value!;
                    },
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
                      onPressed: addReview,
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
      ),
    );
  }
}
