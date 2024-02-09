import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

   User? user= FirebaseAuth.instance.currentUser;



AddToDB(String fname,String lname,String gender, height, weight, int day, int month, int year)async{
   DateTime dt =DateTime(year,month,day);
   DateTime currentDate=DateTime.now();
int years = currentDate.year - dt.year;
  int currentMonth = currentDate.month;
  int birthMonth = dt.month;
  int currentDay = currentDate.day;
  int birthDay = dt.day;

  // Check if the current date hasn't reached the dt yet
  if (currentMonth < birthMonth || (currentMonth == birthMonth && currentDay < birthDay)) {
    years--;
  }
int age= years;


  var BMR=calculateBMR(double.parse(height), double.parse(weight), gender);

var parentCollection = FirebaseFirestore.instance.collection("Users"); // Reference to the "Users" collection
var   userDocument = parentCollection.doc(user?.uid);
userDocument.set({}); // Reference to the document within the "Users" collection
var  personalInfoDocument = userDocument.collection("PersonalInformation").doc("infoData");
     personalInfoDocument.update(
  {

  "firstname": fname,
  "lastname": lname,
  "DOB": "$day-$month-$age",
  "BMR":BMR,
  "isRegistered":true,
  "height": double.parse(height),
  "weight": double.parse(weight),
  "gender": gender,
  "age":age

  }
);


}

double calculateBMR(double heightInInches, double weightInKg,String gender) {
  double bmr = 0.0;

  // Constants for Harris-Benedict equation
  double heightInCm = heightInInches * 2.54; // Convert inches to centimeters
  double weightInLbs = weightInKg * 2.20462; // Convert kg to lbs

  if (gender == "Male") {
    // For males
    bmr = 88.362 + (13.397 * weightInKg) + (4.799 * heightInCm) - (5.677 * 1); // '1' for male
  } else {
    // For females
    bmr = 447.593 + (9.247 * weightInKg) + (3.098 * heightInCm) - (4.330 * 0); // '0' for female
  }

  return bmr;
}


