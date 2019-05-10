using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using WordsRelation.Data;
using WordsRelation.Models;
using LinqKit;

namespace WordsRelation
{
    public partial class Neo4j : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // int tipicId = Request.QueryString["TopicID"];
            string topicName = Request.QueryString["topicName"];
            string par = Request.QueryString["param1"];

            if (par != null)
            {
                cypher.Value = par;
            }
            //string relationType = Request.QueryString["TopicName"];
            //string conceptOne = Request.QueryString["TopicName"];
            //string conceptTwo = Request.QueryString["TopicName"];

            if (topicName != null)
            {
                int tipicId = 1;
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
                        saveAllCRList = context.SaveAllCRs.Where(tp => tp.Topic.TopicsName == topicName).ToList<SaveAllCR>();

                        foreach (SaveAllCR cr in saveAllCRList)
                        {
                            topicDetailsEOList.Add(new TopicDetailsEOModel
                            {
                                TopicDetailsId = cr.Id,
                                ConceptOne = cr.ConceptOne.ConceptOneName,
                                ConceptTwo = cr.ConceptOne1.ConceptOneName,
                                RelationType = cr.Relation.RelationName,
                                TopicName = cr.Topic.TopicsName
                            });
                        }
                    }

                    //var topicIdConceptRelation= topicDetailsEOList.Select(x =>  x.TopicDetailsId= tipicId).ToList();
                    List<TopicDetailsEOModel> topicConceptRelation = new List<TopicDetailsEOModel>();

                    topicConceptRelation = topicDetailsEOList;

                    int count = topicConceptRelation.Count();
                    int m = 1;
                    string allrelations = "";
                    foreach (var item in topicConceptRelation)
                    {
                        allrelations = allrelations + "MATCH p = () -[r:" + item.RelationType + "]->() RETURN p ";

                        if (count != m)
                        {
                            allrelations = allrelations + " UNION ";
                        }

                        m++;
                    }

