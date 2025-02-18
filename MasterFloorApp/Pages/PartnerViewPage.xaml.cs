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
    /// Логика взаимодействия для PartnerViewPage.xaml
    /// </summary>
    public partial class PartnerViewPage : Page
    {
        public PartnerViewPage()
        {
            InitializeComponent();
            Init();
        }
        public void Init()
        {
            try
            {
                PartnerListView.ItemsSource = Data.databaseEntities.GetContext().InfoPartner.ToList();
            }
            catch { }
            
        }
        public List<Data.InfoPartner> _infoPartner = Data.databaseEntities.GetContext().InfoPartner.ToList();

        public void Update()
        {
            try
            {
                _infoPartner = Data.databaseEntities.GetContext().InfoPartner.ToList();

            }
            catch { }

        }
        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.AddEditPartnerPage(null));
        }
    }
}
