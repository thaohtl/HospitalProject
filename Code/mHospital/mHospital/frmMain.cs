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
        
        // Method close
        void flogin_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }

        // About for software
        private void btnAbout_Click_1(object sender, EventArgs e)
        {
            frmAbout fabout = new frmAbout();
            fabout.ShowDialog();
        }

        // User manual
        private void btnHelp_Click_1(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start("helpMHospital.chm");
        }

        //kiem tra tab
        private bool KiemTraTenTabConTrol(string name)
        {
            for (int i = 0; i < tabControl.Tabs.Count; i++)
            {
                if (tabControl.Tabs[i].Name == name)
                {
                    tabControl.SelectedTabIndex = i;
                    return true;
                }
            }
            return false;
        }

        private void btTiepNhanBN_Click(object sender, EventArgs e)
        {
            //Todo - Load du lieu vao gridview
            if (KiemTraTenTabConTrol("tabTiepDonBN") == false)
            {
                tabControl.Tabs.Add(tabTiepDonBN);
                tabControl.SelectedTabIndex = tabControl.Tabs.Count - 1;
            }
        }

        private void btnKhamBenh_Click(object sender, EventArgs e)
        {
            //Todo - Load du lieu vao gridview
            if (KiemTraTenTabConTrol("tabKhamBenh") == false)
            {
                tabControl.Tabs.Add(tabKhamBenh);
                tabControl.SelectedTabIndex = tabControl.Tabs.Count - 1;
            }
        }

        private void btnCLS_Click(object sender, EventArgs e)
        {
            //Todo - Load du lieu vao gridview
            if (KiemTraTenTabConTrol("tabCLS") == false)
            {
                tabControl.Tabs.Add(tabCLS);
                tabControl.SelectedTabIndex = tabControl.Tabs.Count - 1;
            }
        }

        private void btnQLThuoc_Click(object sender, EventArgs e)
        {
            //Todo - Load du lieu vao gridview
            if (KiemTraTenTabConTrol("tabThuoc") == false)
            {
                tabControl.Tabs.Add(tabThuoc);
                tabControl.SelectedTabIndex = tabControl.Tabs.Count - 1;
            }
        }

        private void btnVienPhi_Click(object sender, EventArgs e)
        {
            //Todo - Load du lieu vao gridview
            if (KiemTraTenTabConTrol("tabVienPhi") == false)
            {
                tabControl.Tabs.Add(tabVienPhi);
                tabControl.SelectedTabIndex = tabControl.Tabs.Count - 1;
            }
        }

        private void tabControl_TabItemClose(object sender, DevComponents.DotNetBar.TabStripActionEventArgs e)
        {
            if (MessageBox.Show("Bạn có chắc chắn muốn đóng form?", "Thông báo", MessageBoxButtons.YesNo) == DialogResult.No)
                return;
            else
                tabControl.Tabs.Remove(tabControl.SelectedTab);
        }

        
    }
}
