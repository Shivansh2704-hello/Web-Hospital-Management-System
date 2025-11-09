<!DOCTYPE html>
<html>
<head>
    <title>Hospital Management - Login</title>
    <style>
        body { 
            font-family: Arial, sans-serif; 
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .login-box { 
            width: 350px; 
            padding: 40px; 
            background: white; 
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 10px;
        }
        h3 {
            text-align: center;
            color: #666;
            font-weight: normal;
            margin-top: 0;
        }
        input { 
            width: 100%; 
            padding: 12px; 
            margin: 10px 0; 
            box-sizing: border-box;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }
        input:focus {
            outline: none;
            border-color: #667eea;
        }
        button { 
            width: 100%; 
            padding: 12px; 
            background: #667eea; 
            color: white; 
            border: none; 
            cursor: pointer;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            margin-top: 10px;
        }
        button:hover {
            background: #5568d3;
        }
        .info {
            text-align: center;
            margin-top: 15px;
            padding: 10px;
            background: #f0f0f0;
            border-radius: 5px;
            font-size: 13px;
            color: #555;
        }
    </style>
</head>
<body>
    <div class="login-box">
        <h2>Hospital Management System</h2>
        <h3>Login</h3>
        <form action="dashboard.jsp" method="post">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Login</button>
        </form>
        <div class="info">
            <strong>Demo Login:</strong><br>
            Username: admin | Password: admin123
        </div>
    </div>
</body>
</html>
