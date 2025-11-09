<!DOCTYPE html>
<html>
<head>
    <title>Add Patient</title>
    <style>
        body { font-family: Arial; margin: 20px; background: #f5f5f5; }
        .container { max-width: 500px; margin: 0 auto; background: white; padding: 30px; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        h2 { color: #2c3e50; margin-bottom: 20px; }
        input, select { width: 100%; padding: 10px; margin: 10px 0; box-sizing: border-box; border: 1px solid #ddd; border-radius: 5px; }
        button { padding: 12px 30px; background: #28a745; color: white; border: none; cursor: pointer; border-radius: 5px; font-size: 16px; }
        button:hover { background: #218838; }
        a { text-decoration: none; color: #007bff; }
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Add New Patient</h2>
        <form action="PatientServlet" method="post">
            <input type="text" name="name" placeholder="Patient Name" required>
            <input type="number" name="age" placeholder="Age" required>
            <select name="gender" required>
                <option value="">Select Gender</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>
            <input type="text" name="phone" placeholder="Phone Number" required>
            <input type="email" name="email" placeholder="Email (Optional)">
            <button type="submit">Add Patient</button>
        </form>
        <br><a href="dashboard.jsp">&larr; Back to Dashboard</a>
    </div>
</body>
</html>
