using MasterFloorApp.Data;
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
    public partial class AddEditPartnerPage : Page
    {
        private InfoPartner _currentPartner;

        public AddEditPartnerPage(InfoPartner selectedPartner)
        {
            InitializeComponent();
            _currentPartner = selectedPartner ?? new InfoPartner();
            DataContext = _currentPartner;

            PartnerTypeComboBox.ItemsSource = databasefloorEntities.GetContext().PartnerType.ToList();
            PartnerTypeComboBox.DisplayMemberPath = "Name";
            PartnerTypeComboBox.SelectedValuePath = "IdPartnerType";

            PartnerComboBox.ItemsSource = databasefloorEntities.GetContext().Partner.ToList();
            PartnerComboBox.DisplayMemberPath = "Name";
            PartnerComboBox.SelectedValuePath = "IdPartner";

            INNComboBox.ItemsSource = databasefloorEntities.GetContext().INNs.ToList();
            INNComboBox.DisplayMemberPath = "INN";
            INNComboBox.SelectedValuePath = "IdINN";

            AddressComboBox.ItemsSource = databasefloorEntities.GetContext().Addresses.ToList();
            AddressComboBox.DisplayMemberPath = "IdAdress";
            AddressComboBox.SelectedValuePath = "IdAdress";
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(EmailTextBox.Text) || string.IsNullOrWhiteSpace(PhoneTextBox.Text))
            {
                MessageBox.Show("Заполните все обязательные поля!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            if (_currentPartner.IdInfoPart == 0)
            {
                databasefloorEntities.GetContext().InfoPartners.Add(_currentPartner);
            }

            try
            {
                databasefloorEntities.GetContext().SaveChanges();
                MessageBox.Show("Данные сохранены", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                NavigationService.GoBack();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка сохранения: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
