<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="HospitalAppointmentSystem.Register" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Patient Registration - Hospital Token System</title>

    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #e3f2fd, #ffffff);
        }

        .register-container {
            width: 400px;
            margin: 60px auto;
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
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 17px;
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

        .register-btn {
            width: 100%;
            padding: 13px;
            border: none;
            border-radius: 8px;
            background: #1976d2;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        .message {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: red;
        }

        .login {
            text-align: center;
            margin-top: 20px;
        }

        .login a {
            color: #1976d2;
            text-decoration: none;
            font-weight: bold;
        }
    </style>
</head>

<body>

<form id="form1" runat="server">

    <div class="register-container">

        <h1>🏥 Create Account</h1>

        <div class="subtitle">
            Patient Registration
        </div>

        <div class="form-group">
            <label>Full Name</label>

            <asp:TextBox
                ID="txtName"
                runat="server"
                placeholder="Enter your full name">
            </asp:TextBox>
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
                placeholder="Create a password">
            </asp:TextBox>
        </div>

        <div class="form-group">
            <label>Confirm Password</label>

            <asp:TextBox
                ID="txtConfirmPassword"
                runat="server"
                TextMode="Password"
                placeholder="Confirm your password">
            </asp:TextBox>
        </div>

        <asp:Button
            ID="btnRegister"
            runat="server"
            Text="Create Account"
            CssClass="register-btn"
            OnClick="btnRegister_Click" />

        <asp:Label
            ID="lblMessage"
            runat="server"
            CssClass="message">
        </asp:Label>

        <div class="login">
            Already have an account?
            <a href="Login.aspx">Login</a>
        </div>

    </div>

</form>

</body>
</html>