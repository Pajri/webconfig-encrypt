﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string appSettingsValue = ConfigurationSettings.AppSettings["appSettingsKey"];
        if(appSettingsValue != null)
        {
            LitValue.Text = appSettingsValue;
        }
        else
        {
            LitValue.Text = "No appSettingsKey.";
        }
    }
}