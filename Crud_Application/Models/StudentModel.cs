using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Crud_Application.Models
{
    public class StudentModel {
        [Required(ErrorMessage = "Name is Required")]
        public string StudentName { get; set; }

        [Required(ErrorMessage = "Name is Required")]

        public string StudentFName { get; set; }

        [Required(ErrorMessage = "Name is Required")]

        public string StudentClass { get; set; }

        [Required(ErrorMessage = "Name is Required")]

        public string FromDate { get; set; }

        [Required(ErrorMessage = "Name is Required")]

        public string ToDate { get; set; }

       
    }
}