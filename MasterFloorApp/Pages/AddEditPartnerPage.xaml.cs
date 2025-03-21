﻿using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Data.Entity.Validation;
using MasterFloorApp.Data;

namespace MasterFloorApp.Pages
{
    public partial class AddEditPartnerPage : Page
    {
        
        private InfoPartner _currentPartner;
        private databasefloorEntities _context = databasefloorEntities.GetContext();

        public AddEditPartnerPage(InfoPartner selectedPartner)
        {
            InitializeComponent();
            _currentPartner = selectedPartner ?? new InfoPartner();
            DataContext = _currentPartner;

            if (FindName("DirectorComboBox") is ComboBox directorComboBox)
            {
                var directors = _context.Directors.Select(d => new { d.IdDirector, FullName = d.LastName + " " + d.FirstName + " " + d.Middlename }).ToList();
                directorComboBox.ItemsSource = directors;
                directorComboBox.SelectedValuePath = "IdDirector";
                directorComboBox.DisplayMemberPath = "FullName";
            }

            if (FindName("PartnerTypeComboBox") is ComboBox partnerTypeComboBox)
            {
                var partnerTypes = _context.PartnerType.Select(pt => new { pt.IdPartnerType, pt.Name }).ToList();
                partnerTypeComboBox.ItemsSource = partnerTypes;
                partnerTypeComboBox.SelectedValuePath = "IdPartnerType";
                partnerTypeComboBox.DisplayMemberPath = "Name";
            }

            if (FindName("AddressComboBox") is ComboBox addressComboBox)
            {
                var addresses = _context.Adress
                    .Join(_context.Index, a => a.IdIndex, i => i.IdIndex, (a, i) => new { a, IndexName = i.IndexName })
                    .Join(_context.Areas, ai => ai.a.AreaId, ar => ar.AreaId, (ai, ar) => new { ai.a, ai.IndexName, AreaName = ar.AreaName })
                    .Join(_context.Cities, aai => aai.a.CityId, c => c.CityId, (aai, c) => new { aai.a, aai.IndexName, aai.AreaName, CityName = c.CityName })
                    .Join(_context.Streets, aac => aac.a.StreetId, s => s.IdStreet, (aac, s) => new
                    {
                        aac.a.IdAdress,
                        FullAddress = $"{aac.IndexName}, {aac.AreaName}, {aac.CityName}, {s.StreetName}, {aac.a.HouseNumber}"
                    }).ToList();
                addressComboBox.ItemsSource = addresses;
                addressComboBox.SelectedValuePath = "IdAdress";
                addressComboBox.DisplayMemberPath = "FullAddress";
            }
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (_currentPartner.IdInfoPartner == 0)
                    _context.InfoPartner.Add(_currentPartner);

                _context.SaveChanges();
                MessageBox.Show("Данные сохранены", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                NavigationService.GoBack();
            }
            catch (DbEntityValidationException ex)
            {
                string errorMessage = "Ошибка валидации:";
                foreach (var validationErrors in ex.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                        errorMessage += $"\n- {validationError.PropertyName}: {validationError.ErrorMessage}";
                    }
                }
                MessageBox.Show(errorMessage, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }



    }
}













/*using MasterFloorApp.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
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
        public Data.InfoPartner Partner = new Data.InfoPartner();
        public string FlagAddOrEdit = "default";
        public bool FlagPhoto = false;
        public AddEditPartnerPage(Data.InfoPartner _partner)
        {
            InitializeComponent();

            if (_partner != null)
            {
                Partner = _partner;
                FlagAddOrEdit = "edit";
            }
            else
            {
                FlagAddOrEdit = "add";
            }

            DataContext = Partner;

            Init();
        }

        public void Init()
        {
            try
            {
                PartnerTypeComboBox.ItemsSource = Data.databasefloorEntities.GetContext().PartnerType.ToList();
                DirectorComboBox.ItemsSource = Data.databasefloorEntities.GetContext().Directors.ToList();
                INNComboBox.ItemsSource = Data.databasefloorEntities.GetContext().INN.ToList();
                AddressComboBox.ItemsSource = Data.databasefloorEntities.GetContext().Adress.ToList();
                if (FlagAddOrEdit == "add")
                {
                    IdTextBox.Text = Data.databasefloorEntities.GetContext().InfoPartner.Max(d => d.IdInfoPartner + 1).ToString();
                    DirectorComboBox.SelectedItem = null;
                    PartnerTypeComboBox.SelectedItem = null;
                    INNComboBox.SelectedItem = null;
                    AddressComboBox.SelectedItem = null;
                    EmailTextBox.Text = string.Empty;
                    PhoneTextBox.Text = string.Empty;
                    RatingTextBox.Text = string.Empty;      
                }
                else if (FlagAddOrEdit == "edit")
                {
                    IdTextBox.Visibility = Visibility.Visible;                    

                    IdTextBox.Text = Partner.IdInfoPartner.ToString();

                     DirectorComboBox.SelectedItem = Data.databasefloorEntities.GetContext().Directors
                        .Where(d => d.IdDirector == Partner.IdDirector).FirstOrDefault();
                    PartnerTypeComboBox.SelectedItem = Data.databasefloorEntities.GetContext().PartnerType
                        .Where(d => d.IdPartnerType == Partner.IdPartnerType).FirstOrDefault();
                    INNComboBox.SelectedItem = Data.databasefloorEntities.GetContext().INN
                        .Where(d => d.IdINN == Partner.IdINN).FirstOrDefault();
                    AddressComboBox.SelectedItem = Data.databasefloorEntities.GetContext().Adress
                        .Where(d => d.IdAdress == Partner.IdAdress).FirstOrDefault(); 

                    DirectorComboBox.SelectedValue = Partner.IdDirector;
                    PartnerTypeComboBox.SelectedValue = Partner.IdPartnerType;
                    INNComboBox.SelectedValue = Partner.IdINN;
                    AddressComboBox.SelectedValue = Partner.IdAdress;


                    EmailTextBox.Text = Partner.PartnerEmail.ToString();
                    PhoneTextBox.Text = Partner.Phone.ToString();
                    RatingTextBox.Text = Partner.Rating.ToString();
                }

            }
            catch
            {

            }
        }
        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            if (Classes.Manager.MainFrame.CanGoBack)
            {
                Classes.Manager.MainFrame.GoBack();
            }

        }

        
        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            if (!ValidateInputs())
                return;

            Partner.IdPartnerType = (int)PartnerTypeComboBox.SelectedValue;
            Partner.IdDirector = (int)DirectorComboBox.SelectedValue;
            Partner.IdINN = (int)INNComboBox.SelectedValue;
            Partner.IdAdress = (int)AddressComboBox.SelectedValue;
            Partner.PartnerEmail = EmailTextBox.Text;
            Partner.Phone = PhoneTextBox.Text;

            if (!int.TryParse(RatingTextBox.Text, out int rating) || rating < 0)
            {
                MessageBox.Show("Некорректное значение рейтинга!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            Partner.Rating = rating;

            if (FlagAddOrEdit == "add")
            {
                Data.databasefloorEntities.GetContext().InfoPartner.Add(Partner);
            }

            try
            {
                Data.databasefloorEntities.GetContext().SaveChanges();
                MessageBox.Show("Данные сохранены", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                NavigationService?.GoBack();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка сохранения: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private bool ValidateInputs()
        {
            if (string.IsNullOrWhiteSpace(EmailTextBox?.Text) ||
                string.IsNullOrWhiteSpace(PhoneTextBox?.Text) ||
                PartnerTypeComboBox?.SelectedValue == null ||
                DirectorComboBox?.SelectedValue == null ||
                INNComboBox?.SelectedValue == null ||
                AddressComboBox?.SelectedValue == null)
            {
                MessageBox.Show("Заполните все обязательные поля!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return false;
            }
            return true;
        }

        

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                StringBuilder errors = new StringBuilder();
                if (string.IsNullOrEmpty(NameTextBox.Text))
                {
                    errors.AppendLine("Зполните наименование");
                }
                if (CategoryComboBox.SelectedItem == null)
                {
                    errors.AppendLine("Необходимо выбрать категорию");
                }
                if (string.IsNullOrEmpty(CountTextBox.Text))
                {
                    errors.AppendLine("Заполните к-во");
                }
                else
                {
                    var countParse = Int32.TryParse(CountTextBox.Text, out var result);
                    if (!(countParse && result >= 0))
                    {
                        errors.AppendLine("К-во - целое и положительное");
                    }
                }


                if (string.IsNullOrEmpty(SupplierTextBox.Text))
                {
                    errors.AppendLine("Заполните поставщика");
                }
                if (string.IsNullOrEmpty(CostTextBox.Text))
                {
                    errors.AppendLine("Заполните стоимость");
                }
                else
                {
                    var costParse = Decimal.TryParse(CostTextBox.Text, out var result);
                    if (!(costParse && result >= 0))
                    {
                        errors.AppendLine("Стоимость - дробное и положительное число");
                    }
                    else
                    {
                        string[] parts = CostTextBox.Text.Split(',');
                        if (parts.Length != 2 || parts[1].Length != 2)
                        {
                            errors.AppendLine("Число должно иметь два знака после запятой");
                        }
                    }

                }
                if (FlagPhoto == false)
                {
                    errors.AppendLine("Выберите изображение!");
                }
                if (string.IsNullOrEmpty(UnitTextBox.Text))
                {
                    errors.AppendLine("Заполните ед. измерения");
                }
                if (string.IsNullOrEmpty(DescriptionTextBox.Text))
                {
                    errors.AppendLine("Заполните описание");
                }

                if (errors.Length > 0)
                {
                    MessageBox.Show(errors.ToString(), "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
                var searchName = (from item in Data.database1Entities.GetContext().NameProduct
                                  where item.NameProduct1 == NameTextBox.Text
                                  select item).FirstOrDefault();

                if (searchName != null)
                {
                    CurrentProduct.IdNameProduct = searchName.id;
                }
                else
                {
                    Data.NameProduct productName = new Data.NameProduct()
                    {
                        NameProduct1 = NameTextBox.Text
                    };
                    Data.database1Entities.GetContext().NameProduct.Add(productName);
                    Data.database1Entities.GetContext().SaveChanges();
                    CurrentProduct.IdNameProduct = productName.id;
                }

                var searchPostav = (from item in Data.database1Entities.GetContext().Supplier
                                    where item.Supplier1 == SupplierTextBox.Text
                                    select item).FirstOrDefault();

                if (searchPostav != null)
                {
                    CurrentProduct.Supplier = searchPostav.id;
                }
                else
                {
                    Data.Supplier supplierName = new Data.Supplier()
                    {
                        Supplier1 = SupplierTextBox.Text
                    };
                    Data.database1Entities.GetContext().Supplier.Add(supplierName);
                    Data.database1Entities.GetContext().SaveChanges();
                    CurrentProduct.Supplier = supplierName.id;
                }



                var searchUnit = (from item in Data.database1Entities.GetContext().Unit
                                  where item.Name == UnitTextBox.Text
                                  select item).FirstOrDefault();

                if (searchUnit != null)
                {
                    CurrentProduct.IdUnit = searchUnit.Id;
                }
                else
                {
                    Data.Unit unitName = new Data.Unit()
                    {
                        Name = UnitTextBox.Text
                    };
                    Data.database1Entities.GetContext().Unit.Add(unitName);
                    Data.database1Entities.GetContext().SaveChanges();
                    CurrentProduct.IdUnit = unitName.Id;
                }

                CurrentProduct.ProductQuantityInStock = Convert.ToInt32(CountTextBox.Text);
                CurrentProduct.ProductCost = Convert.ToDecimal(CostTextBox.Text);
                CurrentProduct.ProductDescription = DescriptionTextBox.Text;

                var selectCategory = CategoryComboBox.SelectedItem as Data.Cotegory;
                CurrentProduct.ProductCategory = selectCategory.id;

                if (FlagAddOrEdit == "add")
                {
                    Data.database1Entities.GetContext().Product.Add(CurrentProduct);
                    Data.database1Entities.GetContext().SaveChanges();
                    MessageBox.Show("Успешно добавлено!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                }
                else if (FlagAddOrEdit == "edit")
                {
                    Data.database1Entities.GetContext().SaveChanges();
                    MessageBox.Show("Успешно сохранено!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);

                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }

        }

    }
}*/
