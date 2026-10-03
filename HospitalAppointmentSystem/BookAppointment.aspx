<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookAppointment.aspx.cs" Inherits="HospitalAppointmentSystem.BookAppointment" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Book Appointment</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f8fb;
        }

        .navbar {
            background: #1976d2;
            color: white;
            padding: 18px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar h2 {
            margin: 0;
        }

        .back {
            background: white;
            color: #1976d2;
            padding: 8px 15px;
            border-radius: 6px;
            text-decoration: none;
        }

        .container {
            max-width: 600px;
            margin: 40px auto;
            padding: 20px;
        }

        .form-card {
            background: white;
            padding: 35px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        h1 {
            color: #1976d2;
            text-align: center;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
        }

        select,
        input {
            width: 100%;
            padding: 12px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
        }

        .book-btn {
            width: 100%;
            padding: 13px;
            background: #1976d2;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
        }

        .message {
            display: block;
            text-align: center;
            margin-top: 20px;
            font-weight: bold;
        }
    </style>
</head>

<body>

<form id="form1" runat="server">

    <div class="navbar">
        <h2>🏥 Hospital Token System</h2>
        <a href="PatientDashboard.aspx" class="back">← Dashboard</a>
    </div>

    <div class="container">

        <div class="form-card">

            <h1>📅 Book Appointment</h1>

            <div class="form-group">
                <label>Department</label>

                <asp:DropDownList ID="ddlDepartment"
                    runat="server">
                    <asp:ListItem Text="-- Select Department --" Value=""></asp:ListItem>
                    <asp:ListItem Text="General Medicine" Value="General Medicine"></asp:ListItem>
                    <asp:ListItem Text="Cardiology" Value="Cardiology"></asp:ListItem>
                    <asp:ListItem Text="Orthopedics" Value="Orthopedics"></asp:ListItem>
                    <asp:ListItem Text="Dermatology" Value="Dermatology"></asp:ListItem>
                    <asp:ListItem Text="Pediatrics" Value="Pediatrics"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <label>Doctor</label>

                <asp:DropDownList ID="ddlDoctor"
                    runat="server">

                    <asp:ListItem Text="-- Select Doctor --" Value=""></asp:ListItem>
                    <asp:ListItem Text="Dr. Kumar" Value="Dr. Kumar"></asp:ListItem>
                    <asp:ListItem Text="Dr. Priya" Value="Dr. Priya"></asp:ListItem>
                    <asp:ListItem Text="Dr. Arun" Value="Dr. Arun"></asp:ListItem>
                    <asp:ListItem Text="Dr. Meena" Value="Dr. Meena"></asp:ListItem>

                </asp:DropDownList>
            </div>

            <div class="form-group">
                <label>Appointment Date</label>

                <asp:TextBox ID="txtDate"
                    runat="server"
                    TextMode="Date">
                </asp:TextBox>
            </div>

            <asp:Button ID="btnBook"
                runat="server"
                Text="🎫 Book Appointment & Get Token"
                CssClass="book-btn"
                OnClick="btnBook_Click" />

            <asp:Label ID="lblMessage"
                runat="server"
                CssClass="message">
            </asp:Label>

        </div>

    </div>

</form>

</body>
</html>
