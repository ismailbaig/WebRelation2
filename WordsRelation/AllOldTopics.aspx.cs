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
    public partial class AllOldTopics : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {



            List<SaveAllCR> saveAllCRList = new List<SaveAllCR>();
            SaveAllCR saveAllCR = new SaveAllCR();

            Relation relation = new Relation();
            ConceptOne c1Details = new ConceptOne();
            ConceptTwo c2Details = new ConceptTwo();
            Topic topicDBEntity = new Topic();

            List<string> lstTopicName = new List<string>();

            List<TopicDetailsEOModel> topicDetailsEOList = new List<TopicDetailsEOModel>();

            try
            {

                using (var context = new ConceptsRelationDBEntities())
                {
                    //saveAllCRList = context.SaveAllCRs.ToList<SaveAllCR>().Distinct();
                    lstTopicName = context.SaveAllCRs.Select(scr => scr.Topic.TopicsName).Distinct().ToList<string>();
                    //var result = EFContext.TestAddresses.Select(m => m.Name).Distinct();

                    //foreach (SaveAllCR cr in saveAllCRList)
                    foreach (string cr in lstTopicName)
                    {
                        topicDetailsEOList.Add(new TopicDetailsEOModel
                        {
                            //TopicDetailsId = cr.Id,
                            //ConceptOne = cr.ConceptOne.ConceptOneName,
                            //ConceptTwo = cr.ConceptTwo.ConceptTwoName,
                            //RelationType = cr.Relation.RelationName,
                            //TopicName = cr.Topic.TopicsName
                            TopicName = cr
                        });
                    }
                }

                //topicDetailsEOList.Select(x => x.TopicDetailsId).Distinct();
                //topicDetailsEOList.Select(x => x.TopicDetailsId=5);

                grdvTopics.DataSource = topicDetailsEOList;
                grdvTopics.DataBind();
                //  return topicDetailsEOList;

            }
            catch (Exception ex)
            {
                throw ex;
            }


       
            
            //using (var context = new ConceptsRelationDBEntities())
            //{

            //    grdvTopics.DataSource = context.MasterConceptRelations.ToList<MasterConceptRelation>();
            //    grdvTopics.DataBind();
            //}
        }
    }
}