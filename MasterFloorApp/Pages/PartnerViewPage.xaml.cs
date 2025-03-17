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
using MasterFloorApp.Classes;
using MasterFloorApp.Data;

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
            LoadPartners();
        }
        
        public List<Data.InfoPartner> _infoPartner = Data.databasefloorEntities.GetContext().InfoPartner.ToList();

        public void Update()
        {
            try
            {
                _infoPartner = Data.databasefloorEntities.GetContext().InfoPartner.ToList();

            }
            catch { }

        }

        private void LoadPartners()
        {
            var db = databasefloorEntities.GetContext();

            var sales = db.InfoProduct
                .GroupBy(s => s.IdPartner)
                .ToDictionary(g => g.Key, g => g.Sum(s => s.ProductAmount));

            PartnerListView.ItemsSource = db.InfoPartner
                .ToList()
                .Select(p => new Manager.PartnerViewModel
                {
                    Partner = p,
                    Discount = GetDiscount(sales.TryGetValue(p.IdPartner, out int total) ? total : 0)
                })
                .ToList();
        }

        private int GetDiscount(int total)
        {
            switch (total.ToString())
            {
                case string s when total >= 300000:
                    return 15;
                case string s when total >= 50000:
                    return 10;
                case string s when total >= 10000:
                    return 5;
                default:
                    return 0;
            }
        }



        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.AddEditPartnerPage(null));
        }
    }
}
