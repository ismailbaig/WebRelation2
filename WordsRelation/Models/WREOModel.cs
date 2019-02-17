using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WordsRelation.Models
{
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
}