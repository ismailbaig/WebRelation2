using DocumentFormat.OpenXml.Packaging;
using LinqKit;
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


            lblTopicID.Text = Request.QueryString["TopicID"];
            string id = lblTopicID.Text;
            using (var context = new ConceptsRelationDBEntities())
            {
                grdvConceptRelation.DataSource = context.MasterConceptRelations.Where(c => c.TopicID == id).ToList<MasterConceptRelation>();
                grdvConceptRelation.DataBind();
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
        public static List<RelationsEOModel> GetNewRT(string rtNew)
        {
            if (SaveNewRTToDB(rtNew)) {
                return GetAllRelations(rtNew);
            } else  {
                return null;
            }
        }

        [WebMethod]
        public static List<TopicDetailsEOModel> Search(string topic, int c1, int c2, int rt)
        //public static List<TopicDetailsEOModel> Search(string topic, string c1, string c2, string rt)
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
                    concept1 = c1,
                    concept2 = c2,
                    relationType = rt
                };

                var predicate = PredicateBuilder.New<SaveAllCR>();
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
                if(searchCriteria.relationType.ToString() != "0")
                {
                    predicate = predicate.And(p => p.Relation.RelID.ToString().Contains(searchCriteria.relationType.ToString()));
                }
                using (var context = new ConceptsRelationDBEntities())
                {
                    saveAllCRList = context.SaveAllCRs.
                        Where( predicate.Compile())
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
        public static List<ConceptOneEOModel> GetNewConceptOne(string val)
        {
            if (SaveNewC1ToDB(val))
            {
                return GetAllConceptOne(null);
            }

            else { return null; }
            
        }

        private static bool SaveNewC1ToDB(string c1NewVal) {

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
                    return true;
                }
                else { return false; }
                    
            }

            catch(Exception es) { return false; }
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
        public static List<ConceptTwoEOModel> GetNewConceptTwo(string c2NewVal)
        {
            if (SaveNewC2ToDB(c2NewVal))
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
        public static bool SaveAllDetails(string topic, int rtVal, int c1Val, int c2Val)
        {
            int count = 0;
            Topic topicDBEntity = new Topic();
            try
            {

                using (var context = new ConceptsRelationDBEntities())
                {
                     topicDBEntity = context.Topics.Where(tp => tp.TopicsName == topic).FirstOrDefault();

                }

                using (ConceptsRelationDBEntities context = new ConceptsRelationDBEntities())
                {
                    context.SaveAllCRs.Add(
                        new SaveAllCR
                        {
                            fTopicId = topicDBEntity.TopicID,
                            fRId = rtVal,
                            fC1Id = c1Val,
                            fC2Id = c2Val
                        });
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
                    saveAllCRList = context.SaveAllCRs.Where(tp => tp.Topic.TopicsName == topic).ToList< SaveAllCR>();

                    foreach(SaveAllCR cr in saveAllCRList)
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
                    fileNameFromUser = string.Empty;
                    fileNameFromUser = FileUploadContent.FileName;

                    var fiFileName = new FileInfo(fileNameFromUser);
                    if (Util.IsWordprocessingML(fiFileName.Extension))
                    {
                        using (MemoryStream memoryStream = new MemoryStream())
                        {
                            memoryStream.Write(FileUploadContent.FileBytes, 0,
                                FileUploadContent.FileBytes.Length);

                            using (WordprocessingDocument wDoc =
                                WordprocessingDocument.Open(memoryStream, true))
                            {
                            }

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

            byte[] byteArray = (byte[])(Session["ByteArray"]);

            if (byteArray != null)
            {
                try
                {
                    DirectoryInfo convertedDocsDirectory =
                        new DirectoryInfo(Server.MapPath(DocxConvertedToHtmlDirectory));

                    if (!convertedDocsDirectory.Exists)
                        convertedDocsDirectory.Create();

                    Guid g = Guid.NewGuid();
                    var htmlFileName = Session["FileNameFromUser"].ToString().Replace(".docx", "").Replace(" ", "$sPaC" +
                        "" +
                        "e$").ToString()
                        + "_" + g.ToString() + ".html";
                    ConvertToHtml(byteArray
                        , convertedDocsDirectory, htmlFileName);

                    //Store in Database the file name and path
                    //using (ConceptsRelationDBEntities1 context = new ConceptsRelationDBEntities1())
                    //{
                    //    context.MasterFiles.Add(new MasterFile
                    //    {
                    //        FilePath = convertedDocsDirectory.Name + @"\" + htmlFileName,
                    //        Name = htmlFileName
                    //    });

                    //    context.SaveChanges();
                    //}

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