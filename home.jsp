<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head> 
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blood Bank - Home</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function(){
            $(".nav-link").click(function(e){
                e.preventDefault();
                var target = $(this).attr("href");
                $("html, body").animate({
                    scrollTop: $(target).offset().top
                }, 1000);
            });
        });
        
            document.addEventListener("DOMContentLoaded", function() {
        var inputs = document.querySelectorAll(".form-group input, .form-group textarea");

        inputs.forEach(function(input) {
            input.addEventListener("focus", function() {
                this.nextElementSibling.classList.add("active");
            });

            input.addEventListener("blur", function() {
                if (this.value === "") {
                    this.nextElementSibling.classList.remove("active");
                }
            });
        });
    });
    </script>
    <style>
        * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}
        #btn{
            background: #b30000; 
            color: white;
            padding: 10px;
            border: none;
            width: 20%;
            cursor: pointer;
            border-radius: 5px;
            font-size: 16px;
        }
        .form-floating label {
        transition: all 0.3s ease-in-out;
        color: gray;
    }
    
    .form-floating input:focus + label, 
    .form-floating textarea:focus + label {
        color: #b30000; /* Slightly dark red */
    }
    
    .form-group {
        position: relative;
        margin-top: 30px;
    }

    .form-group input, .form-group textarea {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        outline: none;
        font-size: 16px;
    }

    .form-group label {
        position: absolute;
        left: 10px;
        top: 50%;
        transform: translateY(-50%);
        transition: 0.3s ease-in-out;
        color: gray;
        font-size: 16px;
        pointer-events: none;
        background: white;
        padding: 0 5px;
    }

    .form-group input:focus + label,
    .form-group textarea:focus + label,
    .form-group input:not(:placeholder-shown) + label,
    .form-group textarea:not(:placeholder-shown) + label {
        top: -10px;
        font-size: 14px;
        color: #b30000; /* Dark Red */
        background-color:  transparent;
    }
     #AdminBtn {
         background: white;
        width: 120px;
        height: 50px;
        margin-left: 900px;
        margin-top: -115px;
        box-shadow: 0px 0px 10px 2px rgba(0, 0, 0, 0.5);
        font-size: 20px;
        color: red;
        font-weight: bold;
        border: none;
        padding: 10px;
        border-radius: 10px;
        cursor: pointer;
        transition: all 0.3s ease-in-out;
    }

    /* Hover Effect */
    #AdminBtn:hover {
        color: black;
        box-shadow: 0px 0px 15px 4px rgba(255, 0, 0, 0.7);
        /*transform: scale(1.1);*/
    }
    .div{
        height: 700px; width: 100%;
        background: url('Bimage.png') no-repeat center center;
            background-size: cover;
    }

    </style>
