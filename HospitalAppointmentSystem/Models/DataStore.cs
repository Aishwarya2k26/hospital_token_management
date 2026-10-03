using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using HospitalAppointmentSystem.Models;

namespace HospitalAppointmentSystem.Data
{
    public static class DataStore
    {
        private static string connectionString =
            ConfigurationManager.ConnectionStrings["HospitalDb"].ConnectionString;

        public static List<User> GetUsers()
        {
            List<User> users = new List<User>();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT Name, Email, Password, Role FROM Users";

                SqlCommand cmd = new SqlCommand(query, con);

                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    users.Add(new User
                    {
                        Name = reader["Name"].ToString(),
                        Email = reader["Email"].ToString(),
                        Password = reader["Password"].ToString(),
                        Role = reader["Role"].ToString()
                    });
                }
            }

            return users;
        }

        public static void AddUser(User user)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query =
                    "INSERT INTO Users (Name, Email, Password, Role) " +
                    "VALUES (@Name, @Email, @Password, @Role)";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@Name", user.Name);
                cmd.Parameters.AddWithValue("@Email", user.Email);
                cmd.Parameters.AddWithValue("@Password", user.Password);
                cmd.Parameters.AddWithValue("@Role", user.Role);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public static List<Appointment> GetAppointments()
        {
            List<Appointment> appointments = new List<Appointment>();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query =
                    "SELECT Id, PatientName, DoctorName, Department, " +
                    "AppointmentDate, Token, Status FROM Appointments";

                SqlCommand cmd = new SqlCommand(query, con);

                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    appointments.Add(new Appointment
                    {
                        Id = (int)reader["Id"],
                        PatientName = reader["PatientName"].ToString(),
                        DoctorName = reader["DoctorName"].ToString(),
                        Department = reader["Department"].ToString(),
                        AppointmentDate = (System.DateTime)reader["AppointmentDate"],
                        Token = reader["Token"].ToString(),
                        Status = reader["Status"].ToString()
                    });
                }
            }

            return appointments;
        }

        public static void AddAppointment(Appointment appointment)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query =
                    "INSERT INTO Appointments " +
                    "(PatientName, DoctorName, Department, AppointmentDate, Token, Status) " +
                    "VALUES (@PatientName, @DoctorName, @Department, @AppointmentDate, @Token, @Status)";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@PatientName", appointment.PatientName);
                cmd.Parameters.AddWithValue("@DoctorName", appointment.DoctorName);
                cmd.Parameters.AddWithValue("@Department", appointment.Department);
                cmd.Parameters.AddWithValue("@AppointmentDate", appointment.AppointmentDate);
                cmd.Parameters.AddWithValue("@Token", appointment.Token);
                cmd.Parameters.AddWithValue("@Status", appointment.Status);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public static void UpdateAppointmentStatus(int appointmentId, string status)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query =
                    "UPDATE Appointments SET Status = @Status WHERE Id = @Id";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@Status", status);
                cmd.Parameters.AddWithValue("@Id", appointmentId);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}