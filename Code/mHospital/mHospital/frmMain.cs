using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace mHospital
{
    public partial class frmMHospital : DevComponents.DotNetBar.Office2007Form
    {
        public frmMHospital()
        {
            InitializeComponent();
        }

        private void frmMHospital_Load(object sender, EventArgs e)
        {

        }
        
        
        // Method close
        void flogin_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }

        private void ribbonPanel1_Click(object sender, EventArgs e)
        {

        }

        private void btnControlU_Click(object sender, EventArgs e)
        {
            frmPermission fp = new frmPermission();
            fp.ShowDialog();
        }

        private void ribbonControl_Click(object sender, EventArgs e)
        {

        }

        // Sign out
        private void btnSignOut_Click(object sender, EventArgs e)
        {
            frmLogin flogin = new frmLogin();
            flogin.FormClosed += flogin_FormClosed;
            this.Hide();
            flogin.ShowDialog();
        }

        // User manual
        private void btnHelp_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start("helpMHospital.chm");
        }

        // About for software
        private void btnAbout_Click(object sender, EventArgs e)
        {
            frmAbout fabout = new frmAbout();
            fabout.ShowDialog();
        }

        private void btnDanhMucCLS_Click(object sender, EventArgs e)
        {
            frmDanhMucCLS fDanhmucCLS = new frmDanhMucCLS();
            fDanhmucCLS.ShowDialog();
        }

        private void btnChiDinhCLS_Click(object sender, EventArgs e)
        {
            frmChiDinhCLS fChiDinhCLS = new frmChiDinhCLS();
            fChiDinhCLS.ShowDialog();
        }

        private void btnKetQuaCLS_Click(object sender, EventArgs e)
        {
            frmKetQuaCLS fKetQuaCLS = new frmKetQuaCLS();
            fKetQuaCLS.ShowDialog();
        }

        private void btnChiTietPT_Click(object sender, EventArgs e)
        {
            frmChiTietPhieuThu fChiTietPT = new frmChiTietPhieuThu();
            fChiTietPT.ShowDialog();
        }
    }
}
