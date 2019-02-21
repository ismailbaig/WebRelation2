using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WordsRelation.Data;
using WordsRelation.Models;

namespace WordsRelation
{
    public partial class Neo4j : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            List<SaveAllCR> saveAllCRList = new List<SaveAllCR>();
            SaveAllCR saveAllCR = new SaveAllCR();

            Relation relation = new Relation();
            ConceptOne c1Details = new ConceptOne();
            ConceptTwo c2Details = new ConceptTwo();
            Topic topicDBEntity = new Topic();

            List<TopicDetailsEOModel> topicDetailsEOList = new List<TopicDetailsEOModel>();

            try
            {

                using (var context = new ConceptsRelationDBEntities())
                {
                    saveAllCRList = context.SaveAllCRs.ToList<SaveAllCR>();

                    foreach (SaveAllCR cr in saveAllCRList)
                    {
                        topicDetailsEOList.Add(new TopicDetailsEOModel
                        {
                            TopicDetailsId = cr.Id,
                            ConceptOne = cr.ConceptOne.ConceptOneName,
                            ConceptTwo = cr.ConceptTwo.ConceptTwoName,
                            RelationType = cr.Relation.RelationName
                        });
                    }
                }

                topicDetailsEOList.Select(x => x.TopicDetailsId).Distinct();
               
                //  return topicDetailsEOList;

            }
            catch (Exception ex)
            {
                throw ex;
            }


           // for (int i = 0; i < topicDetailsEOList.Count; i++)
           foreach(var item in topicDetailsEOList)
            {
                int i = 1;
                string a = "";
                Label myLabel = new Label();
                myLabel.ID = "myLabel_" + i;
               
                myLabel.Text = "CREATE(" + item.ConceptOne + ": Album { Name:" + item.ConceptOne + "})";
                PlaceHolder1.Controls.Add(myLabel);
            
            }
        }
    }
}