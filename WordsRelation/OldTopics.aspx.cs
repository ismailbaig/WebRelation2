using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WordsRelation.Data;

namespace WordsRelation
{
    public partial class OldTopics : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (var context = new ConceptsRelationDBEntities())
            {
                grdvTopics.DataSource = context.Topics.ToList<Topic>();
                grdvTopics.DataBind();
            }
        }

        //protected void grdvTopics_RowCommand(object sender, GridViewCommandEventArgs e)
        //{

        //    var tem = grdvTopics.SelectedRow;

        //    if (e.CommandName == "Export")
        //    {
        //        GridViewRow row = (GridViewRow)((Control)e.CommandSource).Parent.Parent;
        //        int index = row.RowIndex;

        //        String Retailer = ((HyperLink)grdvTopics.Rows[index].Cells[0].Controls[0]).Text;
        //      //  Response.Redirect(id); // url can be from your sql table

        //    }
        //}

        protected void grdvTopics_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = grdvTopics.SelectedRow;
            string temp = row.Cells[1].Text;
        }
    }
}