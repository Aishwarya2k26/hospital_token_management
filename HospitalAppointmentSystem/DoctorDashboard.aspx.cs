using System;
using System.Linq;
using System.Web.UI.WebControls;
using HospitalAppointmentSystem.Data;
using HospitalAppointmentSystem.Models;

namespace HospitalAppointmentSystem
{
    public partial class DoctorDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null ||
                Session["Role"].ToString() != "Doctor")
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                lblDoctorName.Text = Session["UserName"].ToString();
                LoadAppointments();
            }
        }

        private void LoadAppointments()
        {
            string doctorName = Session["UserName"].ToString();

            var appointments = DataStore.GetAppointments()
                .Where(a => a.DoctorName == doctorName)
                .OrderBy(a => a.Id)
                .ToList();

            gvAppointments.DataSource = appointments;
            gvAppointments.DataBind();

            Appointment current = appointments
                .FirstOrDefault(a => a.Status == "Now Serving");

            if (current != null)
            {
                lblCurrentToken.Text = current.Token;
            }
            else
            {
                lblCurrentToken.Text = "--";
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            string doctorName = Session["UserName"].ToString();

            Appointment current = DataStore.GetAppointments()
                .FirstOrDefault(a =>
                    a.DoctorName == doctorName &&
                    a.Status == "Now Serving");

            if (current != null)
            {
                DataStore.UpdateAppointmentStatus(
                    current.Id,
                    "Completed");
            }

            Appointment next = DataStore.GetAppointments()
                .Where(a =>
                    a.DoctorName == doctorName &&
                    a.Status == "Waiting")
                .OrderBy(a => a.Id)
                .FirstOrDefault();

            if (next == null)
            {
                lblMessage.Text =
                    "No waiting patients in the queue.";

                LoadAppointments();
                return;
            }

            DataStore.UpdateAppointmentStatus(
                next.Id,
                "Now Serving");

            lblMessage.Text =
                "Now serving token " + next.Token;

            LoadAppointments();
        }

        protected void gvAppointments_RowCommand(
            object sender,
            GridViewCommandEventArgs e)
        {
            if (e.CommandName == "CompleteAppointment")
            {
                int appointmentId;

                if (int.TryParse(
                    e.CommandArgument.ToString(),
                    out appointmentId))
                {
                    Appointment appointment =
                        DataStore.GetAppointments()
                        .FirstOrDefault(a => a.Id == appointmentId);

                    if (appointment != null)
                    {
                        DataStore.UpdateAppointmentStatus(
                            appointment.Id,
                            "Completed");

                        lblMessage.Text =
                            "Appointment " +
                            appointment.Token +
                            " marked as completed.";
                    }

                    LoadAppointments();
                }
            }
        }
    }
}