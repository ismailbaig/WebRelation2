using DocumentFormat.OpenXml.Packaging;
using LinqKit;
using Neo4jClient;
using Newtonsoft.Json.Serialization;
using OpenXmlPowerTools;
using System;
using System.Collections.Generic;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using WordsRelation.Data;
using WordsRelation.Models;

namespace WordsRelation
{
    public partial class Home1 : System.Web.UI.Page
    {
        static string DocxConvertedToHtmlDirectory = "DocxConvertedToHtml/";
        string fileNameFromUser = String.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    //GetAllItems();
            //}

            string topicName = Request.QueryString["TopicName"];

            //topic = topicName;
            
            using (var context = new ConceptsRelationDBEntities())
            {
                //grdvConceptRelation.DataSource = context.MasterConceptRelations.Where(c => c.TopicID == id).ToList<MasterConceptRelation>();
                //grdvConceptRelation.DataBind();
            }
        }

        [WebMethod]
        public static List<RelationsEOModel> GetAllRelations(string rtVal)
        {
            List<RelationsEOModel> relEO = new List<RelationsEOModel>();
 
            using(ConceptsRelationDBEntities context = new ConceptsRelationDBEntities())
            {
                List<Relation> lstRelations = new List<Relation>();
                lstRelations = context.Relations.ToList();
                foreach (Relation r in lstRelations)
                {
                    relEO.Add(new RelationsEOModel { id = r.RelID, text = r.RelationName });
                }

            }
            
            return relEO;
        }

