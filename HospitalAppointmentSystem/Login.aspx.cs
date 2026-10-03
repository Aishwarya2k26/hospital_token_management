using System;
using System.Linq;
using System.Web.UI.WebControls;
using HospitalAppointmentSystem.Data;

namespace HospitalAppointmentSystem
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void RoleLogin_Command(object sender, CommandEventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            string selectedRole = e.CommandArgument.ToString();

            if (string.IsNullOrWhiteSpace(email) ||
                string.IsNullOrWhiteSpace(password))
            {
                lblMessage.Text = "Please enter email and password.";
                return;
            }

            var user = DataStore.GetUsers()
                .FirstOrDefault(u =>
                    u.Email.Equals(email, StringComparison.OrdinalIgnoreCase)
                    && u.Password == password);

            if (user == null)
            {
                lblMessage.Text = "Invalid email or password.";
                return;
            }

            if (!user.Role.Equals(selectedRole, StringComparison.OrdinalIgnoreCase))
            {
                lblMessage.Text = "This account is not registered as " + selectedRole + ".";
                return;
            }

            Session["UserName"] = user.Name;
            Session["Email"] = user.Email;
            Session["Role"] = user.Role;

            if (selectedRole == "Admin")
            {
                Response.Redirect("AdminDashboard.aspx");
            }
            else if (selectedRole == "Doctor")
            {
                Response.Redirect("DoctorDashboard.aspx");
            }
            else if (selectedRole == "Patient")
            {
                Response.Redirect("PatientDashboard.aspx");
            }
        }
    }
}