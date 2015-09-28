﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Global;
using Models;
using Security;


namespace views.groups
{
    public partial class GroupEdit : BasePages.Groups
    {
        private readonly BLL.LinuxProfile _bllLinuxProfile = new BLL.LinuxProfile();

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var group = new Models.Group
            {
                Id = Group.Id,
                Name = txtGroupName.Text,
                Type = Group.Type,
                Image = Convert.ToInt32(ddlGroupImage.SelectedValue),
                ImageProfile = Convert.ToInt32(ddlGroupImage.SelectedValue) == 0 ? 0 : Convert.ToInt32(ddlImageProfile.SelectedValue),
                Description = txtGroupDesc.Text,
                SenderArguments = txtGroupSenderArgs.Text,
                ReceiverArguments = txtGroupReceiveArgs.Text

            };

           new BLL.Group().UpdateGroup(group);
           

        }

        protected void ddlGroupImage_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlGroupImage.Text == "Select Image") return;
            PopulateImageProfilesDdl(ddlImageProfile, Convert.ToInt32(ddlGroupImage.SelectedValue));

        }

       

        protected void Page_Load(object sender, EventArgs e)
        {
            ddlGroupType.Enabled = false;
            if (!IsPostBack) PopulateForm();
        }

        protected void PopulateForm()
        {

            PopulateImagesDdl(ddlGroupImage);

            txtGroupName.Text = Group.Name;
            txtGroupDesc.Text = Group.Description;
            ddlGroupImage.SelectedValue = Group.Image.ToString();
            txtGroupSenderArgs.Text = Group.SenderArguments;
            ddlGroupType.Text = Group.Type;

            PopulateImageProfilesDdl(ddlImageProfile, Convert.ToInt32(ddlGroupImage.SelectedValue));
            ddlImageProfile.SelectedValue = Group.ImageProfile.ToString();

        }

      

        
    }
}