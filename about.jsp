<!DOCTYPE html>
<html lang="en">
<head>
    <!--<meta charset="UTF-8">-->
    <!--<meta name="viewport" content="width=device-width, initial-scale=1">-->
    <title>About Blood Bank</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: url('BloodLab.png') no-repeat center center/cover;
            width: 100%;
            height: 1800px;
            /*background-size: cover;*/
            font-family: 'Arial', sans-serif;
            color: white;
            margin: 0;
            padding: 0;
        }
        .overlay {
            background: rgba(0, 0, 0, 0.7);
            color: white;
            padding: 40px 40px;
            border-radius: 15px;
            max-width: 950px;
            margin-top: 1000px;
            width: 100%;
            text-align: left;
        }
        #div {
            margin-top: 100px;
            margin-bottom: 100px;
        }
        h1 {
            font-size: 2.8rem;
            font-weight: bold;
            color: #f44336;
            margin-bottom: 20px;
        }
        h2 {
            font-size: 2rem;
            font-weight: bold;
            color: #f44336;
            margin-top: 20px;
        }
        p {
            font-size: 1.2rem;
            line-height: 1.8;
            margin-top: 10px;
        }
        .btn-custom {
            background-color: #f44336;
            color: white;
            border-radius: 30px;
            padding: 12px 30px;
            font-size: 1.2rem;
            margin-top: 25px;
            transition: background-color 0.3s ease, transform 0.3s ease;
            text-decoration: none;
        }
        .btn-custom:hover {
            background-color: #d32f2f;
            transform: translateY(-3px);
        }
        hr {
            border-top: 1px solid #f44336;
            margin: 30px 0;
        }
        .container-fluid {
            height: 100vh;
        }
        .text-center {
            text-align: center;
        }
        .text-left {
            text-align: left;
        }
    </style>
</head>
<body>
    <div class="container-fluid text-center vh-100 d-flex align-items-center justify-content-center" id="div">
        <div class="overlay">
            <h1>About Our Blood Bank</h1>
            <p>Our Blood Bank Management System (BBMS) is more than just a platform?it is a critical lifeline for individuals in need of life-saving blood. As blood donation is a voluntary act, our platform strives to provide an easy, safe, and secure system for both donors and recipients. We aim to streamline the process of blood donation, ensuring that donors' efforts are maximized and patients receive the timely care they deserve. With a robust and user-friendly interface, BBMS ensures that no one goes without the blood they need during emergencies.</p>
            <hr>
            
            <h2>Our Mission</h2>
            <p>Our mission is clear: to provide a reliable and accessible blood banking system that connects donors with hospitals and patients in need. We aim to facilitate a seamless donation process by using technology that not only simplifies the act of donating but also ensures the efficiency of blood distribution. Through BBMS, we plan to create a network that is always prepared, ensuring that every patient, regardless of location, has access to life-saving blood in their time of need. We are committed to making blood donation a part of every persons life, contributing to a healthier, stronger community.</p>
            <hr>
            
            <h2>Our Vision</h2>
            <p>We envision a future where no patient suffers due to a lack of blood. In this future, technology plays a key role in ensuring that blood is always available in the right place at the right time. We are determined to leverage digital platforms to optimize blood storage, tracking, and distribution. Our ultimate goal is to eliminate the barriers that exist between donors and those in need, thereby reducing waiting times, increasing the safety of donated blood, and creating a healthier society. Through our vision, we strive to make blood donation a routine, safe, and integral part of healthcare worldwide.</p>
            <hr>
            
            <h2>How It Works?</h2>
            <p>Our system is designed to be simple yet powerful, enabling both donors and hospitals to connect quickly and efficiently. Here?s how it works:</p>
            <ul>
                <li><strong>Step 1:</strong> Donors can register with our platform and schedule their donation appointment based on their availability.</li>
                <li><strong>Step 2:</strong> Blood banks will update the system with the available blood types and quantities in real-time.</li>
                <li><strong>Step 3:</strong> Hospitals or patients in need of blood will send requests, and our system will match the request with available donors.</li>
                <li><strong>Step 4:</strong> Once the donation is confirmed, the blood is safely transported to the hospital, ensuring timely delivery.</li>
            </ul>
            <p>We maintain real-time tracking and notifications to keep everyone informed, from the donors to the hospitals, ensuring a smooth and reliable process every time.</p>
            <hr>
            
            <h2>Why Choose BBMS?</h2>
            <p>Choosing BBMS means selecting a platform that values both safety and efficiency. Here?s why you should choose us:</p>
            <ul>
                <li><strong>Easy to Use:</strong> Our platform is designed to be user-friendly and intuitive for both donors and hospitals.</li>
                <li><strong>Real-time Updates:</strong> Stay informed with up-to-the-minute updates about blood availability and donation status.</li>
                <li><strong>Secure & Reliable:</strong> We prioritize the security of your personal information and the safe handling of donated blood.</li>
                <li><strong>Wide Network:</strong> Our extensive network of blood banks, hospitals, and donors ensures that no one goes without blood when they need it most.</li>
            </ul>
            <a href="DonorLogin.jsp" class="btn btn-custom">Donate Now</a>
            <a href="donorRegister.jsp" class="btn btn-custom">Register Now</a>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
