using System;
using System.Linq;
using HospitalAppointmentSystem.Data;
using HospitalAppointmentSystem.Models;

namespace HospitalAppointmentSystem
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            if (string.IsNullOrWhiteSpace(name) ||
                string.IsNullOrWhiteSpace(email) ||
                string.IsNullOrWhiteSpace(password))
            {
                lblMessage.Text = "Please fill all required fields.";
                return;
            }

            if (password != confirmPassword)
            {
                lblMessage.Text = "Passwords do not match.";
                return;
            }

            // Check whether email already exists
            bool emailExists = DataStore.GetUsers()
                .Any(u => u.Email.Equals(
                    email,
                    StringComparison.OrdinalIgnoreCase));

            if (emailExists)
            {
                lblMessage.Text =
                    "An account with this email already exists.";
                return;
            }

            // Save new patient to SQL Server
            DataStore.AddUser(new User
            {
                Name = name,
                Email = email,
                Password = password,
                Role = "Patient"
            });

            Response.Redirect("Login.aspx");
        }
    }
}