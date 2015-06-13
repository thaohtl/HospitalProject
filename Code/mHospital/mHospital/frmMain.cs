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
    public partial class frmMHospital : Form
    {
        public frmMHospital()
        {
            InitializeComponent();
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {

        }

        private void btnSua_Click(object sender, EventArgs e)
        {

        }

        private void btnThem_Click(object sender, EventArgs e)
        {

        }

        private void frmMHospital_Load(object sender, EventArgs e)
        {

        }

        // Sign out
        private void đăngXuấtToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmLogin flogin = new frmLogin();
            flogin.FormClosed += flogin_FormClosed;
            this.Hide();
            flogin.ShowDialog();
        }
        // Method close
        void flogin_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }

        // Manager for user
        private void quảnTrịToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmPermission fp = new frmPermission();
            fp.ShowDialog();
        }

        private void thoátToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        // About for project
        private void thôngTinToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmAbout fabout = new frmAbout();
            fabout.ShowDialog();
        }

        private void hướngDẫnSửDụngToolStripMenuItem_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start("helpMHospital.chm");
        }
    }
}
