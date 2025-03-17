using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Windows.Controls;
using MasterFloorApp.Data;

namespace MasterFloorApp.Classes
{
    internal class Manager
    {
        public static Frame MainFrame { get; set; }
        public class PartnerViewModel
        {
            public InfoPartner Partner { get; set; }
            public int Discount { get; set; }
        }

    }
}
