<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Our Services</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    .container {
        width: 80%;
        margin: 40px auto;
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        grid-gap: 15px;
        justify-items: center;
    }
    .service-box {
        width: 280px;
        height: 300px;
        background-color: white;
        padding: 10px;
        box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.15);
        border-radius: 10px;
        text-align: center;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: space-between;
    }
    .service-box img {
        width: 150px;
        height: 150px;
        object-fit: cover;
        border-radius: 10px;
    }
    .service-box h2 {
        color: #b22222;
        font-size: 18px;
        margin: 8px 0;
    }
    .service-box p {
        font-size: 14px;
        color: #333;
        text-align: justify;
        margin: 4px 0;
        padding: 0 8px;
    }
    .service-box a {
        color: #b22222;
        font-weight: bold;
        text-decoration: none;
        margin-top: 5px;
    }
    .service-box a:hover {
        text-decoration: underline;
    }
    .bottom-boxes {
        margin-bottom: 70px;
        grid-column: span 3;
        display: flex;
        justify-content: center;
        gap: 15px;
    }
    @media (max-width: 900px) {
        .container {
            grid-template-columns: 1fr 1fr;
        }
        .bottom-boxes {
            grid-column: span 2;
        }
    }
    @media (max-width: 600px) {
        .container {
            grid-template-columns: 1fr;
        }
        .bottom-boxes {
            grid-column: span 1;
            flex-direction: column;
            align-items: center;
        }
    }
</style>
</head>
<body>
    <center><h1 style="color:#b22222;">Our Services</h1></center>
    <div class="container">
        <div class="service-box">
            <img src="picture.png" alt="Donate Blood">
            <h2>Blood Donation Registration</h2>
            <p>Register today and save lives by donating blood. One donation can help multiple people in need.</p>
            <a href="donorRegister.jsp">Register Now</a>
        </div>
        <div class="service-box">
            <img src="imagee.png" alt="Request Blood">
            <h2>Blood Request Management</h2>
            <p>Need blood urgently? Request blood easily and find donors nearby through our efficient system.</p>
            <a href="needblood.jsp">Request Blood</a>
        </div>
        <div class="service-box">
            <img src="camps.png" alt="Blood Camps">
            <h2>Upcoming Blood Camps</h2>
            <p>Join upcoming blood camps and contribute to a healthier community. Find a camp near you.</p>
            <a href="ViewCampsServlet">View Camp</a>
        </div>
    </div>
    <div class="bottom-boxes">
        <div class="service-box">
            <img src="storage.png" alt="Blood Storage">
            <h2>Blood Storage</h2>
            <p>We ensure safe and efficient blood storage, keeping donated blood fresh and ready for those in need.</p>
        </div>
        <div class="service-box">
            <img src="health.png" alt="Health Benefits">
            <h2>Health Benefits</h2>
            <p>Donating blood not only helps save lives but also improves your own health by reducing harmful iron levels and stimulating new blood cell production.</p>
            <a href="aboutdonation.jsp">Learn More</a>
        </div>
    </div>
</body>
</html>
