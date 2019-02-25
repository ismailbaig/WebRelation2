using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WordsRelation.Models
{
    public class OldTopicEOModel
    {
        public int c1 { get; set; }
        public int c2 { get; set; }
        public int rt { get; set; }
    };


    public class RelationsEOModel
    {
        public int id { get; set; }
        public string text { get; set; }
    }

    public class ConceptOneEOModel
    {
        public int id { get; set; }
        public string text { get; set; }
    }

    public class ConceptTwoEOModel
    {
        public int id { get; set; }
        public string text { get; set; }
    }

    public class TopicDetailsEOModel
    {
        public int TopicDetailsId { get; set; }
        public int fRelationId { get; set; }
        public int fC1Id { get; set; }
        public int fC2Id { get; set; }
        public string RelationType { get; set; }
        public string ConceptOne { get; set; }
        public string ConceptTwo { get; set; }
        public string TopicName { get; set; }
    }
   

    public class CRType
    {
        public string relationType { get; set; }
        public string concept1 { get; set; }
        public string concept2 { get; set; }
    }
}