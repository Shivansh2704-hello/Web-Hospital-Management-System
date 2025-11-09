<!DOCTYPE html>
<html>
<head>
    <title>Dashboard - Hospital Management</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body { 
            font-family: Arial, sans-serif; 
            background: #f5f5f5; 
        }
        .navbar { 
            background: #2c3e50; 
            padding: 20px 30px; 
            color: white;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .navbar h2 {
            margin: 0;
        }
        .container { 
            max-width: 1200px; 
            margin: 40px auto;
            padding: 0 20px;
        }
        .container h3 {
            margin-bottom: 30px;
            color: #2c3e50;
            font-size: 28px;
        }
        .menu { 
            display: grid; 
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); 
            gap: 25px; 
        }
        .card { 
            padding: 50px 30px; 
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white; 
            text-align: center; 
            border-radius: 10px; 
            cursor: pointer; 
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .card:hover { 
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.3);
        }
        .card h3 { 
            margin: 0;
            font-size: 22px;
            color: white;
        }
        .card:nth-child(1) { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); }
        .card:nth-child(2) { background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); }
        .card:nth-child(3) { background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); }
        .card:nth-child(4) { background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%); }
        .card:nth-child(5) { background: linear-gradient(135deg, #fa709a 0%, #fee140 100%); }
        .card:nth-child(6) { background: linear-gradient(135deg, #30cfd0 0%, #330867 100%); }
    </style>
</head>
<body>
    <div class="navbar">
        <h2>Hospital Management System</h2>
    </div>
    <div class="container">
        <h3>Dashboard</h3>
        <div class="menu">
            <div class="card" onclick="location.href='add-patient.jsp'">
                <h3>Add Patient</h3>
            </div>
            <div class="card" onclick="location.href='view-patients.jsp'">
                <h3>View Patients</h3>
            </div>
            <div class="card" onclick="location.href='add-doctor.jsp'">
                <h3>Add Doctor</h3>
            </div>
            <div class="card" onclick="location.href='view-doctors.jsp'">
                <h3>View Doctors</h3>
            </div>
            <div class="card" onclick="location.href='book-appointment.jsp'">
                <h3>Book Appointment</h3>
            </div>
            <div class="card" onclick="location.href='view-appointments.jsp'">
                <h3>View Appointments</h3>
            </div>
        </div>
    </div>
</body>
</html>

