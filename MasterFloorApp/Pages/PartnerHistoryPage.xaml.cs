using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace MasterFloorApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для PartnerHistoryPage.xaml
    /// </summary>
    public partial class PartnerHistoryPage : Page
    {
        public PartnerHistoryPage()
        {
            InitializeComponent();
        }
        public void Init()
        {
            HistoryViewListView.ItemsSource = Data.databasefloorEntities.GetContext().InfoProduct.ToList();
        }
    }
}
