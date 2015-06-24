namespace mHospital
{
    partial class frmChiTietKetQuaCLS
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            this.labelX4 = new DevComponents.DotNetBar.LabelX();
            this.labelX3 = new DevComponents.DotNetBar.LabelX();
            this.labelX1 = new DevComponents.DotNetBar.LabelX();
            this.buttonX1 = new DevComponents.DotNetBar.ButtonX();
            this.dataGridViewX1 = new DevComponents.DotNetBar.Controls.DataGridViewX();
            this.maCLS = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.bsChiDinh = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tenPhongKham = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tenXN = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.bsThucHien = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.kq = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.timeLayMau = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.timeThucHien = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tiemKQ = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.nguoiNhapLieu = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewX1)).BeginInit();
            this.SuspendLayout();
            // 
            // labelX4
            // 
            this.labelX4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelX4.Location = new System.Drawing.Point(64, 115);
            this.labelX4.Name = "labelX4";
            this.labelX4.Size = new System.Drawing.Size(104, 23);
            this.labelX4.TabIndex = 16;
            this.labelX4.Text = "BỆNH NHÂN: ";
            // 
            // labelX3
            // 
            this.labelX3.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelX3.Location = new System.Drawing.Point(195, 0);
            this.labelX3.Name = "labelX3";
            this.labelX3.Size = new System.Drawing.Size(372, 66);
            this.labelX3.TabIndex = 17;
            this.labelX3.Text = "CHI TIẾT KẾT QUẢ CẬN LÂM SÀNG";
            // 
            // labelX1
            // 
            this.labelX1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelX1.Location = new System.Drawing.Point(228, 115);
            this.labelX1.Name = "labelX1";
            this.labelX1.Size = new System.Drawing.Size(490, 23);
            this.labelX1.TabIndex = 16;
            this.labelX1.Text = "[Họ tên]+[Mã bệnh nhân].............................";
            // 
            // buttonX1
            // 
            this.buttonX1.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.buttonX1.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.buttonX1.Location = new System.Drawing.Point(296, 470);
            this.buttonX1.Name = "buttonX1";
            this.buttonX1.Size = new System.Drawing.Size(100, 28);
            this.buttonX1.TabIndex = 22;
            this.buttonX1.Text = "Đóng";
            // 
            // dataGridViewX1
            // 
            this.dataGridViewX1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewX1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.maCLS,
            this.bsChiDinh,
            this.tenPhongKham,
            this.tenXN,
            this.bsThucHien,
            this.kq,
            this.timeLayMau,
            this.timeThucHien,
            this.tiemKQ,
            this.nguoiNhapLieu});
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.dataGridViewX1.DefaultCellStyle = dataGridViewCellStyle1;
            this.dataGridViewX1.GridColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(215)))), ((int)(((byte)(229)))));
            this.dataGridViewX1.Location = new System.Drawing.Point(12, 168);
            this.dataGridViewX1.Name = "dataGridViewX1";
            this.dataGridViewX1.Size = new System.Drawing.Size(746, 215);
            this.dataGridViewX1.TabIndex = 23;
            // 
            // maCLS
            // 
            this.maCLS.HeaderText = "Mã cận lâm sàng";
            this.maCLS.Name = "maCLS";
            // 
            // bsChiDinh
            // 
            this.bsChiDinh.HeaderText = "Bác sĩ chỉ định";
            this.bsChiDinh.Name = "bsChiDinh";
            // 
            // tenPhongKham
            // 
            this.tenPhongKham.HeaderText = "Phòng khám";
            this.tenPhongKham.Name = "tenPhongKham";
            // 
            // tenXN
            // 
            this.tenXN.HeaderText = "Tên xét nghiệm";
            this.tenXN.Name = "tenXN";
            // 
            // bsThucHien
            // 
            this.bsThucHien.HeaderText = "Bác sĩ thực hiện";
            this.bsThucHien.Name = "bsThucHien";
            // 
            // kq
            // 
            this.kq.HeaderText = "Kết quả";
            this.kq.Name = "kq";
            // 
            // timeLayMau
            // 
            this.timeLayMau.HeaderText = "Ngày giờ lấy mẫu";
            this.timeLayMau.Name = "timeLayMau";
            // 
            // timeThucHien
            // 
            this.timeThucHien.HeaderText = "Ngày giờ thực hiện";
            this.timeThucHien.Name = "timeThucHien";
            // 
            // tiemKQ
            // 
            this.tiemKQ.HeaderText = "Ngày giờ trả kết quả";
            this.tiemKQ.Name = "tiemKQ";
            // 
            // nguoiNhapLieu
            // 
            this.nguoiNhapLieu.HeaderText = "Người nhập liệu";
            this.nguoiNhapLieu.Name = "nguoiNhapLieu";
            // 
            // frmChiTietKetQuaCLS
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1054, 510);
            this.Controls.Add(this.dataGridViewX1);
            this.Controls.Add(this.buttonX1);
            this.Controls.Add(this.labelX1);
            this.Controls.Add(this.labelX4);
            this.Controls.Add(this.labelX3);
            this.DoubleBuffered = true;
            this.Name = "frmChiTietKetQuaCLS";
            this.Text = "CHI TIẾT KẾT QUẢ CẬN LÂM SÀNG";
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewX1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private DevComponents.DotNetBar.LabelX labelX4;
        private DevComponents.DotNetBar.LabelX labelX3;
        private DevComponents.DotNetBar.LabelX labelX1;
        private DevComponents.DotNetBar.ButtonX buttonX1;
        private DevComponents.DotNetBar.Controls.DataGridViewX dataGridViewX1;
        private System.Windows.Forms.DataGridViewTextBoxColumn maCLS;
        private System.Windows.Forms.DataGridViewTextBoxColumn bsChiDinh;
        private System.Windows.Forms.DataGridViewTextBoxColumn tenPhongKham;
        private System.Windows.Forms.DataGridViewTextBoxColumn tenXN;
        private System.Windows.Forms.DataGridViewTextBoxColumn bsThucHien;
        private System.Windows.Forms.DataGridViewTextBoxColumn kq;
        private System.Windows.Forms.DataGridViewTextBoxColumn timeLayMau;
        private System.Windows.Forms.DataGridViewTextBoxColumn timeThucHien;
        private System.Windows.Forms.DataGridViewTextBoxColumn tiemKQ;
        private System.Windows.Forms.DataGridViewTextBoxColumn nguoiNhapLieu;
    }
}