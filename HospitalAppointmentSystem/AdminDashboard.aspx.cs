using System;
using System.Linq;
using HospitalAppointmentSystem.Data;
using HospitalAppointmentSystem.Models;

namespace HospitalAppointmentSystem
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null ||
                Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                lblAdminName.Text = Session["UserName"].ToString();
                LoadDashboard();
            }
        }

        private void LoadDashboard()
        {
            var users = DataStore.GetUsers();
            var appointments = DataStore.GetAppointments();

            lblPatientCount.Text = users
                .Count(u => u.Role == "Patient")
                .ToString();

            lblDoctorCount.Text = users
                .Count(u => u.Role == "Doctor")
                .ToString();

            lblAppointmentCount.Text =
                appointments.Count.ToString();

            gvAppointments.DataSource = appointments
                .Select(a => new
                {
                    Token = a.Token,
                    Patient = a.PatientName,
                    Doctor = a.DoctorName,
                    Department = a.Department,
                    Date = a.AppointmentDate.ToString("dd-MM-yyyy"),
                    Status = a.Status
                })
                .ToList();

            gvAppointments.DataBind();
        }

        protected void btnCreateDoctor_Click(object sender, EventArgs e)
        {
            string name = txtDoctorName.Text.Trim();
            string email = txtDoctorEmail.Text.Trim();
            string password = txtDoctorPassword.Text.Trim();
            string department = txtDoctorDepartment.Text.Trim();

            if (string.IsNullOrWhiteSpace(name) ||
                string.IsNullOrWhiteSpace(email) ||
                string.IsNullOrWhiteSpace(password) ||
                string.IsNullOrWhiteSpace(department))
            {
                lblDoctorMessage.Text =
                    "Please fill all doctor details.";
                lblDoctorMessage.ForeColor =
                    System.Drawing.Color.Red;
                return;
            }

            bool emailExists = DataStore.GetUsers()
                .Any(u => u.Email.Equals(
                    email,
                    StringComparison.OrdinalIgnoreCase));

            if (emailExists)
            {
                lblDoctorMessage.Text =
                    "This email already exists.";
                lblDoctorMessage.ForeColor =
                    System.Drawing.Color.Red;
                return;
            }

            DataStore.AddUser(new User
            {
                Name = name,
                Email = email,
                Password = password,
                Role = "Doctor"
            });

            lblDoctorMessage.Text =
                "Doctor account created successfully.";

            lblDoctorMessage.ForeColor =
                System.Drawing.Color.Green;

            txtDoctorName.Text = "";
            txtDoctorEmail.Text = "";
            txtDoctorPassword.Text = "";
            txtDoctorDepartment.Text = "";

            LoadDashboard();
        }
    }
}