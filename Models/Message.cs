//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BuildingManagementProject.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Message
    {
        public string MessageId { get; set; }
        public string MessageTitle { get; set; }
        public System.DateTime MessageDate { get; set; }
        public string Description { get; set; }
        public string TenantId { get; set; }
        public string EmployeeId { get; set; }
    
        public virtual Employee Employee { get; set; }
        public virtual Tenant Tenant { get; set; }
    }
}