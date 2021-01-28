using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace TechMeet.DATA.EF
{
    #region Applications Metadata
    public class ApplicationMetadata
    {
        [Display(Name = "Date Received")]
        [Required]
        public System.DateTime ApplicationDate { get; set; }

        [Display(Name = "Notes")]
        [DisplayFormat(NullDisplayText = "[N/A]")]
        [StringLength(2000, ErrorMessage = "* Notes can not exceed 2000 characters")]
        [UIHint("MultilineText")]
        public string ManagerNotes { get; set; }

        [Display(Name = "Status")]
        [Required]
        public int ApplicationStatus { get; set; }

        [Display(Name = "Resume Filename")]
        [Required]
        [StringLength(75, ErrorMessage = "* File name can not exceed 75 characters")]
        public string ResumeFilename { get; set; }
    }

    [MetadataType(typeof(ApplicationMetadata))]
    public partial class Application { }
    #endregion

    #region ApplicationStatus Metadata
    public class ApplicationStatusMetadata
    {
        [Display(Name = "Status Name")]
        [Required]
        [StringLength(50, ErrorMessage = "* Status name can not exceed 50 characters")]
        public string StatusName { get; set; }

        [Display(Name = "Description")]
        [DisplayFormat(NullDisplayText = "[N/A]")]
        [StringLength(250, ErrorMessage = "* Description can not exceed 250 characters")]
        public string StatusDescription { get; set; }
    }

    [MetadataType(typeof(ApplicationStatusMetadata))]
    public partial class ApplicationStatus { }
    #endregion

    #region Location Metadata
    public class LocationMetadata
    {
        [Display (Name = "Store Number")]
        [Required]
        [StringLength(10, ErrorMessage = "* Store number can not exceed 10 characters")]
        public string StoreNumber { get; set; }

        [Required]
        [StringLength(50, ErrorMessage = "* City name can not exceed 50 characters")]
        public string City { get; set; }

        [Required]
        [StringLength(2, ErrorMessage = "* State must be initialized using only 2 characters")]
        public string State { get; set; }
    }

    [MetadataType(typeof(LocationMetadata))]
    public partial class Location { }
    #endregion

    #region OpenPosition Metadata
    public class OpenPositionMetadata
    {
        [Required(ErrorMessage = "* Position is required")]
        [Display(Name = "Job Title")]
        public int PoisitionId { get; set; }

        [Required(ErrorMessage = "* Store number is required")]
        [Display(Name = "Store Number")]
        public int LocationId { get; set; }
    }

    [MetadataType(typeof(OpenPositionMetadata))]
    public partial class OpenPosition { }
    #endregion

    #region Position Metadata
    public class PositionMetadata
    {
        [Required]
        [StringLength(50, ErrorMessage = "* Title name can not exceed 50 characters")]
        public string Title { get; set; }

        [Display(Name = "Description")]
        [DisplayFormat(NullDisplayText = "[N/A]")]
        public string JobDescription { get; set; }
    }

    [MetadataType(typeof(PositionMetadata))]
    public partial class Position { }
    #endregion

    #region UserDetail Metadata
    public class UserDetailMetadata
    {
        [Display(Name = "User Name")]
        [Required]
        [StringLength(128, ErrorMessage = "* User Name must be less than 128 characters and must be unique")]
        public string UserId { get; set; }

        [Display(Name = "First Name")]
        [Required]
        [StringLength(50, ErrorMessage = "* First name can not exceed 50 characters")]
        public string FirstName { get; set; }

        [Display(Name = "Last Name")]
        [Required]
        [StringLength(50)]
        public string LastName { get; set; }

        [Display(Name = "Resume")]
        [DisplayFormat(NullDisplayText = "[N/A]")]
        public string ResumeFilename { get; set; }
    }

    [MetadataType(typeof(UserDetailMetadata))]
    public partial class UserDetail
    {
        [Display(Name = "User Name")]
        public string UserName
        {
            get { return $"{FirstName} {LastName}"; }
        }
    }
    #endregion
}

