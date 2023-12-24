using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Proje_Ogrenci_Akademisyen.Formlar
{
    public partial class FrmHarita : Form
    {
        public FrmHarita()
        {
            InitializeComponent();
        }

        

        private void PnlBolumListesi_Click(object sender, EventArgs e)
        {
            FrmBolumListesi fr = new FrmBolumListesi();
            fr.Show();
        }

        private void PnlYeniBolum_Click(object sender, EventArgs e)
        {
            FrmBolumler fr = new FrmBolumler();
            fr.Show();
        }

        private void PnlNotlar_Click(object sender, EventArgs e)
        {
            FrmNotlar fr = new FrmNotlar();
            fr.Show();
        }

        private void PnlOgrenci_Click(object sender, EventArgs e)
        {
            FrmÖgrenci fr = new FrmÖgrenci();
            fr.Show();
        }

        private void PnlOgrenciKayit_Click(object sender, EventArgs e)
        {
            FrmOgrenciKayıt fr = new FrmOgrenciKayıt();
            fr.Show();
        }

        private void PnlDersListesi1_Click(object sender, EventArgs e)
        {
            FrmDersListesi fr = new FrmDersListesi();
            fr.Show();
        }

        private void PnlYardım_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Bu proje İleri Bilgisayar Programlama Dersi için Hazırlanmıştır.Akademisyen için kullanıcı adı:00000 olup şifresi 000 şeklindedir.", "Yardım Penceresi", MessageBoxButtons.OK, MessageBoxIcon.Warning);
        }

        private void PnlYeniDers_Click(object sender, EventArgs e)
        {
            FrmYeniDers fr = new FrmYeniDers();
            fr.Show();
        }

        private void PnlCıkısYap_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