        [WebMethod]
        public static List<RelationsEOModel> GetNewRT(string newVal, string newType, string newProperty)
        {
            if (SaveNewRTToDB(newVal))
            {
                return GetAllRelations(newVal);
            }
            else
            {
                return null;
            }
        }

        
        [WebMethod]
        public static List<Label> GetNeo4JQuery(string topic, int c1, int c2, int rt)
        {


           

            int count = 0;
            List<SaveAllCR> saveAllCRList = new List<SaveAllCR>();
            SaveAllCR saveAllCR = new SaveAllCR();

            Relation relation = new Relation();
            ConceptOne c1Details = new ConceptOne();
            ConceptTwo c2Details = new ConceptTwo();
            Topic topicDBEntity = new Topic();

            List<TopicDetailsEOModel> topicDetailsEOList = new List<TopicDetailsEOModel>();

            try
            {
                var searchCriteria = new
                {
                    topicName = topic,
                    concept1 = c1,
                    concept2 = c2,
                    relationType = rt
                };

                var predicate = PredicateBuilder.New<SaveAllCR>();

                if (!string.IsNullOrWhiteSpace(searchCriteria.topicName.ToString()))
                {
                    predicate = predicate.And(p => p.Topic.TopicsName.Contains(searchCriteria.topicName));
                }

                //if (!string.IsNullOrWhiteSpace(searchCriteria.concept1.ToString()))
                if (searchCriteria.concept1.ToString() != "0")
                {
                    //predicate = predicate.And(p => p.ConceptOne.ConceptOneName.Contains(searchCriteria.concept1.ToString()));
                    predicate = predicate.And(p => p.ConceptOne.C1Id.ToString().Contains(searchCriteria.concept1.ToString()));
                }
                //if (!string.IsNullOrWhiteSpace(searchCriteria.concept2.ToString()))
                if (searchCriteria.concept2.ToString() != "0")
                {
                    predicate = predicate.And(p => p.ConceptTwo.C2Id.ToString().Contains(searchCriteria.concept2.ToString()));
                }
                //if (!string.IsNullOrWhiteSpace(searchCriteria.relationType.ToString()))
                if (searchCriteria.relationType.ToString() != "0")
                {
                    predicate = predicate.And(p => p.Relation.RelID.ToString().Contains(searchCriteria.relationType.ToString()));
                }
                using (var context = new ConceptsRelationDBEntities())
                {
                    saveAllCRList = context.SaveAllCRs.
                        Where(predicate.Compile())
                        //Where(tp => tp.Topic.TopicsName == topic)
                        .ToList<SaveAllCR>();

                    foreach (SaveAllCR cr in saveAllCRList)
                    {

                        topicDetailsEOList.Add(new TopicDetailsEOModel
                        {
                            TopicDetailsId = cr.Id,
                            ConceptOne = cr.ConceptOne.ConceptOneName,
                            ConceptTwo = cr.ConceptTwo.ConceptTwoName,
                            RelationType = cr.Relation.RelationName,
                            TopicName = cr.Topic.TopicsName
                        });
                    }
                }


                List<TopicDetailsEOModel> topicConceptRelation = new List<TopicDetailsEOModel>();
                List<Label> PlaceHolder1 = new List<Label>();



                var concepOnetList = topicDetailsEOList.Select(x => x.ConceptOne).Distinct().ToList();
                var concepTwotList = topicDetailsEOList.Select(x => x.ConceptTwo).Distinct().ToList();
                //  return topicDetailsEOList;


                topicConceptRelation = topicDetailsEOList;


                List<string> concepOnetList_1 = new List<string>();
                int j = 1;
                for (int i = 0; i < concepOnetList.Count(); i++)
                {

                    // topicConceptRelation.Add(new TopicDetailsEOModel() {  ConceptOne = concept1 });
                    string concept1 = "";
                    concept1 = concepOnetList[i].Replace(" ", String.Empty);
                    concept1 = concept1 + j.ToString();

                    foreach (var item in topicConceptRelation)
                    {

                        if (concepOnetList[i] == item.ConceptOne)
                        {

                            int index = topicConceptRelation.FindIndex(obj => obj.ConceptOne == concepOnetList[i]);
                            //int index = topicConceptRelation.FindIndex(ind => ind.Equals(concepOnetList[i])); //Finds the item index  

                            //topicConceptRelation[index].ConceptOne = concept1;
                            topicConceptRelation[index].ConceptOne = concept1;

                        }
                    }



                    Label myLabel = new Label();
                    myLabel.ID = "myLabel_" + j;

                    myLabel.Text = "CREATE(" + concept1 + ":Album { Name:" + '"' + concepOnetList[i] + '"' + "})";
                    PlaceHolder1.Add(myLabel);
                    //PlaceHolder1.Controls.Add(new LiteralControl("<br/>"));
                    j++;
                }

                int k = concepOnetList.Count() + 1;
                for (int i = 0; i < concepTwotList.Count(); i++)
                {
                    string concept2 = "";
                    concept2 = concepTwotList[i].Replace(" ", String.Empty);
                    concept2 = concept2 + k.ToString();
                    foreach (var item in topicConceptRelation)
                    {

                        if (concepTwotList[i] == item.ConceptTwo)
                        {


                            int index = topicConceptRelation.FindIndex(obj => obj.ConceptTwo == concepTwotList[i]);
                            //int index = topicConceptRelation.FindIndex(ind => ind.Equals(concepOnetList[i])); //Finds the item index  

                            //topicConceptRelation[index].ConceptOne = concept1;
                            topicConceptRelation[index].ConceptTwo = concept2;
                        }
                    }



                    List<Label> testlist = new List<Label>();
                    Label myLabel = new Label();
                    myLabel.ID = "myLabel_" + k;

                    myLabel.Text = "CREATE(" + concept2 + ":Album { Name:" + '"' + concepTwotList[i] + '"' + "})";
                    testlist.Add(myLabel);
                    PlaceHolder1.Add(myLabel);
                   // PlaceHolder1.Controls.Add(new LiteralControl("<br/>"));
                    k++;
                }

                // var totalConcepts = concepOnetList.Concat(concepTwotList).ToList();


                int r = 1;
                List<string> relationsList = new List<string>();
                //for (int i = 0; i < topicConceptRelation.Count(); i++)
                foreach (var item in topicConceptRelation)
                {
                    string relations = "";
                    relations = item.RelationType.Replace(" ", String.Empty);
                    relations = relations + r.ToString();

                    Label myLabel = new Label();
                    myLabel.ID = "myLabel_" + j;

                    //if(item.TopicDetailsId == tipicId )
                    //{

                    //var concept1 = totalConcepts.Select(x => x = item.ConceptOne);
                    ////CREATE(a) -[r: RELEASED]->(b)
                    myLabel.Text = "CREATE(" + item.ConceptOne + ") -[" + relations + ":" + item.RelationType + "]->(" + item.ConceptTwo + ")";
                    PlaceHolder1.Add(myLabel);
                   // PlaceHolder1.Controls.Add(new LiteralControl("<br/>"));
                    relationsList.Add(relations);
                    //}
                    r++;
                }


                string retDtat = "";
                string ret = "RETURN ";
                var concepOnetList1 = topicConceptRelation.Select(x => x.ConceptOne).Distinct().ToList();
                var concepTwoList1 = topicConceptRelation.Select(x => x.ConceptTwo).Distinct().ToList();
                for (int i = 0; i < concepOnetList1.Count(); i++)
                {
                    //foreach (var item in topicConceptRelation)
                    //{
                    //    if (concepOnetList[i] == item.ConceptOne)
                    //    {


                    retDtat = retDtat + concepOnetList1[i] + ",";
                    //    }


                    //   // j++;
                    //}
                }

                for (int i = 0; i < concepTwoList1.Count(); i++)
                {
                    //foreach (var item in topicConceptRelation)
                    //{
                    //    if (concepTwotList[i] == item.ConceptTwo)
                    //    {

                    retDtat = retDtat + concepTwoList1[i] + ",";
                    //    }
                    //}
                }

                for (int i = 0; i < relationsList.Count(); i++)
                {
                    retDtat = retDtat + relationsList[i] + ",";
                }


                Label retLabel = new Label();
                retLabel.ID = "myLabel_" + j;
                retLabel.Text = ret + retDtat;
                PlaceHolder1.Add(retLabel);







                return PlaceHolder1;

            }
            catch (Exception ex)
            {
                return null;
            }
        }

