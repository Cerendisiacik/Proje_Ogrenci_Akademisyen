﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using Proje_Ogrenci_Akademisyen.Entity;

namespace Proje_Ogrenci_Akademisyen.Formlar
{
    public partial  class FrmOgrenciKayıt : Form
    {
        public FrmOgrenciKayıt()
        {
            InitializeComponent();
        }
        //Data Source = (localdb)\MSSQLLocalDB;Initial Catalog = OgrenciSinav; Integrated Security = True
        SqlConnection baglanti = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=OgrenciSinav;Integrated Security=True");

        OgrenciSinavEntities1 db = new OgrenciSinavEntities1();
        private void FrmOgrenciKayıt_Load(object sender, EventArgs e)
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand("Select * From TblBolum", baglanti);
            //SqlDataReader dr = komut.ExecuteReader();
            SqlDataAdapter da = new SqlDataAdapter(komut);
            DataTable ds = new DataTable();
            da.Fill(ds);
            comboBox1.ValueMember = "BolumID";
            comboBox1.DisplayMember = "BolumAd";
            comboBox1.DataSource = ds;
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void BtnKaydet_Click(object sender, EventArgs e)
        {
            //textBox1.Text = comboBox1.SelectedValue.ToString();
            if (txtSifre.Text == txtSifreTekrar.Text)
            {
                TblOgrenci t = new TblOgrenci();
                t.OgrAd = txtAd.Text;
                t.OgrSoyad = txtSoyad.Text;
                t.OgrNumara = TxtNumara.Text;
                t.OgrMail = txtMail.Text;
                t.OgrResim = txtResim.Text;
                t.OgrSifre = txtSifre.Text;
                t.OgrBolum = int.Parse(comboBox1.SelectedValue.ToString());
                db.TblOgrenci.Add(t);
                db.SaveChanges();
                MessageBox.Show("Öğrenci bilgileri sisteme başarılı bir şekilde kaydedildi", "Bilgi", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Lütfen şifreleri birbiri ine aynı olacak şekilde yeniden girin", "Uyarı", MessageBoxButtons.OK, MessageBoxIcon.Stop);
            }
        }

        private void BtnResimSec_Click(object sender, EventArgs e)
        {
            openFileDialog1.ShowDialog();
            txtResim.Text = openFileDialog1.FileName;//path +file name
        }

        
    }
}
