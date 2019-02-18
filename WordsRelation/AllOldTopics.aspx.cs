using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WordsRelation.Data;

namespace WordsRelation
{
    public partial class AllOldTopics : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (var context = new ConceptsRelationDBEntities())
            {

                grdvTopics.DataSource = context.MasterConceptRelations.ToList<MasterConceptRelation>();
                grdvTopics.DataBind();
            }
        }
    }
}