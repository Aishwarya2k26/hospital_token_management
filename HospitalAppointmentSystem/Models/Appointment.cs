using System;

namespace HospitalAppointmentSystem.Models
{
    public class Appointment
    {
        public int Id { get; set; }
        public string PatientName { get; set; }
        public string DoctorName { get; set; }
        public string Department { get; set; }
        public DateTime AppointmentDate { get; set; }
        public string Token { get; set; }
        public string Status { get; set; }
    }
}