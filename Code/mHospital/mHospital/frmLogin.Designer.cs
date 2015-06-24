namespace mHospital
{
    partial class frmLogin
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmLogin));
            this.grbThongTinDangNhap = new DevComponents.DotNetBar.Controls.GroupPanel();
            this.txtPassword = new DevComponents.DotNetBar.Controls.TextBoxX();
            this.txtUsername = new DevComponents.DotNetBar.Controls.TextBoxX();
            this.labelX2 = new DevComponents.DotNetBar.LabelX();
            this.labelX1 = new DevComponents.DotNetBar.LabelX();
            this.btnThoat = new DevComponents.DotNetBar.ButtonX();
            this.btnDangNhap = new DevComponents.DotNetBar.ButtonX();
            this.grbThongTinDangNhap.SuspendLayout();
            this.SuspendLayout();
            // 
            // grbThongTinDangNhap
            // 
            this.grbThongTinDangNhap.CanvasColor = System.Drawing.SystemColors.Control;
            this.grbThongTinDangNhap.ColorSchemeStyle = DevComponents.DotNetBar.eDotNetBarStyle.Office2007;
            this.grbThongTinDangNhap.Controls.Add(this.txtPassword);
            this.grbThongTinDangNhap.Controls.Add(this.txtUsername);
            this.grbThongTinDangNhap.Controls.Add(this.labelX2);
            this.grbThongTinDangNhap.Controls.Add(this.labelX1);
            this.grbThongTinDangNhap.Dock = System.Windows.Forms.DockStyle.Top;
            this.grbThongTinDangNhap.Location = new System.Drawing.Point(0, 0);
            this.grbThongTinDangNhap.Name = "grbThongTinDangNhap";
            this.grbThongTinDangNhap.Size = new System.Drawing.Size(286, 119);
            // 
            // 
            // 
            this.grbThongTinDangNhap.Style.BackColor2SchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground2;
            this.grbThongTinDangNhap.Style.BackColorGradientAngle = 90;
            this.grbThongTinDangNhap.Style.BackColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground;
            this.grbThongTinDangNhap.Style.BorderBottom = DevComponents.DotNetBar.eStyleBorderType.Solid;
            this.grbThongTinDangNhap.Style.BorderBottomWidth = 1;
            this.grbThongTinDangNhap.Style.BorderColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBorder;
            this.grbThongTinDangNhap.Style.BorderLeft = DevComponents.DotNetBar.eStyleBorderType.Solid;
            this.grbThongTinDangNhap.Style.BorderLeftWidth = 1;
            this.grbThongTinDangNhap.Style.BorderRight = DevComponents.DotNetBar.eStyleBorderType.Solid;
            this.grbThongTinDangNhap.Style.BorderRightWidth = 1;
            this.grbThongTinDangNhap.Style.BorderTop = DevComponents.DotNetBar.eStyleBorderType.Solid;
            this.grbThongTinDangNhap.Style.BorderTopWidth = 1;
            this.grbThongTinDangNhap.Style.CornerDiameter = 4;
            this.grbThongTinDangNhap.Style.CornerType = DevComponents.DotNetBar.eCornerType.Rounded;
            this.grbThongTinDangNhap.Style.TextAlignment = DevComponents.DotNetBar.eStyleTextAlignment.Center;
            this.grbThongTinDangNhap.Style.TextColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelText;
            this.grbThongTinDangNhap.Style.TextLineAlignment = DevComponents.DotNetBar.eStyleTextAlignment.Near;
            this.grbThongTinDangNhap.TabIndex = 14;
            this.grbThongTinDangNhap.Text = "Thông tin đăng nhập";
            // 
            // txtPassword
            // 
            // 
            // 
            // 
            this.txtPassword.Border.Class = "TextBoxBorder";
            this.txtPassword.Location = new System.Drawing.Point(112, 56);
            this.txtPassword.Name = "txtPassword";
            this.txtPassword.Size = new System.Drawing.Size(138, 20);
            this.txtPassword.TabIndex = 16;
            // 
            // txtUsername
            // 
            // 
            // 
            // 
            this.txtUsername.Border.Class = "TextBoxBorder";
            this.txtUsername.Location = new System.Drawing.Point(112, 22);
            this.txtUsername.Name = "txtUsername";
            this.txtUsername.Size = new System.Drawing.Size(138, 20);
            this.txtUsername.TabIndex = 15;
            // 
            // labelX2
            // 
            this.labelX2.BackColor = System.Drawing.Color.Transparent;
            this.labelX2.Location = new System.Drawing.Point(18, 56);
            this.labelX2.Name = "labelX2";
            this.labelX2.Size = new System.Drawing.Size(75, 23);
            this.labelX2.TabIndex = 14;
            this.labelX2.Text = "Mật khẩu";
            // 
            // labelX1
            // 
            this.labelX1.BackColor = System.Drawing.Color.Transparent;
            this.labelX1.Location = new System.Drawing.Point(18, 19);
            this.labelX1.Name = "labelX1";
            this.labelX1.Size = new System.Drawing.Size(75, 23);
            this.labelX1.TabIndex = 13;
            this.labelX1.Text = "Tài khoản";
            // 
            // btnThoat
            // 
            this.btnThoat.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnThoat.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnThoat.Image = global::mHospital.Properties.Resources.close;
            this.btnThoat.Location = new System.Drawing.Point(149, 143);
            this.btnThoat.Name = "btnThoat";
            this.btnThoat.Size = new System.Drawing.Size(74, 44);
            this.btnThoat.TabIndex = 16;
            this.btnThoat.Text = "Thoát";
            // 
            // btnDangNhap
            // 
            this.btnDangNhap.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnDangNhap.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnDangNhap.Image = global::mHospital.Properties.Resources.unlocked_01;
            this.btnDangNhap.Location = new System.Drawing.Point(58, 143);
            this.btnDangNhap.Name = "btnDangNhap";
            this.btnDangNhap.Size = new System.Drawing.Size(74, 44);
            this.btnDangNhap.TabIndex = 15;
            this.btnDangNhap.Text = "Đăng nhập";
            // 
            // frmLogin
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(286, 199);
            this.Controls.Add(this.grbThongTinDangNhap);
            this.Controls.Add(this.btnThoat);
            this.Controls.Add(this.btnDangNhap);
            this.DoubleBuffered = true;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "frmLogin";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Load += new System.EventHandler(this.frmLogin_Load_1);
            this.grbThongTinDangNhap.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private DevComponents.DotNetBar.Controls.GroupPanel grbThongTinDangNhap;
        private DevComponents.DotNetBar.Controls.TextBoxX txtPassword;
        private DevComponents.DotNetBar.Controls.TextBoxX txtUsername;
        private DevComponents.DotNetBar.LabelX labelX2;
        private DevComponents.DotNetBar.LabelX labelX1;
        private DevComponents.DotNetBar.ButtonX btnThoat;
        private DevComponents.DotNetBar.ButtonX btnDangNhap;

    }
}