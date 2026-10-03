<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoctorDashboard.aspx.cs" Inherits="HospitalAppointmentSystem.DoctorDashboard" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Doctor Dashboard</title>
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
            margin-top: 0;
        }

        .queue-card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        .queue-card h2 {
            color: #1976d2;
        }

        .current-token {
            text-align: center;
            background: #e3f2fd;
            padding: 25px;
            border-radius: 12px;
            margin-bottom: 25px;
        }

        .current-token-number {
            font-size: 42px;
            font-weight: bold;
            color: #1976d2;
        }

        .next-btn {
            background: #1976d2;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
        }

        .next-btn:hover {
            background: #125aa0;
        }

        .complete-btn {
            background: #2e7d32;
            color: white;
            border: none;
            padding: 10px 18px;
            border-radius: 7px;
            cursor: pointer;
        }

        .message {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        .queue-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 25px;
        }

        .queue-table th {
            background: #1976d2;
            color: white;
            padding: 12px;
        }

        .queue-table td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }

        .waiting {
            color: #856404;
            font-weight: bold;
        }

        .serving {
            color: #1976d2;
            font-weight: bold;
        }

        .completed {
            color: #2e7d32;
            font-weight: bold;
        }
    </style>
</head>

<body>

<form id="form1" runat="server">

    <div class="navbar">
        <h2>🏥 Doctor Dashboard</h2>
        <a href="Login.aspx" class="logout">Logout</a>
    </div>

    <div class="container">

        <div class="welcome">
            <h1>Welcome, <asp:Label ID="lblDoctorName" runat="server"></asp:Label> 👨‍⚕️</h1>
            <p>Manage today's patient queue and appointment tokens.</p>
        </div>

        <div class="queue-card">

            <div class="current-token">

                <div>Currently Serving</div>

                <div class="current-token-number">
                    <asp:Label ID="lblCurrentToken"
                        runat="server"
                        Text="--">
                    </asp:Label>
                </div>

                <asp:Button ID="btnNext"
                    runat="server"
                    Text="📢 Call Next Token"
                    CssClass="next-btn"
                    OnClick="btnNext_Click" />

                <asp:Label ID="lblMessage"
                    runat="server"
                    CssClass="message">
                </asp:Label>

            </div>

            <h2>📋 Patient Queue</h2>

            <asp:GridView ID="gvAppointments"
                runat="server"
                AutoGenerateColumns="false"
                CssClass="queue-table"
                OnRowCommand="gvAppointments_RowCommand">

                <Columns>

                    <asp:BoundField
                        DataField="Token"
                        HeaderText="Token" />

                    <asp:BoundField
                        DataField="PatientName"
                        HeaderText="Patient" />

                    <asp:BoundField
                        DataField="Department"
                        HeaderText="Department" />

                    <asp:BoundField
                        DataField="AppointmentDate"
                        HeaderText="Date"
                        DataFormatString="{0:dd-MM-yyyy}" />

                    <asp:BoundField
                        DataField="Status"
                        HeaderText="Status" />

                    <asp:TemplateField HeaderText="Action">

                        <ItemTemplate>

                            <asp:Button
                                ID="btnComplete"
                                runat="server"
                                Text="✓ Complete"
                                CssClass="complete-btn"
                                CommandName="CompleteAppointment"
                                CommandArgument='<%# Eval("Id") %>' />

                        </ItemTemplate>

                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

        </div>

    </div>

</form>

</body>
</html>
