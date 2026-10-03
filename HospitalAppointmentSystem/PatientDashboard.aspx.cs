
using System;
using System.Linq;
using HospitalAppointmentSystem.Data;

namespace HospitalAppointmentSystem
{
    public partial class PatientDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null ||
                Session["Role"].ToString() != "Patient")
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                lblPatientName.Text = Session["UserName"].ToString();
                LoadQueueStatus();
            }
        }

        private void LoadQueueStatus()
        {
            string patientName = Session["UserName"].ToString();

            var appointments = DataStore.GetAppointments();

            var myAppointment = appointments
                .Where(a =>
                    a.PatientName.Equals(
                        patientName,
                        StringComparison.OrdinalIgnoreCase)
                    && a.AppointmentDate.Date == DateTime.Today)
                .OrderByDescending(a => a.AppointmentDate)
                .FirstOrDefault();

            if (myAppointment == null)
            {
                lblMyToken.Text = "-";
                lblNowServing.Text = "-";
                lblPeopleAhead.Text = "0";
                lblQueuePosition.Text = "-";

                lblQueueStatus.Text =
                    "You do not have an appointment for today.";

                return;
            }

            lblMyToken.Text = myAppointment.Token;

            var doctorQueue = appointments
                .Where(a =>
                    a.DoctorName.Equals(
                        myAppointment.DoctorName,
                        StringComparison.OrdinalIgnoreCase)
                    && a.AppointmentDate.Date == DateTime.Today)
                .OrderBy(a => GetTokenNumber(a.Token))
                .ToList();

            var servingAppointment = doctorQueue
                .FirstOrDefault(a =>
                    a.Status.Equals(
                        "Now Serving",
                        StringComparison.OrdinalIgnoreCase));

            if (servingAppointment != null)
            {
                lblNowServing.Text = servingAppointment.Token;
            }
            else
            {
                lblNowServing.Text = "-";
            }

            if (myAppointment.Status.Equals(
                "Completed",
                StringComparison.OrdinalIgnoreCase))
            {
                lblPeopleAhead.Text = "0";
                lblQueuePosition.Text = "-";

                lblQueueStatus.Text =
                    "Your appointment has been completed.";

                return;
            }

            if (myAppointment.Status.Equals(
                "Now Serving",
                StringComparison.OrdinalIgnoreCase))
            {
                lblPeopleAhead.Text = "0";
                lblQueuePosition.Text = "Now";

                lblQueueStatus.Text =
                    "🔔 Please proceed. Your token is now being served.";

                return;
            }

            int myTokenNumber = GetTokenNumber(myAppointment.Token);

            int peopleAhead = doctorQueue
                .Count(a =>
                    a.Status.Equals(
                        "Waiting",
                        StringComparison.OrdinalIgnoreCase)
                    && GetTokenNumber(a.Token) < myTokenNumber);

            lblPeopleAhead.Text = peopleAhead.ToString();

            int queuePosition = peopleAhead + 1;

            lblQueuePosition.Text = queuePosition.ToString();

            if (peopleAhead == 0)
            {
                lblQueueStatus.Text =
                    "🎉 You are next. Please be ready.";
            }
            else if (peopleAhead == 1)
            {
                lblQueueStatus.Text =
                    "⏳ 1 patient is ahead of you.";
            }
            else
            {
                lblQueueStatus.Text =
                    "⏳ " + peopleAhead +
                    " patients are ahead of you.";
            }
        }

        private int GetTokenNumber(string token)
        {
            if (string.IsNullOrWhiteSpace(token))
                return 0;

            string number = new string(
                token.Where(char.IsDigit).ToArray());

            int tokenNumber;

            if (int.TryParse(number, out tokenNumber))
                return tokenNumber;

            return 0;
        }
    }
}
