<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyAppointment.aspx.cs" Inherits="HospitalAppointmentSystem.MyAppointment" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>My Appointment</title>
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
            max-width: 900px;
            margin: 40px auto;
            padding: 20px;
        }

        .appointment-card {
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

        .token-box {
            text-align: center;
            background: #e3f2fd;
            padding: 25px;
            border-radius: 12px;
            margin-bottom: 30px;
        }

        .token {
            font-size: 42px;
            font-weight: bold;
            color: #1976d2;
        }

        .status {
            display: inline-block;
            padding: 8px 20px;
            background: #fff3cd;
            color: #856404;
            border-radius: 20px;
            font-weight: bold;
        }

        .details {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .detail-box {
            background: #f8f9fa;
            padding: 18px;
            border-radius: 8px;
        }

        .detail-box strong {
            display: block;
            color: #555;
            margin-bottom: 7px;
        }

        .message {
            display: block;
            text-align: center;
            color: #777;
            margin-top: 20px;
        }

        .book-btn {
            display: block;
            width: 220px;
            margin: 30px auto 0;
            padding: 12px;
            background: #1976d2;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 8px;
        }

        @media(max-width:600px) {
            .details {
                grid-template-columns: 1fr;
            }

            .navbar {
                padding: 15px;
            }
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

        <div class="appointment-card">

            <h1>🎫 My Appointment</h1>

            <asp:Panel ID="pnlAppointment" runat="server">

                <div class="token-box">

                    <div>Your Token Number</div>

                    <div class="token">
                        <asp:Label ID="lblToken"
                            runat="server">
                        </asp:Label>
                    </div>

                    <br />

                    <asp:Label ID="lblStatus"
                        runat="server"
                        CssClass="status">
                    </asp:Label>

                </div>

                <div class="details">

                    <div class="detail-box">
                        <strong>Patient Name</strong>
                        <asp:Label ID="lblPatientName"
                            runat="server">
                        </asp:Label>
                    </div>

                    <div class="detail-box">
                        <strong>Doctor</strong>
                        <asp:Label ID="lblDoctor"
                            runat="server">
                        </asp:Label>
                    </div>

                    <div class="detail-box">
                        <strong>Department</strong>
                        <asp:Label ID="lblDepartment"
                            runat="server">
                        </asp:Label>
                    </div>

                    <div class="detail-box">
                        <strong>Appointment Date</strong>
                        <asp:Label ID="lblDate"
                            runat="server">
                        </asp:Label>
                    </div>

                </div>

            </asp:Panel>

            <asp:Label ID="lblMessage"
                runat="server"
                CssClass="message">
            </asp:Label>

            <a href="BookAppointment.aspx"
               class="book-btn">
                + Book Another Appointment
            </a>

        </div>

    </div>

</form>

</body>
</html>