        [WebMethod]
        public static List<TopicDetailsEOModel> Search(string topic, int c1, int c2, int rt)
        //public static List<TopicDetailsEOModel> Search(string topic, string c1, string c2, string rt)
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


                // Commenting below line from 348 - 373, to check if Predicate logic, which is below 373 line works or not.

                using (var context = new ConceptsRelationDBEntities())
                {
                    saveAllCRList = context.SaveAllCRs.Where(tp => tp.Topic.TopicsName == topic).ToList<SaveAllCR>();


                    foreach (var item in saveAllCRList)
                    {
                        //
                        // The below logic is wrong, it has to be AND but if and only if the 
                        // values are not 0, if any either c1, c2, rt is 0, then neglect that in the filter, for which item.fkId == 0 with OR condition
                        //if (item.fC1Id == c1 || item.fC1Id == c2 || item.fRId == rt)
                        if((item.fC1Id == c1 || c1 == 0) && 
                            (item.fC2Id == c2 || c2 == 0) && 
                            (item.fRId == rt || rt == 0))
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





                //// 21 May 2019:  Predicate was not working thats why commented.
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
                //    //predicate = predicate.And(p => p.ConceptOne.C1Id.ToString().Contains(searchCriteria.concept1.ToString()));
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





                return topicDetailsEOList;

            }
            catch (Exception ex)
            {
                return null;
            }
        }

