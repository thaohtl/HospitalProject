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
            this.grbInfoProject = new System.Windows.Forms.GroupBox();
            this.label3 = new System.Windows.Forms.Label();
            this.likMTA = new System.Windows.Forms.LinkLabel();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.btnOk = new System.Windows.Forms.Button();
            this.rtbInfoProject = new System.Windows.Forms.RichTextBox();
            this.grbInfoProject.SuspendLayout();
            this.SuspendLayout();
            // 
            // grbInfoProject
            // 
            this.grbInfoProject.Controls.Add(this.label3);
            this.grbInfoProject.Controls.Add(this.likMTA);
            this.grbInfoProject.Controls.Add(this.label2);
            this.grbInfoProject.Controls.Add(this.label1);
            this.grbInfoProject.Location = new System.Drawing.Point(12, 12);
            this.grbInfoProject.Name = "grbInfoProject";
            this.grbInfoProject.Size = new System.Drawing.Size(322, 92);
            this.grbInfoProject.TabIndex = 4;
            this.grbInfoProject.TabStop = false;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(63, 65);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(163, 13);
            this.label3.TabIndex = 5;
            this.label3.Text = "Bản quyền © Học viên HVKTQS";
            // 
            // likMTA
            // 
            this.likMTA.AutoSize = true;
            this.likMTA.Location = new System.Drawing.Point(116, 38);
            this.likMTA.Name = "likMTA";
            this.likMTA.Size = new System.Drawing.Size(102, 13);
            this.likMTA.TabIndex = 4;
            this.likMTA.TabStop = true;
            this.likMTA.Text = "http://fit.mta.edu.vn";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(63, 39);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(46, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "Website";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(63, 16);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(154, 13);
            this.label1.TabIndex = 2;
            this.label1.Text = "Chương trình quản lý bệnh viện";
            // 
            // btnOk
            // 
            this.btnOk.Location = new System.Drawing.Point(145, 264);
            this.btnOk.Name = "btnOk";
            this.btnOk.Size = new System.Drawing.Size(75, 23);
            this.btnOk.TabIndex = 3;
            this.btnOk.Text = "OK";
            this.btnOk.UseVisualStyleBackColor = true;
            this.btnOk.Click += new System.EventHandler(this.btnOk_Click);
            // 
            // rtbInfoProject
            // 
            this.rtbInfoProject.Location = new System.Drawing.Point(12, 110);
            this.rtbInfoProject.Name = "rtbInfoProject";
            this.rtbInfoProject.ReadOnly = true;
            this.rtbInfoProject.Size = new System.Drawing.Size(322, 148);
            this.rtbInfoProject.TabIndex = 5;
            this.rtbInfoProject.Text = resources.GetString("rtbInfoProject.Text");
            this.rtbInfoProject.TextChanged += new System.EventHandler(this.richTextBox1_TextChanged);
            // 
            // frmAbout
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(347, 296);
            this.Controls.Add(this.grbInfoProject);
            this.Controls.Add(this.btnOk);
            this.Controls.Add(this.rtbInfoProject);
            this.DoubleBuffered = true;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "frmAbout";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Thông tin chương trình";
            this.Load += new System.EventHandler(this.frmAbout_Load);
            this.grbInfoProject.ResumeLayout(false);
            this.grbInfoProject.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox grbInfoProject;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.LinkLabel likMTA;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnOk;
        private System.Windows.Forms.RichTextBox rtbInfoProject;

    }
}