</head>
<body>
    <div class="div">
        
        <div class="header">
            <img src="homelogo.png" style="width: 80px; height: 80px; border-radius: 80px; margin-right: 650px; margin-top: 10px;">
            <h1 style="margin-top:-60px; margin-left: 80px;"><b>SHANU BLOOD BANK SYSTEM</b></h1>
            <form action="AdminButton" method="get">
                <button id="AdminBtn" type="submit" class="btn">Admin</button>
            </form>
        </div>
        
        
        <div class="navbar">
            <ul>
                <li><a href="#home">Home</a></li>
                <li><a href="#donors">Donors</a></li>
                <li><a href="services.jsp">Services</a></li>
                <li><a href="donorRegister.jsp">Donate Blood</a></li>
                <li><a href="needblood.jsp">Need Blood</a></li>
                <li><a href="ViewCampsServlet">Donation Camps</a>
                <li><a href="about.jsp">About Us</a></li>
                <li><a href="#contact">Contact Us</a></li>
            </ul>
        </div>
        <div id="home" class="main-content"  style="margin-top: 70px;font-family: times new roman;text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);">
            <h1>"Saving a life is the most beautiful act of humanity."</h1>
            <h3>Be a blood donor, be a lifesaver.</h3>
        </div>
    </div>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-4">
                <div class="card text-center shadow p-3 border border-danger">
                    <img src="drop.jpg" class="mx-auto mt-2" alt="Donate Blood" style="width: 60px;">
                    <h5 class="text-danger mt-3">Why Donate Blood?</h5>
                    <p>Donating blood can save up to 3 lives. Your small act can make a big impact.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-center shadow p-3 border border-danger">
                    <img src="calendar.png" class="mx-auto mt-2" alt="Next Camp" style="width: 60px;">
                    <h5 class="text-danger mt-3">Upcoming Blood Camps</h5>
                    <p>Join our next blood donation camp and be a part of this life-saving movement.</p>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card text-center shadow p-3 border border-danger">
                    <img src="drop.jpg" class="mx-auto mt-2" alt="Volunteer" style="width: 60px;">
                    <h5 class="text-danger mt-3">Become a Volunteer</h5>
                    <p>Join us in spreading awareness and organizing donation drives.</p>
                </div>
            </div>
        <div class="row mt-4">
            <div class="col-md-4">
                <div class="card text-center shadow p-3 border border-danger">
                    <img src="heartbeat.jpg" class="mx-auto mt-2" alt="Health Benefits" style="width: 60px;">
                    <h5 class="text-danger mt-3">Health Benefits</h5>
                    <p>Regular blood donation improves heart health and reduces harmful iron levels.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-center shadow p-3 border border-danger">
                    <img src="drop.jpg" class="mx-auto mt-2" alt="Blood Types" style="width: 60px;">
                    <h5 class="text-danger mt-3">Understanding Blood Types</h5>
                    <p>Know your blood group and how you can help those in need.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-center shadow p-3 border border-danger">
                    <img src="checklist.jpg" class="mx-auto mt-2" alt="Eligibility" style="width: 60px;">
                    <h5 class="text-danger mt-3">Who Can Donate?</h5>
                    <p>Healthy individuals aged 18-65 can donate blood every 3 months.</p>
                </div>
            </div>
        </div>
        </div>
    </div>
    <!-- Donors Section -->
    <div id="donors" class="container mt-5">
        <h2 class="text-center text-danger">Our Donors</h2>
        <div class="row">
            <%
                String[][] donors = {
                    {"Shamsh Kadir", "25", "A+", "7380620353", "Male", "virar","shamsh@gmail.com"},
                    {"Numra Sayyed", "30", "O-", "7544566567", "Female", "Naigaon","numra12@gmail.com"},
                    {"Mohd. Naseem", "28", "B+", "8956442267", "Male", "Nallasopara","naseem55@gmail.com"},
                    {"Anoli Patil", "22", "AB+", "7412589630", "Female", "vasai","anolii99@gmail.com"},
                    {"Raj Singh", "35", "O+", "9886623454", "Male", "virar","rajs@gmail.com"},
                    {"Riya Gupta", "27", "A-", "9899234345", "Female", "Nallasopara","riyaaa@gmail.com"},
                    {"Rocky Yadav", "29", "B-", "8529637410", "Male", "Bhayandar","rockyyadav@gmail.com"},
                    {"Shenaya sawant", "26", "AB-", "9517536248", "Female", "Mumbra","shenayas@gmail.com"}
                };

                for(int i = 0; i < donors.length; i++) {
            %>
            <div class="col-md-3 mt-3">
                <div class="card text-center shadow-sm">
                    <!--<img src="donor1.jpg" class="card-img-top rounded-circle mx-auto mt-3" alt="Donor Photo" style="width: 80px; height: 80px;">-->
                    <div class="card-body">
                        <h5 class="card-title"><%= donors[i][0] %></h5>
                        <p class="card-text">
                            <strong>Age:</strong> <%= donors[i][1] %> <br>
                            <strong>Blood Group:</strong> <%= donors[i][2] %> <br>
                            <strong>Mobile:</strong> <%= donors[i][3] %> <br>
                            <strong>Gender:</strong> <%= donors[i][4] %> <br>
                            <strong>Address:</strong> <%= donors[i][5] %> <br>
                            <strong>Email:</strong> <%= donors[i][6] %>
                        </p>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>
    <!-- Contact Us Section -->
    <div id="contact" class="container mt-5 text-center">
        <h2 class="text-danger"><b>Contact Us</b></h2>
        <div class="row justify-content-center">
            <div class="col-md-3">
                <img src="EmailIcon.png" alt="Email Icon" style="width:40px;">
                <p><strong>Email:</strong> shanubloodbank@gmail.com</p>
            </div>
            <!--Password : ShanuBBMS101-->
            <div class="col-md-3">
                <img src="LocationIcon.png" alt="Location Icon" style="width:40px;">
                <p><strong>Address:</strong> 123 Blood Bank Street, Nallasopara, Mumbai</p>
            </div>
            <div class="col-md-3">
                <img src="PhoneIcon.jpg" alt="Phone Icon" style="width:40px;">
                <p><strong>Phone:</strong> +91 9833713203</p>
            </div>
            <div class="col-md-3">
                <img src="WhatsAppIcon.png" alt="WhatsApp Icon" style="width:40px;">
                <p><strong>WhatsApp:</strong> +91 8625904134</p>
            </div>
            <div class="col-md-3 mt-3">
                <img src="InstagramLogo.webp" alt="Instagram Icon" style="width:40px;">
                <p><strong>Instagram:</strong> @BloodBankofficial</p>
            </div>
        </div>
<!-- Any Query, Send Message Section -->
<div class="contact">
    <h2 class="text-danger"><b>Any Query, Send Message</b></h2>
<form action="QueryServlet" method="post">
    <div class="form-group">
        <input type="text" name="name" id="name" placeholder=" " required>
        <label for="name">Your Name</label>
    </div>
    <div class="form-group">
        <input type="email" name="email" id="email" placeholder=" " required>
        <label for="email">Your Email</label>
    </div>
    <div class="form-group">
        <textarea name="message" id="message" rows="4" placeholder=" " required></textarea>
        <label for="message">Your Message</label>
    </div>
    <br>
    
    <button type="submit" id="btn" class="btn btn-danger">Send Message</button>
</form>
        <div class="mt-4">
            <a href="#home" class="btn btn-danger">Back to Home</a>
        </div>
    </div>
</body>
</html>
