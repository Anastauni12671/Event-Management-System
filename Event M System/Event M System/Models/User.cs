//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Event_M_System.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class User
    {
        public int U_ID { get; set; }
        public string U_Type { get; set; }
        public Nullable<int> Staff_ID { get; set; }
        public Nullable<int> C_ID { get; set; }
        public string Name { get; set; }
        public string Password { get; set; }
    
        public virtual Customer Customer { get; set; }
        public virtual Staff Staff { get; set; }
    }
}
