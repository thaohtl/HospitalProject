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
        #region Form Events

        public frmMHospital()
        {
            InitializeComponent();
        }
        
        
        // Method close
        void flogin_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }

        #endregion

        #region Button Event

        // About for software
        private void btnAbout_Click(object sender, EventArgs e)
        {
            frmAbout fabout = new frmAbout();
            fabout.ShowDialog();
        }

        // User manual
        private void btnHelp_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start("helpMHospital.chm");
        }

        //// Sign out
        //private void btnSignOut_Click(object sender, EventArgs e)
        //{
        //    //frmLogin flogin = new frmLogin();
        //    //flogin.FormClosed += flogin_FormClosed;
        //    //this.Hide();
        //    //flogin.ShowDialog();
        //}
        #endregion

        #region Gridview Event
        #endregion

        #region Processing
        #endregion
    }
}