                    cypher.Value = allrelations;
                }



                catch (Exception ex)
                {
                    throw ex;
                }
            }
            // var concepOnetList= topicDetailsEOList.Select(x => x.ConceptOne).Distinct().ToList();
            // var concepTwotList = topicDetailsEOList.Select(x => x.ConceptTwo).Distinct().ToList();
            // //  return topicDetailsEOList;





            // List<string> concepOnetList_1 = new List<string>();
            // int j = 1;
            // for (int i = 0; i < concepOnetList.Count(); i++)
            // {

            //     // topicConceptRelation.Add(new TopicDetailsEOModel() {  ConceptOne = concept1 });
            //     string concept1 = "";
            //     concept1 = concepOnetList[i].Replace(" ", String.Empty);
            //     concept1 = concept1 + j.ToString();

            //     foreach (var item in topicConceptRelation)
            //     {

            //         if (concepOnetList[i]== item.ConceptOne)
            //         {

            //             int index = topicConceptRelation.FindIndex(obj => obj.ConceptOne == concepOnetList[i]);
            //             //int index = topicConceptRelation.FindIndex(ind => ind.Equals(concepOnetList[i])); //Finds the item index  

            //             //topicConceptRelation[index].ConceptOne = concept1;
            //             topicConceptRelation[index].ConceptOne = concept1;

            //         }
            //     }



            //     Label myLabel = new Label();
            //     myLabel.ID = "myLabel_" + j;

            //     myLabel.Text = "CREATE(" + concept1 + ":Album { Name:" +'"' + concepOnetList[i] +'"' + "})";
            //     PlaceHolder1.Controls.Add(myLabel);
            //     PlaceHolder1.Controls.Add(new LiteralControl("<br/>"));
            //     j++;
            // }

            // int k = concepOnetList.Count()+1;
            // for (int i = 0; i <concepTwotList.Count(); i++)
            // {
            //     string concept2 = "";
            //     concept2 = concepTwotList[i].Replace(" ", String.Empty);
            //     concept2 = concept2 + k.ToString();
            //     foreach (var item in topicConceptRelation)
            //     {

            //         if (concepTwotList[i] == item.ConceptTwo)
            //         {


            //             int index = topicConceptRelation.FindIndex(obj => obj.ConceptTwo == concepTwotList[i]);
            //             //int index = topicConceptRelation.FindIndex(ind => ind.Equals(concepOnetList[i])); //Finds the item index  

            //             //topicConceptRelation[index].ConceptOne = concept1;
            //             topicConceptRelation[index].ConceptTwo = concept2;
            //         }
            //     }



            //     List<Label> testlist = new List<Label>();
            //     Label myLabel = new Label();
            //     myLabel.ID = "myLabel_" + k;

            //     myLabel.Text = "CREATE(" + concept2 + ":Album { Name:" + '"' + concepTwotList[i] + '"' + "})";
            //     testlist.Add(myLabel);
            //     PlaceHolder1.Controls.Add(myLabel);
            //     PlaceHolder1.Controls.Add(new LiteralControl("<br/>"));
            //     k++;
            // }

            //// var totalConcepts = concepOnetList.Concat(concepTwotList).ToList();


            // int r = 1;
            // List<string> relationsList = new List<string>();
            // //for (int i = 0; i < topicConceptRelation.Count(); i++)
            // foreach (var item in topicConceptRelation)
            // {
            //     string relations = "";
            //     relations = item.RelationType.Replace(" ", String.Empty);
            //     relations = relations + r.ToString();

            //     Label myLabel = new Label();
            //     myLabel.ID = "myLabel_" + j;

            //     //if(item.TopicDetailsId == tipicId )
            //     //{

            //     //var concept1 = totalConcepts.Select(x => x = item.ConceptOne);
            //     ////CREATE(a) -[r: RELEASED]->(b)
            //     myLabel.Text = "CREATE(" + item.ConceptOne + ") -[" + relations + ":" + item.RelationType + "]->(" + item.ConceptTwo + ")";
            //     PlaceHolder1.Controls.Add(myLabel);
            //     PlaceHolder1.Controls.Add(new LiteralControl("<br/>"));
            //     relationsList.Add(relations);
            //     //}
            //     r++;
            // }


            // string retDtat = "";
            // string ret = "RETURN ";
            // var concepOnetList1 = topicConceptRelation.Select(x => x.ConceptOne).Distinct().ToList();
            // var concepTwoList1 = topicConceptRelation.Select(x => x.ConceptTwo).Distinct().ToList();
            // for (int i = 0; i < concepOnetList1.Count(); i++)
            // {
            //     //foreach (var item in topicConceptRelation)
            //     //{
            //     //    if (concepOnetList[i] == item.ConceptOne)
            //     //    {


            //             retDtat = retDtat+ concepOnetList1[i] + "," ;
            //     //    }


            //     //   // j++;
            //     //}
            // }

            // for (int i = 0; i < concepTwoList1.Count(); i++)
            // {
            //     //foreach (var item in topicConceptRelation)
            //     //{
            //     //    if (concepTwotList[i] == item.ConceptTwo)
            //     //    {

            //             retDtat = retDtat + concepTwoList1[i] + ",";
            //     //    }
            //     //}
            // }

            // for (int i = 0; i < relationsList.Count(); i++)
            // {
            //     retDtat = retDtat+relationsList[i] + ",";
            // }


            //         Label retLabel = new Label();
            // retLabel.ID = "myLabel_" + j;
            // retLabel.Text = ret + retDtat;
            // PlaceHolder1.Controls.Add(retLabel);



            // for (int i = 0; i < topicDetailsEOList.Count; i++)




        }



        [WebMethod]
        public static List<Label> GetNeo4JQuery(string topic, int c1, int c2, int rt)
        {
            int count = 0;
            List<SaveAllCR> saveAllCRList = new List<SaveAllCR>();
            List<SaveAllCR> saveAllCRList1 = new List<SaveAllCR>();
            SaveAllCR saveAllCR = new SaveAllCR();

            Relation relation = new Relation();
            ConceptOne c1Details = new ConceptOne();
            ConceptTwo c2Details = new ConceptTwo();
            Topic topicDBEntity = new Topic();

            List<TopicDetailsEOModel> topicDetailsEOList = new List<TopicDetailsEOModel>();

            try
            {
                //var searchCriteria = new
                //{
                //    topicName = topic,
                //    concept1 = c1,
                //    concept2 = c2,
                //    relationType = rt
                //};

                //var predicate = PredicateBuilder.New<SaveAllCR>();

                //if (!string.IsNullOrWhiteSpace(searchCriteria.topicName.ToString()))
                //{
                //    predicate = predicate.And(p => p.Topic.TopicsName.Contains(searchCriteria.topicName));
                //}

                ////if (!string.IsNullOrWhiteSpace(searchCriteria.concept1.ToString()))
                //if (searchCriteria.concept1.ToString() != "0")
                //{
                //    //predicate = predicate.And(p => p.ConceptOne.ConceptOneName.Contains(searchCriteria.concept1.ToString()));
                //    predicate = predicate.And(p => p.ConceptOne.C1Id.ToString().Contains(searchCriteria.concept1.ToString()));
                //}
                ////if (!string.IsNullOrWhiteSpace(searchCriteria.concept2.ToString()))
                //if (searchCriteria.concept2.ToString() != "0")
                //{
                //    predicate = predicate.And(p => p.ConceptTwo.C2Id.ToString().Contains(searchCriteria.concept2.ToString()));
                //}
                ////if (!string.IsNullOrWhiteSpace(searchCriteria.relationType.ToString()))
                //if (searchCriteria.relationType.ToString() != "0")
                //{
                //    predicate = predicate.And(p => p.Relation.RelID.ToString().Contains(searchCriteria.relationType.ToString()));
                //}
                //using (var context = new ConceptsRelationDBEntities())
                //{
                //    saveAllCRList = context.SaveAllCRs.
                //        Where(predicate.Compile())
                //        //Where(tp => tp.Topic.TopicsName == topic)
                //        .ToList<SaveAllCR>();

                //    foreach (SaveAllCR cr in saveAllCRList)
                //    {

                //        topicDetailsEOList.Add(new TopicDetailsEOModel
                //        {
                //            TopicDetailsId = cr.Id,
                //            ConceptOne = cr.ConceptOne.ConceptOneName,
                //            ConceptTwo = cr.ConceptTwo.ConceptTwoName,
                //            RelationType = cr.Relation.RelationName,
                //            TopicName = cr.Topic.TopicsName
                //        });
                //    }
                //}


                using (var context = new ConceptsRelationDBEntities())
                {
                    saveAllCRList = context.SaveAllCRs.Where(tp => tp.Topic.TopicsName == topic).ToList<SaveAllCR>();


                    foreach (var item in saveAllCRList)
                    {
                        if (item.fC1Id == c1 || item.fC1Id == c2 || item.fRId == rt)
                        {
                            saveAllCRList1.Add(item);
                        }
                    }


                    foreach (SaveAllCR cr in saveAllCRList1)
                    {
                        topicDetailsEOList.Add(new TopicDetailsEOModel
                        {
                            TopicDetailsId = cr.Id,
                            ConceptOne = cr.ConceptOne.ConceptOneName,
                            ConceptTwo = cr.ConceptOne1.ConceptOneName,
                            RelationType = cr.Relation.RelationName,
                            TopicName = cr.Topic.TopicsName
                        });
                    }
                }




                List<TopicDetailsEOModel> topicConceptRelation = new List<TopicDetailsEOModel>();

                topicConceptRelation = topicDetailsEOList;

                int count1 = topicConceptRelation.Count();
                int n = 1;
                string allrelations = "";
                foreach (var item in topicConceptRelation)
                {




                    allrelations = allrelations + " MATCH p = (a: ConceptOne) -[r:" + item.RelationType + "]->(b: ConceptTwo) WHERE a.name ="+'"'+item.ConceptOne+'"'+"AND b.name = "+ '"' +item.ConceptTwo+ '"'+ "RETURN p ";
                   
                    if (count1 != n)
                    {
                        allrelations = allrelations + " UNION ";
                    }

                    n++;
                }

                // cypher.Value = allrelations;

                List<Label> PlaceHolder1 = new List<Label>();
                Label lbl = new Label();
                lbl.Text = allrelations;
                PlaceHolder1.Add(lbl);

                return PlaceHolder1;
            }

            catch (Exception ex)
            {
                return null;
            }
        }
    }
}