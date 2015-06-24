namespace mHospital
{
    partial class frmAbout
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmAbout));
            this.rtbInfoProject = new System.Windows.Forms.RichTextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.likMTA = new System.Windows.Forms.LinkLabel();
            this.label3 = new System.Windows.Forms.Label();
            this.grbInfoProject = new DevComponents.DotNetBar.Controls.GroupPanel();
            this.btnOK = new DevComponents.DotNetBar.ButtonX();
            this.grbInfoProject.SuspendLayout();
            this.SuspendLayout();
            // 
            // rtbInfoProject
            // 
            this.rtbInfoProject.Location = new System.Drawing.Point(12, 110);
            this.rtbInfoProject.Name = "rtbInfoProject";
            this.rtbInfoProject.ReadOnly = true;
            this.rtbInfoProject.Size = new System.Drawing.Size(322, 148);
            this.rtbInfoProject.TabIndex = 5;
            this.rtbInfoProject.Text = resources.GetString("rtbInfoProject.Text");
            this.rtbInfoProject.WordWrap = false;
            this.rtbInfoProject.TextChanged += new System.EventHandler(this.richTextBox1_TextChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Location = new System.Drawing.Point(76, 10);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(154, 13);
            this.label1.TabIndex = 2;
            this.label1.Text = "Chương trình quản lý bệnh viện";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.Color.Transparent;
            this.label2.Location = new System.Drawing.Point(76, 32);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(46, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "Website";
            // 
            // likMTA
            // 
            this.likMTA.AutoSize = true;
            this.likMTA.BackColor = System.Drawing.Color.Transparent;
            this.likMTA.Location = new System.Drawing.Point(132, 32);
            this.likMTA.Name = "likMTA";
            this.likMTA.Size = new System.Drawing.Size(102, 13);
            this.likMTA.TabIndex = 4;
            this.likMTA.TabStop = true;
            this.likMTA.Text = "http://fit.mta.edu.vn";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.BackColor = System.Drawing.Color.Transparent;
            this.label3.Location = new System.Drawing.Point(76, 57);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(163, 13);
            this.label3.TabIndex = 5;
            this.label3.Text = "Bản quyền © Học viên HVKTQS";
            // 
            // grbInfoProject
            // 
            this.grbInfoProject.CanvasColor = System.Drawing.SystemColors.Control;
            this.grbInfoProject.ColorSchemeStyle = DevComponents.DotNetBar.eDotNetBarStyle.Office2007;
            this.grbInfoProject.Controls.Add(this.label3);
            this.grbInfoProject.Controls.Add(this.label1);
            this.grbInfoProject.Controls.Add(this.likMTA);
            this.grbInfoProject.Controls.Add(this.label2);
            this.grbInfoProject.Location = new System.Drawing.Point(12, 4);
            this.grbInfoProject.Name = "grbInfoProject";
            this.grbInfoProject.Size = new System.Drawing.Size(322, 100);
            // 
            // 
            // 
            this.grbInfoProject.Style.BackColor2SchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground2;
            this.grbInfoProject.Style.BackColorGradientAngle = 90;
            this.grbInfoProject.Style.BackColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground;
            this.grbInfoProject.Style.BorderBottom = DevComponents.DotNetBar.eStyleBorderType.Solid;
            this.grbInfoProject.Style.BorderBottomWidth = 1;
            this.grbInfoProject.Style.BorderColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBorder;
            this.grbInfoProject.Style.BorderLeft = DevComponents.DotNetBar.eStyleBorderType.Solid;
            this.grbInfoProject.Style.BorderLeftWidth = 1;
            this.grbInfoProject.Style.BorderRight = DevComponents.DotNetBar.eStyleBorderType.Solid;
            this.grbInfoProject.Style.BorderRightWidth = 1;
            this.grbInfoProject.Style.BorderTop = DevComponents.DotNetBar.eStyleBorderType.Solid;
            this.grbInfoProject.Style.BorderTopWidth = 1;
            this.grbInfoProject.Style.CornerDiameter = 4;
            this.grbInfoProject.Style.CornerType = DevComponents.DotNetBar.eCornerType.Rounded;
            this.grbInfoProject.Style.TextAlignment = DevComponents.DotNetBar.eStyleTextAlignment.Center;
            this.grbInfoProject.Style.TextColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelText;
            this.grbInfoProject.Style.TextLineAlignment = DevComponents.DotNetBar.eStyleTextAlignment.Near;
            this.grbInfoProject.TabIndex = 6;
            this.grbInfoProject.Text = "Thông tin chương trình";
            // 
            // btnOK
            // 
            this.btnOK.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnOK.AllowDrop = true;
            this.btnOK.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.btnOK.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnOK.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnOK.HotTrackingStyle = DevComponents.DotNetBar.eHotTrackingStyle.None;
            this.btnOK.HoverImage = global::mHospital.Properties.Resources.ok;
            this.btnOK.Image = global::mHospital.Properties.Resources.ok;
            this.btnOK.ImeMode = System.Windows.Forms.ImeMode.NoControl;
            this.btnOK.Location = new System.Drawing.Point(129, 264);
            this.btnOK.Name = "btnOK";
            this.btnOK.Padding = new System.Windows.Forms.Padding(3);
            this.btnOK.Size = new System.Drawing.Size(57, 38);
            this.btnOK.TabIndex = 7;
            this.btnOK.Text = "OK";
            this.btnOK.TextAlignment = DevComponents.DotNetBar.eButtonTextAlignment.Right;
            this.btnOK.Click += new System.EventHandler(this.btnOK_Click_1);
            // 
            // frmAbout
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(347, 303);
            this.Controls.Add(this.btnOK);
            this.Controls.Add(this.grbInfoProject);
            this.Controls.Add(this.rtbInfoProject);
            this.DoubleBuffered = true;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "frmAbout";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Thông tin chương trình";
            this.TopLeftCornerSize = 0;
            this.Load += new System.EventHandler(this.frmAbout_Load);
            this.grbInfoProject.ResumeLayout(false);
            this.grbInfoProject.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.RichTextBox rtbInfoProject;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.LinkLabel likMTA;
        private System.Windows.Forms.Label label3;
        private DevComponents.DotNetBar.Controls.GroupPanel grbInfoProject;
        private DevComponents.DotNetBar.ButtonX btnOK;

    }
}