using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WordsRelation
{
    public partial class AdvanceSearchPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string topicName = Request.QueryString["topicName"];
            topic.Value = topicName;

        }
    }
}