        private static bool SaveNewRTToDB(string RTNew)
        {
            int saveDetails = 0;
            try
            {
                using (ConceptsRelationDBEntities context = new ConceptsRelationDBEntities())
                {
                    context.Relations.Add(new Relation { RelationName = RTNew });
                    saveDetails = context.SaveChanges();
                }

                if(saveDetails >= 0)
                {



                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch(Exception ex)
            {
                return false;
            }
        }

        [WebMethod]
        public static List<ConceptOneEOModel> GetAllConceptOne(string c1Val)
        {
            List<ConceptOneEOModel> relEO = new List<ConceptOneEOModel>();
           
            using (ConceptsRelationDBEntities context = new ConceptsRelationDBEntities())
            {
                List<ConceptOne> lstRelations = new List<ConceptOne>();
                lstRelations = context.ConceptOnes.ToList();
                foreach (ConceptOne r in lstRelations)
                {
                    relEO.Add(new ConceptOneEOModel { id = r.C1Id, text = r.ConceptOneName });
                }

            }



            return relEO;
        }

        [WebMethod]
        public static List<ConceptOneEOModel> GetNewConceptOne(string newVal, string newType, string newProperty)
        {
            using (ConceptsRelationDBEntities context = new ConceptsRelationDBEntities())
            {

                context.ConceptOnes.Add(new ConceptOne { ConceptOneName = newVal });
         



            }


            //var client = new GraphClient(new Uri("http://localhost:11002/db/data"), "neo4j", "mohammed123805")
            //{
            //    JsonContractResolver = new CamelCasePropertyNamesContractResolver()
            //};

            //client.Connect();

            //var conceptOne = new ConceptOne1 { Name = newVal, description = newProperty };
            //client.Cypher
            //    .Create("(conceptone:ConceptOne {conceptB})")
            //    .WithParam("conceptB", conceptOne)
            //    .ExecuteWithoutResultsAsync()
            //    .Wait();




            if (SaveNewC1ToDB(newVal))
            {
                return GetAllConceptOne(null);
            }
            else { return null; }

        }

        [WebMethod]
        public static bool DeleteTopic(int topicId)
        {
            int count = 0;
            try
            {
                using (var context = new ConceptsRelationDBEntities())
                {
                    List<SaveAllCR> _allCRsForFilter = context.SaveAllCRs.Where(tp => tp.Id == topicId).ToList<SaveAllCR>();
                    foreach (SaveAllCR cr in _allCRsForFilter)
                    {
                        context.SaveAllCRs.Remove(cr);
                    }
                    count = context.SaveChanges();
                }

                if (count > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch(Exception ex)
            {
                return false;
            }
        }


        //[WebMethod]
        //public static List<ConceptOneEOModel> GetNewConceptOne(string val)
        //{
        //    if (SaveNewC1ToDB(val))
        //    {
        //        return GetAllConceptOne(null);
        //    }

        //    else { return null; }

        //}

        private static bool SaveNewC1ToDB(string c1NewVal)
        {

            int count = 0;

            try
            {
                using (ConceptsRelationDBEntities context = new ConceptsRelationDBEntities())
                {

                    context.ConceptOnes.Add(new ConceptOne { ConceptOneName = c1NewVal });
                    count = context.SaveChanges();

                }

                if (count > 0)
                {


                    var client = new GraphClient(new Uri("http://localhost:7474/db/data"), "neo4j", "ismail123")
                    {
                        JsonContractResolver = new CamelCasePropertyNamesContractResolver()
                    };

                    client.Connect();

                    var conceptOne = new ConceptOne1 { Name = c1NewVal };
                    client.Cypher
                        .Create("(conceptone:ConceptOne {conceptB})")
                        .WithParam("conceptB", conceptOne)
                        .ExecuteWithoutResultsAsync()
                        .Wait();



                    return true;
                }
                else { return false; }

            }

            catch (Exception es) { return false; }

        }

        [WebMethod]
        public static bool SaveTopic(string topic)
        {
            int count = 0;

            try
            {

                using (ConceptsRelationDBEntities context = new ConceptsRelationDBEntities())
                {
                    context.Topics.Add(new Topic { TopicsName = topic });
                    count = context.SaveChanges();
                }

                if (count > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch(Exception ex)
            {
                return false;
            }

        }

        [WebMethod]
        public static List<ConceptTwoEOModel> GetAllConceptTwo(string c2Val)
        {
            List<ConceptTwoEOModel> relEO = new List<ConceptTwoEOModel>();
            
            using (ConceptsRelationDBEntities context = new ConceptsRelationDBEntities())
            {
                List<ConceptTwo> lstRelations = new List<ConceptTwo>();
                lstRelations = context.ConceptTwoes.ToList();
                foreach (ConceptTwo r in lstRelations)
                {
                    relEO.Add(new ConceptTwoEOModel { id = r.C2Id, text = r.ConceptTwoName });
                }

            }



            return relEO;
        }

        [WebMethod]
        public static List<ConceptTwoEOModel> GetNewConceptTwo(string newVal, string newType, string newProperty)
        {
            //var client = new GraphClient(new Uri("http://localhost:11002/db/data"), "neo4j", "mohammed123805")
            //{
            //    JsonContractResolver = new CamelCasePropertyNamesContractResolver()
            //};

            //client.Connect();



            //var conceptTwo = new ConceptTwo2 { Name = newVal , description = newProperty };
            //client.Cypher
            //    .Create("(concepttwo:ConceptTwo {conceptB})")
            //    .WithParam("conceptB", conceptTwo)
            //    .ExecuteWithoutResultsAsync()
            //    .Wait();



            if (SaveNewC2ToDB(newVal))
            {
                return GetAllConceptTwo(null);
            }

            else { return null; }

        }

        private static bool SaveNewC2ToDB(string c2NewVal)
        {

            int count = 0;

            try
            {
                using (ConceptsRelationDBEntities context = new ConceptsRelationDBEntities())
                {

                    context.ConceptTwoes.Add(new ConceptTwo { ConceptTwoName = c2NewVal });
                    count = context.SaveChanges();

                }

                if (count > 0)
                {

                   



                    return true;
                }
                else { return false; }

            }

            catch (Exception ex) { return false; }
        }

        [WebMethod]
        public static bool SaveAllDetails(string topic, int rtVal, int c1Val, int c2Val, bool isEdit, int editTopicId)
        {
            int count = 0;
            Topic topicDBEntity = new Topic();
            List<SaveAllCR> saveAllCRList = new List<SaveAllCR>();
            List<TopicDetailsEOModel> topicDetailsEOList = new List<TopicDetailsEOModel>();
            try
            {

                using (var context = new ConceptsRelationDBEntities())
                {
                    topicDBEntity = context.Topics.Where(tp => tp.TopicsName == topic).FirstOrDefault();

                    if (!isEdit && editTopicId == 0)
                    {
                        //Save new record
                        context.SaveAllCRs.Add(
                            new SaveAllCR
                            {
                                fTopicId = topicDBEntity.TopicID,
                                fRId = rtVal,
                                fC1Id = c1Val,
                                fC2Id = c2Val
                            });
                    }
                    else
                    {
                        // Update Existing record
                        //var result = context.SaveAllCRs.SingleOrDefault(tp => tp.Topic.TopicsName == topic &&
                        //                                                    tp.fC1Id == c1Val &&
                        //                                                    tp.fC1Id == c2Val &&
                        //                                                    tp.fRId == rtVal
                        //                                                    );
                        var result = context.SaveAllCRs.SingleOrDefault(tp => tp.Id == editTopicId);
                        if (result != null)
                        {
                            result.fC1Id = c1Val;
                            result.fC2Id = c2Val;
                            result.fRId = rtVal;
                        }
                    }
                    count = context.SaveChanges();
                }

                if (count > 0)
                {
                    using (var context = new ConceptsRelationDBEntities())
                    {
                        //Home1 hm1 = new Home1();
                        //hm1.grdvConceptRelation.DataSource = context.MasterConceptRelations.Where(c => c.TopicName == "Topic 2").ToList<MasterConceptRelation>();
                        //hm1.grdvConceptRelation.DataBind();
                    }

                   

                    using (var context = new ConceptsRelationDBEntities())
                    {
                        saveAllCRList = context.SaveAllCRs.Where(tp => tp.Topic.TopicsName == topic && tp.Relation.RelID==rtVal && tp.ConceptOne.C1Id== c1Val && tp.ConceptTwo.C2Id== c2Val).ToList<SaveAllCR>();

                        foreach (SaveAllCR cr in saveAllCRList)
                        {

                            TopicDetailsEOModel tdEoModel = new TopicDetailsEOModel();
                            tdEoModel.TopicDetailsId = cr.Id;
                            tdEoModel.ConceptOne = cr.ConceptOne.ConceptOneName;
                            tdEoModel.ConceptTwo = cr.ConceptOne1.ConceptOneName;
                            tdEoModel.RelationType = cr.Relation.RelationName;
                            tdEoModel.TopicName = cr.Topic.TopicsName;

                            topicDetailsEOList.Add(tdEoModel);

                            //topicDetailsEOList.Add(new TopicDetailsEOModel
                            //{
                            //    TopicDetailsId = cr.Id,
                            //    ConceptOne = cr.ConceptOne.ConceptOneName,
                            //    ConceptTwo = cr.ConceptTwo.ConceptTwoName,
                            //    RelationType = cr.Relation.RelationName,
                            //    TopicName = cr.Topic.TopicsName
                            //});
                        }
                    }

                    var client = new GraphClient(new Uri("http://localhost:7474/db/data"), "neo4j", "ismail123")
                    {
                        JsonContractResolver = new CamelCasePropertyNamesContractResolver()
                    };

                    client.Connect();
                    List<string> con1list = topicDetailsEOList.Select(X => X.ConceptOne).Distinct().ToList();
                    string concept1 = string.Join(",", con1list);
                    List<string> con2list = topicDetailsEOList.Select(X => X.ConceptTwo).Distinct().ToList();
                    string concept2 = string.Join(",", con2list);
                    List<string> rellist = topicDetailsEOList.Select(X => X.RelationType).Distinct().ToList();
                    string relation = string.Join(",", rellist);
                    string rel = "(conceptone1)-[:" + relation + "]->(conceptone2)";

                    client.Cypher
                        .Match("(conceptone1:ConceptOne)", "(conceptone2:ConceptOne)")
                        .Where((ConceptOne1 conceptone1) => conceptone1.Name == concept1)
                        .AndWhere((ConceptOne1 conceptone2) => conceptone2.Name == concept2)
                        .Create(rel)
                        .ExecuteWithoutResultsAsync()
                        .Wait();

                    return true;
                }
                else
                    return false;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        [WebMethod]
        public static List<TopicDetailsEOModel> GetAllDetailsForTopic(string topic)
        {
            

            int count = 0;
            List<SaveAllCR> saveAllCRList = new List<SaveAllCR>();
            //SaveAllCR saveAllCR = new SaveAllCR();

            //Relation relation = new Relation();
            //ConceptOne c1Details = new ConceptOne();
            //ConceptTwo c2Details = new ConceptTwo();
            //Topic topicDBEntity = new Topic();

            List<TopicDetailsEOModel> topicDetailsEOList = new List<TopicDetailsEOModel>();

            try
            {

                using (var context = new ConceptsRelationDBEntities())
                {
                    saveAllCRList = context.SaveAllCRs.Where(tp => tp.Topic.TopicsName == topic).ToList< SaveAllCR>();

                    foreach(SaveAllCR cr in saveAllCRList)
                    {


                        TopicDetailsEOModel tdEoModel = new TopicDetailsEOModel();
                        tdEoModel.TopicDetailsId = cr.Id;
                        tdEoModel.ConceptOne = cr.ConceptOne.ConceptOneName;
                        tdEoModel.ConceptTwo = cr.ConceptOne1.ConceptOneName;
                        tdEoModel.RelationType = cr.Relation.RelationName;
                        tdEoModel.TopicName = cr.Topic.TopicsName;

                        topicDetailsEOList.Add(tdEoModel);

                        //topicDetailsEOList.Add(new TopicDetailsEOModel
                        //{
                        //    TopicDetailsId = cr.Id,
                        //    ConceptOne = cr.ConceptOne.ConceptOneName,
                        //    //ConceptTwo = cr.ConceptTwo.ConceptTwoName,
                        //    ConceptTwo = cr.ConceptOne.ConceptOneName,
                        //    RelationType = cr.Relation.RelationName,
                        //    TopicName = cr.Topic.TopicsName
                        //});
                    }
                }

                return topicDetailsEOList;

            }
            catch (Exception ex)
            {
                return null;
            }
        }


        //private void LoadGrid()
        //{
        //    grdvConceptRelation.DataSource = context.MasterConceptRelations.Where(c => c.TopicName == "Topic 2").ToList<MasterConceptRelation>();
        //    grdvConceptRelation.DataBind();
        //}

        protected void SaveConceptsRelation_Click(object sender, EventArgs e)
        {



            //string value = Request.Form["txtBox1"];

            //using (ConceptsRelationDBEntities1 context = new ConceptsRelationDBEntities1())
            //{
            //    context.ConceptsRelations.Add(new ConceptsRelation { ConceptOne = txtConcept1.Text, ConceptTwo = txtConcept2.Text,
            //            RelationType = tags1.Text });


            //    context.SaveChanges();
            //}


        }

        protected void btnUploadFile_Click(object sender, EventArgs e)
        {
            if (FileUploadContent.HasFile)
            {
                try
                {

                    DirectoryInfo convertedDocsDirectory =
                                    new DirectoryInfo(Server.MapPath(DocxConvertedToHtmlDirectory));

                    if (!convertedDocsDirectory.Exists)
                        convertedDocsDirectory.Create();

                    fileNameFromUser = string.Empty;
                    fileNameFromUser = FileUploadContent.FileName;

                    if (Path.GetExtension(fileNameFromUser) == ".pdf")
                    {
                        string noSpaceFileName = fileNameFromUser.Replace(" ", "");
                        //File.Copy()
                        Session["ByteArray"] = FileUploadContent.FileBytes;
                        Session["FileNameFromUser"] = noSpaceFileName;

                        byte[] pdfByteArray = (byte[])(Session["ByteArray"]);

                        if (pdfByteArray != null)
                        {
                            try
                            {
                                File.WriteAllBytes(convertedDocsDirectory + noSpaceFileName, pdfByteArray);

                                iframeDocViewer.Controls.Add(new LiteralControl("<embed width='700' height='315' " +
                                    "src=" + @"DocxConvertedToHtml\" + noSpaceFileName + "></embed><br />"));
                            }
                            catch (Exception ex) {
                                Session["ByteArray"] = null;
                                Session["FileNameFromUser"] = null;
                            }
                        }
                    }
                    else
                    {
                        var fiFileName = new FileInfo(fileNameFromUser);

                        if (Util.IsWordprocessingML(fiFileName.Extension))
                        {
                            using (MemoryStream memoryStream = new MemoryStream())
                            {
                                memoryStream.Write(FileUploadContent.FileBytes, 0,
                                    FileUploadContent.FileBytes.Length);

                                //using (WordprocessingDocument wDoc =
                                //    WordprocessingDocument.Open(memoryStream, true))
                                //{
                                //}

                                lblMessage.Text = "File Uploaded Successfully";
                                Session["ByteArray"] = FileUploadContent.FileBytes;
                                Session["FileNameFromUser"] = fileNameFromUser;
                            }
                        }
                        else
                        {
                            lblMessage.Text = "Error: Not a WordprocessingML document";
                            Session["ByteArray"] = null;
                            Session["FileNameFromUser"] = null;

                        }

                        byte[] byteArray = (byte[])(Session["ByteArray"]);

                        if (byteArray != null)
                        {
                            try
                            {
                                //convertedDocsDirectory =
                                //    new DirectoryInfo(Server.MapPath(DocxConvertedToHtmlDirectory));

                                //if (!convertedDocsDirectory.Exists)
                                //    convertedDocsDirectory.Create();

                                Guid g = Guid.NewGuid();
                                var htmlFileName = Session["FileNameFromUser"].ToString().Replace(".docx", "").Replace(" ", "$sPaC" +
                                    "" +
                                    "e$").ToString()
                                    + "_" + g.ToString() + ".html";
                                ConvertToHtml(byteArray
                                    , convertedDocsDirectory, htmlFileName);

                                iframeDocViewer.Controls.Add(new LiteralControl("<iframe width='600' height='315' " +
                                    "src=" + @"DocxConvertedToHtml\" + htmlFileName + "></iframe><br />"));

                            }
                            catch (Exception ex)
                            {
                                lblMessage.Text = "Error: " + ex.Message.ToString();
                            }
                        }
                        else
                        {
                            lblMessage.Text = "You have not specified a file.";
                        }
                    }

                }

                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message.ToString();
                    Session["ByteArray"] = null;
                    Session["FileNameFromUser"] = null;
                }
            }
            else
            {
                lblMessage.Text = "You have not specified a file.";
                Session["ByteArray"] = null;
                Session["FileNameFromUser"] = null;

            }

            
        }

        private static void ConvertToHtml(byte[] byteArray, DirectoryInfo destDirectory,
            string htmlFileName)
        {
            FileInfo fiHtml = new FileInfo(Path.Combine(destDirectory.FullName, htmlFileName));
            using (MemoryStream memoryStream = new MemoryStream())
            {
                memoryStream.Write(byteArray, 0, byteArray.Length);
                using (WordprocessingDocument wDoc =
                        WordprocessingDocument.Open(memoryStream, true))
                {
                    var imageDirecotryFullName =
                        fiHtml.FullName.Substring(0, fiHtml.FullName.Length - fiHtml.Extension.Length) + "_files";
                    var imageDirectoryRelativeName =
                        fiHtml.Name.Substring(0, fiHtml.Name.Length - fiHtml.Extension.Length) + "_files";
                    int imageCounter = 0;
                    //var pageTitle = (string)wDoc
                    //                .CoreFilePropertiesPart
                    //                .GetXDocument()
                    //                .Descendants(DC.title)
                    //                .FirstOrDefault();
                    HtmlConverterSettings settings = new HtmlConverterSettings()
                    {
                        PageTitle = "File",
                        FabricateCssClasses = true,
                        CssClassPrefix = "pt-",
                        RestrictToSupportedLanguages = false,
                        RestrictToSupportedNumberingFormats = false,
                        ImageHandler = imageInfo =>
                        {
                            DirectoryInfo localDirInfo = new DirectoryInfo(imageDirecotryFullName);
                            if (!localDirInfo.Exists)
                                localDirInfo.Create();
                            ++imageCounter;
                            string extension = imageInfo.ContentType.Split('/')[1].ToLower();
                            ImageFormat imageFormat = null;
                            if (extension == "png")
                            {
                                extension = "gif";
                                imageFormat = ImageFormat.Gif;
                            }
                            else if (extension == "gif")
                                imageFormat = ImageFormat.Gif;
                            else if (extension == "bmp")
                                imageFormat = ImageFormat.Bmp;
                            else if (extension == "jpeg")
                                imageFormat = ImageFormat.Jpeg;
                            else if (extension == "tiff")
                            {
                                extension = "gif";
                                imageFormat = ImageFormat.Gif;
                            }
                            else if (extension == "x-wmf")
                            {
                                extension = "wmf";
                                imageFormat = ImageFormat.Wmf;
                            }

                            if (imageFormat == null)
                                return null;

                            FileInfo imageFileName = new FileInfo(imageDirecotryFullName + "/image" +
                                imageCounter.ToString() + "." + extension);
                            try
                            {
                                imageInfo.Bitmap.Save(imageFileName.FullName, imageFormat);
                            }
                            catch (System.Runtime.InteropServices.ExternalException)
                            {
                                return null;
                            }

                            XElement img = new XElement(Xhtml.img,
                                new XAttribute(NoNamespace.src, imageDirectoryRelativeName + "/" + imageFileName.Name),
                                imageInfo.ImgStyleAttribute,
                                imageInfo.AltText != null ?
                                    new XAttribute(NoNamespace.alt, imageInfo.AltText) : null);

                            return img;


                        }
                    };

                    // XElement html = HtmlConverter.ConvertToHtml(wDoc, settings);
                    XElement html = HtmlConverter.ConvertToHtml(wDoc, settings);


                    var body = html.Descendants(Xhtml.body).First();
                    //body.AddFirst(
                    //    new XElement(Xhtml.p,
                    //        new XElement(Xhtml.a,
                    //            new XAttribute("href", "WebForm1.aspx"), "Go back to upload page")));

                    var htmlString = html.ToString(SaveOptions.DisableFormatting);

                    File.WriteAllText(fiHtml.FullName, htmlString, Encoding.UTF8);

                }
            }
        }
    }
}