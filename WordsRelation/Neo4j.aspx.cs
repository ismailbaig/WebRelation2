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
            // int tipicId = Request.QueryString["TopicID"];
            int tipicId = 1;
             List <SaveAllCR> saveAllCRList = new List<SaveAllCR>();
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
                            TopicDetailsId = cr.fTopicId,
                            ConceptOne = cr.ConceptOne.ConceptOneName,
                            ConceptTwo = cr.ConceptTwo.ConceptTwoName,
                            RelationType = cr.Relation.RelationName,
                            TopicName = cr.Topic.TopicsName
                        });
                    }
                }

               // var topicConceptRelation= topicDetailsEOList.Select(x => x.TopicDetailsId= tipicId).ToList();
                var concepOnetList= topicDetailsEOList.Select(x => x.ConceptOne).Distinct().ToList();
                var concepTwotList = topicDetailsEOList.Select(x => x.ConceptTwo).Distinct().ToList();
                //  return topicDetailsEOList;

                List<TopicDetailsEOModel> topicConceptRelation = new List<TopicDetailsEOModel>();
                topicConceptRelation = topicDetailsEOList;
               

                int j = 1;
                for (int i = 0; i < concepOnetList.Count(); i++)
                {

                    // topicConceptRelation.Add(new TopicDetailsEOModel() {  ConceptOne = concept1 });
                    string concept1 = "";


                    foreach (var item in topicConceptRelation)
                    {

                        if (concepOnetList[i]== item.ConceptOne)
                        {
                           
                            concept1 = concepOnetList[i] + j.ToString();
                            int index = topicConceptRelation.FindIndex(obj => obj.ConceptOne == concepOnetList[i]);
                            //int index = topicConceptRelation.FindIndex(ind => ind.Equals(concepOnetList[i])); //Finds the item index  
                       
                            //topicConceptRelation[index].ConceptOne = concept1;
                            topicConceptRelation[index].ConceptOne = concept1;
                        }
                    }

                    Label myLabel = new Label();
                    myLabel.ID = "myLabel_" + j;

                    myLabel.Text = "CREATE(" + concept1 + ":Album { Name:" +  concepOnetList[i] + "})";
                    PlaceHolder1.Controls.Add(myLabel);
                    j++;
                }

                int k = concepOnetList.Count()+1;
                for (int i = 0; i <concepTwotList.Count(); i++)
                {
                    string concept2 = "";
                    foreach (var item in topicConceptRelation)
                    {

                        if (concepTwotList[i] == item.ConceptTwo)
                        {

                            concept2 = concepTwotList[i] + k.ToString();
                            int index = topicConceptRelation.FindIndex(obj => obj.ConceptTwo == concepTwotList[i]);
                            //int index = topicConceptRelation.FindIndex(ind => ind.Equals(concepOnetList[i])); //Finds the item index  
                        
                            //topicConceptRelation[index].ConceptOne = concept1;
                            topicConceptRelation[index].ConceptTwo = concept2;
                        }
                    }


                    

                    Label myLabel = new Label();
                    myLabel.ID = "myLabel_" + k;

                    myLabel.Text = "CREATE(" + concept2 + ":Album { Name:" + concepOnetList[i] + "})";
                    PlaceHolder1.Controls.Add(myLabel);
                    k++;
                }

               // var totalConcepts = concepOnetList.Concat(concepTwotList).ToList();


                int r = 1;
                //for (int i = 0; i < topicConceptRelation.Count(); i++)
                foreach (var item in topicConceptRelation)
                {
                    string relations = "";
                    relations = item.RelationType + r.ToString();

                    Label myLabel = new Label();
                    myLabel.ID = "myLabel_" + j;

                    if(item.TopicDetailsId == tipicId )
                    {

                    //var concept1 = totalConcepts.Select(x => x = item.ConceptOne);
                    ////CREATE(a) -[r: RELEASED]->(b)
                    myLabel.Text = "CREATE(" + item.ConceptOne + ") -[" + relations + ":" + item.RelationType + "]->(" + item.ConceptTwo + ")";
                    PlaceHolder1.Controls.Add(myLabel);
                    }
                    j++;
                }


            }
            catch (Exception ex)
            {
                throw ex;
            }


           // for (int i = 0; i < topicDetailsEOList.Count; i++)
          
                
            
          
        }
    }
}