using System;
using System.Linq;
using HospitalAppointmentSystem.Data;
using HospitalAppointmentSystem.Models;

namespace HospitalAppointmentSystem
{
    public partial class MyAppointment : System.Web.UI.Page
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
                LoadAppointment();
            }
        }

        private void LoadAppointment()
        {
            string patientName = Session["UserName"].ToString();

            Appointment appointment = DataStore.GetAppointments()
                .Where(a => a.PatientName == patientName)
                .OrderByDescending(a => a.Id)
                .FirstOrDefault();

            if (appointment != null)
            {
                lblToken.Text = appointment.Token;
                lblStatus.Text = appointment.Status;
                lblPatientName.Text = appointment.PatientName;
                lblDoctor.Text = appointment.DoctorName;
                lblDepartment.Text = appointment.Department;
                lblDate.Text = appointment.AppointmentDate.ToString("dd-MM-yyyy");
            }
            else
            {
                lblToken.Text = "--";
                lblStatus.Text = "No Appointment";
                lblPatientName.Text = patientName;
                lblDoctor.Text = "--";
                lblDepartment.Text = "--";
                lblDate.Text = "--";
            }
        }
    }
}