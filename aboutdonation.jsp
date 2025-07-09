<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Blood Donation</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: url('donate.jpg') no-repeat center center/cover;
            color: white;
        }
        .overlay {
            background: rgba(0, 0, 0, 0.6);
            padding: 50px;
            border-radius: 10px;
        }
        .guidelines {
            background: rgba(255, 255, 255, 0.9);
            color: black;
            padding: 20px;
            border-radius: 10px;
            margin-top: 20px;
        }
        .btn-custom {
            background: red;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            display: inline-block;
            margin: 10px;
        }
        .btn-custom:hover {
            background: darkred;
        }

    </style>
</head>
<body>

<div class="container text-center mt-5">
    <div class="overlay">
        <h2 class="display-4">Why Donate Blood</h2>
        <hr>
        <div class="text-start">
            <p> The most precious gift that one can give to another person is the gift of life i.e. blood. It is the essence of life.</p>
            <p> Your blood saves more than one life when it is separated into its components (red blood cells, plasma, etc.).</p>
            <p> Blood is needed regularly for patients with diseases such as thalassemia and hemophilia, and also for treating injuries after an accident, major surgeries, anemia, etc.</p>
            <p> It improves your health.</p>
        </div>
        <a href="DonorLogin.jsp" class="btn-custom">Donate Now</a>
        <a href="donorRegister.jsp" class="btn-custom">Register Now</a>
    </div>
        
      <!-- Facts About Blood Section -->
<div class="overlay mt-4">
    <h2 class="display-5">Facts About Blood</h2>
    <hr>
    <div class="text-start">
        <p> One unit of donated blood can save up to three lives.</p>
        <p> You can donate blood every three months. It only takes 48 hours for your body fluids to be completely replenished.</p>
        <p> Scientists have estimated the volume of blood in the human body to be eight percent of body weight.</p>
        <p> There are 100,000 miles of blood vessels in an adult human body.</p>
        <p> A red blood cell can make a complete circuit of your body in 30 seconds.</p>
        <p> White blood cells make up about 1% of your blood.</p>
    </div>
    <a href="DonorLogin.jsp" class="btn-custom">Donate Now</a>
    <a href="donorRegister.jsp" class="btn-custom">Register Now</a>
</div>
    
  
    

    <!-- Donation Guidelines Section -->
<div class="overlay mt-4">
        <h2 class="display-5">Donation Guidelines</h2>
        <hr>
        <div class="text-start" style="width: 50%">
            <p>Donors must be between 18-65 years of age and weigh at least 50 kg.</p>
            <p>Ensure you have had a good meal and are well-hydrated before donating.</p>
            <p>Avoid alcohol and smoking at least 24 hours before donation.</p>
            <p>Ensure you have not donated blood in the past 3 months (for males) or 4 months (for females).</p>
            <p>If you are on medication, consult the donation center before proceeding.</p>
            <p>People with chronic illnesses such as diabetes and hypertension should seek medical advice before donating.</p>
            <p>After donation, rest for a few minutes and drink fluids to replenish your energy.</p>
        </div>
        <div class="bloodtypes" style="width: 50%; margin-left: 500px; margin-top: -380px;">
            <img src="bloodtypes.png" style="height: 400px; width: 400px; border-radius: 5px;">
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
