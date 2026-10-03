```aspx
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PatientDashboard.aspx.cs" Inherits="HospitalAppointmentSystem.PatientDashboard" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Patient Dashboard</title>

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

        .logout {
            background: white;
            color: #1976d2;
            padding: 8px 15px;
            border-radius: 6px;
            text-decoration: none;
        }

        .container {
            max-width: 1100px;
            margin: 40px auto;
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

        .queue-section {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
            margin-bottom: 25px;
        }

        .queue-section h2 {
            color: #1976d2;
            margin-top: 0;
        }

        .queue-cards {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }

        .queue-card {
            flex: 1;
            min-width: 180px;
            background: #f4f8fb;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
        }

        .queue-card h3 {
            margin-bottom: 10px;
            color: #555;
        }

        .queue-number {
            font-size: 32px;
            font-weight: bold;
            color: #1976d2;
        }

        .queue-status {
            margin-top: 20px;
            padding: 18px;
            border-radius: 10px;
            background: #e3f2fd;
            text-align: center;
        }

        .queue-status-text {
            font-size: 20px;
            font-weight: bold;
            color: #1976d2;
        }

        .cards {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }

        .card {
            background: white;
            padding: 30px;
            border-radius: 12px;
            width: 250px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        .card h3 {
            color: #1976d2;
        }

        .btn {
            display: inline-block;
            background: #1976d2;
            color: white;
            padding: 11px 18px;
            border-radius: 7px;
            text-decoration: none;
            margin-top: 10px;
        }

        .refresh {
            display: inline-block;
            margin-top: 15px;
            background: #388e3c;
            color: white;
            padding: 10px 18px;
            border-radius: 7px;
            text-decoration: none;
        }
    </style>
</head>

<body>

<form id="form1" runat="server">

    <div class="navbar">

        <h2>🏥 Hospital Token System</h2>

        <a href="Logout.aspx" class="logout">
            Logout
        </a>

    </div>

    <div class="container">

        <div class="welcome">

            <h1>
                Welcome,
                <asp:Label
                    ID="lblPatientName"
                    runat="server">
                </asp:Label>
                👋
            </h1>

            <p>
                Manage your hospital appointments and queue tokens from here.
            </p>

        </div>


        <!-- QUEUE STATUS -->

        <div class="queue-section">

            <h2>🎫 Your Live Queue Status</h2>

            <div class="queue-cards">

                <div class="queue-card">

                    <h3>Your Token</h3>

                    <div class="queue-number">

                        <asp:Label
                            ID="lblMyToken"
                            runat="server">
                        </asp:Label>

                    </div>

                </div>


                <div class="queue-card">

                    <h3>Now Serving</h3>

                    <div class="queue-number">

                        <asp:Label
                            ID="lblNowServing"
                            runat="server">
                        </asp:Label>

                    </div>

                </div>


                <div class="queue-card">

                    <h3>People Ahead</h3>

                    <div class="queue-number">

                        <asp:Label
                            ID="lblPeopleAhead"
                            runat="server">
                        </asp:Label>

                    </div>

                </div>


                <div class="queue-card">

                    <h3>Queue Position</h3>

                    <div class="queue-number">

                        <asp:Label
                            ID="lblQueuePosition"
                            runat="server">
                        </asp:Label>

                    </div>

                </div>

            </div>


            <div class="queue-status">

                <asp:Label
                    ID="lblQueueStatus"
                    runat="server"
                    CssClass="queue-status-text">
                </asp:Label>

            </div>


            <a href="PatientDashboard.aspx" class="refresh">
                🔄 Refresh Queue
            </a>

        </div>


        <!-- MAIN CARDS -->

        <div class="cards">

            <div class="card">

                <h3>📅 Book Appointment</h3>

                <p>
                    Select a department, doctor and appointment date.
                </p>

                <a href="BookAppointment.aspx" class="btn">
                    Book Now
                </a>

            </div>


            <div class="card">

                <h3>🎫 My Token</h3>

                <p>
                    View your appointment and current queue status.
                </p>

                <a href="MyAppointment.aspx" class="btn">
                    View Token
                </a>

            </div>


            <div class="card">

                <h3>👨‍⚕️ Doctors</h3>

                <p>
                    View available doctors and departments.
                </p>

                <a href="BookAppointment.aspx" class="btn">
                    View Doctors
                </a>

            </div>

        </div>

    </div>

</form>

</body>
</html>
```
