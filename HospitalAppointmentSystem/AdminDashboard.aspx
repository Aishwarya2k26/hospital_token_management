<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="HospitalAppointmentSystem.AdminDashboard" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Admin Dashboard</title>

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

        .logout {
            background: white;
            color: #1976d2;
            padding: 8px 15px;
            border-radius: 6px;
            text-decoration: none;
        }

        .container {
            max-width: 1100px;
            margin: 35px auto;
            padding: 20px;
        }

        .welcome {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
            margin-bottom: 25px;
        }

        .welcome h1 {
            color: #1976d2;
        }

        .cards {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            width: 280px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        .card h2 {
            color: #1976d2;
        }

        .number {
            font-size: 35px;
            font-weight: bold;
            color: #1976d2;
        }

        .section {
            background: white;
            padding: 25px;
            border-radius: 12px;
            margin-top: 25px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        .section h2 {
            color: #1976d2;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 6px;
        }

        .input-box {
            width: 100%;
            padding: 11px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 7px;
            font-size: 15px;
        }

        .create-btn {
            background: #1976d2;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 7px;
            font-size: 16px;
            cursor: pointer;
        }

        .create-btn:hover {
            background: #125aa0;
        }

        .message {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        .data-table {
            width: 100%;
            border-collapse: collapse;
        }

        .data-table th {
            background: #1976d2;
            color: white;
            padding: 12px;
        }

        .data-table td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }
    </style>
</head>

<body>

<form id="form1" runat="server">

    <div class="navbar">

        <h2>🏥 Hospital Admin</h2>

        <a href="Login.aspx" class="logout">
            Logout
        </a>

    </div>

    <div class="container">

        <div class="welcome">

            <h1>
                Welcome,
                <asp:Label ID="lblAdminName"
                    runat="server">
                </asp:Label>
                👋
            </h1>

            <p>
                Manage hospital appointments, patients and doctors.
            </p>

        </div>

        <div class="cards">

            <div class="card">

                <h2>👥 Patients</h2>

                <div class="number">
                    <asp:Label ID="lblPatientCount"
                        runat="server">
                    </asp:Label>
                </div>

                <p>Registered patients</p>

            </div>

            <div class="card">

                <h2>👨‍⚕️ Doctors</h2>

                <div class="number">
                    <asp:Label ID="lblDoctorCount"
                        runat="server">
                    </asp:Label>
                </div>

                <p>Available doctors</p>

            </div>

            <div class="card">

                <h2>📅 Appointments</h2>

                <div class="number">
                    <asp:Label ID="lblAppointmentCount"
                        runat="server">
                    </asp:Label>
                </div>

                <p>Total appointments</p>

            </div>

        </div>

        <div class="section">

            <h2>👨‍⚕️ Create Doctor Account</h2>

            <div class="form-group">

                <label>Doctor Name</label>

                <asp:TextBox
                    ID="txtDoctorName"
                    runat="server"
                    CssClass="input-box"
                    placeholder="Enter doctor name">
                </asp:TextBox>

            </div>

            <div class="form-group">

                <label>Doctor Email</label>

                <asp:TextBox
                    ID="txtDoctorEmail"
                    runat="server"
                    TextMode="Email"
                    CssClass="input-box"
                    placeholder="Enter doctor email">
                </asp:TextBox>

            </div>

            <div class="form-group">

                <label>Password</label>

                <asp:TextBox
                    ID="txtDoctorPassword"
                    runat="server"
                    TextMode="Password"
                    CssClass="input-box"
                    placeholder="Create doctor password">
                </asp:TextBox>

            </div>

            <div class="form-group">

                <label>Department</label>

                <asp:TextBox
                    ID="txtDoctorDepartment"
                    runat="server"
                    CssClass="input-box"
                    placeholder="Example: Cardiology">
                </asp:TextBox>

            </div>

            <asp:Button
                ID="btnCreateDoctor"
                runat="server"
                Text="Create Doctor Account"
                CssClass="create-btn"
                OnClick="btnCreateDoctor_Click" />

            <asp:Label
                ID="lblDoctorMessage"
                runat="server"
                CssClass="message">
            </asp:Label>

        </div>

        <div class="section">

            <h2>📋 Appointment Overview</h2>

            <asp:GridView
                ID="gvAppointments"
                runat="server"
                AutoGenerateColumns="true"
                CssClass="data-table">
            </asp:GridView>

        </div>

    </div>

</form>

</body>
</html>