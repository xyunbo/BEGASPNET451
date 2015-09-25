﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;

public partial class Genres
{
    public Genres()
    {
        this.Review = new HashSet<Reviews>();
    }

    public int Id { get; set; }
    public string Name { get; set; }
    public int SortOrder { get; set; }

    public virtual ICollection<Reviews> Review { get; set; }
}

public partial class Reviews
{
    public int Id { get; set; }
    public string Title { get; set; }
    public string Summary { get; set; }
    public string Body { get; set; }
    public int GenreID { get; set; }
    public bool Authorized { get; set; }
    public System.DateTime CreateDateTime { get; set; }
    public System.DateTime UpdateDatetime { get; set; }

    public virtual Genres Genre { get; set; }
}
