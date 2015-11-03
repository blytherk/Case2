using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContactDisplay : System.Web.UI.Page
{
    CustomerList contactList;
    protected void Page_Load(object sender, EventArgs e)
    {
        contactList = CustomerList.GetCustomers();
        if (!IsPostBack)
        {
            this.DisplayContacts();
        }
    }

         public void DisplayContacts()
    {
        lboxContact.Items.Clear();

        for (int i = 0; i < contactList.Count; i++)
        {
            lboxContact.Items.Add(this.contactList[i].ContactDisplay());
        }
    }
         protected void btnRemoveContact_Click(object sender, EventArgs e)
         {
             if (lboxContact.SelectedIndex > -1)
             {
                 foreach (int i in lboxContact.GetSelectedIndices().Reverse())
                 {
                     //contactList.RemoveAt(lboxContact.SelectedIndex);
                     contactList.RemoveAt(i);
                     this.DisplayContacts();
                     lblMessage.Text = " ";
                 }

             }
             else
             {
                 lblMessage.Text = "Please select an item to remove.";
             }
         }
         protected void btnEmptyList_Click(object sender, EventArgs e)
         {
             contactList.Clear();
             DisplayContacts();
         }
}