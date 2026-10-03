using System;
using System.Linq;
using HospitalAppointmentSystem.Data;
using HospitalAppointmentSystem.Models;

namespace HospitalAppointmentSystem
{
    public partial class BookAppointment : System.Web.UI.Page
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
                LoadDoctors();
            }
        }

        private void LoadDoctors()
        {
            var doctors = DataStore.GetUsers()
                .Where(u => u.Role == "Doctor")
                .ToList();

            ddlDoctor.DataSource = doctors;
            ddlDoctor.DataTextField = "Name";
            ddlDoctor.DataValueField = "Name";
            ddlDoctor.DataBind();

            ddlDoctor.Items.Insert(0, "-- Select Doctor --");
        }

        protected void btnBook_Click(object sender, EventArgs e)
        {
            if (ddlDoctor.SelectedIndex == 0)
            {
                lblMessage.Text = "Please select a doctor.";
                return;
            }

            if (string.IsNullOrWhiteSpace(ddlDepartment.SelectedValue))
            {
                lblMessage.Text = "Please enter the department.";
                return;
            }

            if (string.IsNullOrWhiteSpace(txtDate.Text))
            {
                lblMessage.Text = "Please select an appointment date.";
                return;
            }

            DateTime appointmentDate;

            if (!DateTime.TryParse(txtDate.Text, out appointmentDate))
            {
                lblMessage.Text = "Please enter a valid date.";
                return;
            }

            string patientName = Session["UserName"].ToString();
            string doctorName = ddlDoctor.SelectedValue;

            // Generate next token for this doctor
            int tokenNumber = DataStore.GetAppointments()
                .Count(a => a.DoctorName == doctorName) + 1;

            string token = "A-" + tokenNumber.ToString("D2");

            Appointment appointment = new Appointment
            {
                PatientName = patientName,
                DoctorName = doctorName,
                Department = ddlDepartment.SelectedValue.Trim(),
                AppointmentDate = appointmentDate,
                Token = token,
                Status = "Waiting"
            };

            DataStore.AddAppointment(appointment);

            Response.Redirect("MyAppointment.aspx");
        }
    }
}