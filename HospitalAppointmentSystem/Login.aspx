<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HospitalAppointmentSystem.Login" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Hospital Token System - Login</title>

    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #e3f2fd, #ffffff);
        }

        .login-container {
            width: 380px;
            margin: 70px auto;
            background: white;
            padding: 35px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        }

        h1 {
            text-align: center;
            color: #1976d2;
            margin-bottom: 5px;
        }

        .subtitle {
            text-align: center;
            color: #777;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 18px;
        }

        label {
            display: block;
            margin-bottom: 7px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 12px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
        }

        .login-btn {
            width: 100%;
            padding: 13px;
            border: none;
            border-radius: 8px;
            color: white;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }

        .admin-btn {
            background: #d32f2f;
        }

        .admin-btn:hover {
            background: #b71c1c;
        }

        .doctor-btn {
            background: #388e3c;
        }

        .doctor-btn:hover {
            background: #2e7d32;
        }

        .patient-btn {
            background: #1976d2;
        }

        .patient-btn:hover {
            background: #125aa0;
        }

        .message {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: red;
        }

        .login-title {
            text-align: center;
            font-weight: bold;
            color: #555;
            margin-bottom: 5px;
        }

        .register {
            text-align: center;
            margin-top: 20px;
        }

        .register a {
            color: #1976d2;
            text-decoration: none;
            font-weight: bold;
        }
    </style>
</head>

<body>

<form id="form1" runat="server">

    <div class="login-container">

        <h1>Hospital Token</h1>

        <div class="subtitle">
            Appointment & Queue Management
        </div>

        <div class="form-group">
            <label>Email</label>

            <asp:TextBox
                ID="txtEmail"
                runat="server"
                TextMode="Email"
                placeholder="Enter your email">
            </asp:TextBox>
        </div>

        <div class="form-group">
            <label>Password</label>

            <asp:TextBox
                ID="txtPassword"
                runat="server"
                TextMode="Password"
                placeholder="Enter your password">
            </asp:TextBox>
        </div>

        <div class="login-title">
            Login As
        </div>

        <asp:Button
            ID="btnAdminLogin"
            runat="server"
            Text="Admin Login"
            CssClass="login-btn admin-btn"
            CommandArgument="Admin"
            OnCommand="RoleLogin_Command" />

        <asp:Button
            ID="btnDoctorLogin"
            runat="server"
            Text="Doctor Login"
            CssClass="login-btn doctor-btn"
            CommandArgument="Doctor"
            OnCommand="RoleLogin_Command" />

        <asp:Button
            ID="btnPatientLogin"
            runat="server"
            Text="Patient Login"
            CssClass="login-btn patient-btn"
            CommandArgument="Patient"
            OnCommand="RoleLogin_Command" />

        <asp:Label
            ID="lblMessage"
            runat="server"
            CssClass="message">
        </asp:Label>

        <div class="register">
            New patient?
            <a href="Register.aspx">Create Account</a>
        </div>

    </div>

</form>

</body>
</html>