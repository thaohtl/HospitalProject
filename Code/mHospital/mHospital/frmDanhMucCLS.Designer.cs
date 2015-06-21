namespace mHospital
{
    partial class frmDanhMucCLS
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
            this.grvDanhMucCLS = new DevComponents.DotNetBar.Controls.DataGridViewX();
            this.maDM = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tenDM = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.nhom = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.note = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.labelX1 = new DevComponents.DotNetBar.LabelX();
            this.txtMaDM = new DevComponents.DotNetBar.Controls.TextBoxX();
            this.labelX2 = new DevComponents.DotNetBar.LabelX();
            this.txtTenDM = new DevComponents.DotNetBar.Controls.TextBoxX();
            this.labelX3 = new DevComponents.DotNetBar.LabelX();
            this.labelX4 = new DevComponents.DotNetBar.LabelX();
            this.cbbPhanNhom = new DevComponents.DotNetBar.Controls.ComboBoxEx();
            this.txtGhichu = new System.Windows.Forms.RichTextBox();
            this.btnAdd = new DevComponents.DotNetBar.ButtonX();
            this.btnEdit = new DevComponents.DotNetBar.ButtonX();
            this.btnDelete = new DevComponents.DotNetBar.ButtonX();
            this.btnEnd = new DevComponents.DotNetBar.ButtonX();
            this.txtSearch = new DevComponents.DotNetBar.Controls.TextBoxX();
            this.labelX5 = new DevComponents.DotNetBar.LabelX();
            this.labelX6 = new DevComponents.DotNetBar.LabelX();
            ((System.ComponentModel.ISupportInitialize)(this.grvDanhMucCLS)).BeginInit();
            this.SuspendLayout();
            // 
            // grvDanhMucCLS
            // 
            this.grvDanhMucCLS.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grvDanhMucCLS.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.maDM,
            this.tenDM,
            this.nhom,
            this.note});
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.grvDanhMucCLS.DefaultCellStyle = dataGridViewCellStyle1;
            this.grvDanhMucCLS.GridColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(215)))), ((int)(((byte)(229)))));
            this.grvDanhMucCLS.Location = new System.Drawing.Point(271, 100);
            this.grvDanhMucCLS.Name = "grvDanhMucCLS";
            this.grvDanhMucCLS.Size = new System.Drawing.Size(443, 254);
            this.grvDanhMucCLS.TabIndex = 0;
            // 
            // maDM
            // 
            this.maDM.HeaderText = "Mã danh mục";
            this.maDM.Name = "maDM";
            // 
            // tenDM
            // 
            this.tenDM.HeaderText = "Tên danh mục";
            this.tenDM.Name = "tenDM";
            // 
            // nhom
            // 
            this.nhom.HeaderText = "Phân nhóm";
            this.nhom.Name = "nhom";
            // 
            // note
            // 
            this.note.HeaderText = "Ghi chú";
            this.note.Name = "note";
            // 
            // labelX1
            // 
            this.labelX1.Location = new System.Drawing.Point(15, 100);
            this.labelX1.Name = "labelX1";
            this.labelX1.Size = new System.Drawing.Size(75, 20);
            this.labelX1.TabIndex = 1;
            this.labelX1.Text = "Mã danh mục";
            // 
            // txtMaDM
            // 
            // 
            // 
            // 
            this.txtMaDM.Border.Class = "TextBoxBorder";
            this.txtMaDM.Location = new System.Drawing.Point(15, 126);
            this.txtMaDM.Name = "txtMaDM";
            this.txtMaDM.Size = new System.Drawing.Size(148, 20);
            this.txtMaDM.TabIndex = 2;
            // 
            // labelX2
            // 
            this.labelX2.Location = new System.Drawing.Point(15, 160);
            this.labelX2.Name = "labelX2";
            this.labelX2.Size = new System.Drawing.Size(75, 20);
            this.labelX2.TabIndex = 1;
            this.labelX2.Text = "Tên danh mục";
            // 
            // txtTenDM
            // 
            // 
            // 
            // 
            this.txtTenDM.Border.Class = "TextBoxBorder";
            this.txtTenDM.Location = new System.Drawing.Point(15, 186);
            this.txtTenDM.Name = "txtTenDM";
            this.txtTenDM.Size = new System.Drawing.Size(148, 20);
            this.txtTenDM.TabIndex = 2;
            // 
            // labelX3
            // 
            this.labelX3.Location = new System.Drawing.Point(15, 220);
            this.labelX3.Name = "labelX3";
            this.labelX3.Size = new System.Drawing.Size(75, 20);
            this.labelX3.TabIndex = 1;
            this.labelX3.Text = "Phân nhóm";
            // 
            // labelX4
            // 
            this.labelX4.Location = new System.Drawing.Point(15, 281);
            this.labelX4.Name = "labelX4";
            this.labelX4.Size = new System.Drawing.Size(75, 23);
            this.labelX4.TabIndex = 1;
            this.labelX4.Text = "Ghi chú";
            // 
            // cbbPhanNhom
            // 
            this.cbbPhanNhom.DisplayMember = "Text";
            this.cbbPhanNhom.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.cbbPhanNhom.FormattingEnabled = true;
            this.cbbPhanNhom.ItemHeight = 14;
            this.cbbPhanNhom.Location = new System.Drawing.Point(15, 246);
            this.cbbPhanNhom.Name = "cbbPhanNhom";
            this.cbbPhanNhom.Size = new System.Drawing.Size(148, 20);
            this.cbbPhanNhom.TabIndex = 3;
            // 
            // txtGhichu
            // 
            this.txtGhichu.Location = new System.Drawing.Point(15, 306);
            this.txtGhichu.Name = "txtGhichu";
            this.txtGhichu.Size = new System.Drawing.Size(236, 48);
            this.txtGhichu.TabIndex = 4;
            this.txtGhichu.Text = "";
            // 
            // btnAdd
            // 
            this.btnAdd.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnAdd.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnAdd.Location = new System.Drawing.Point(15, 391);
            this.btnAdd.Name = "btnAdd";
            this.btnAdd.Size = new System.Drawing.Size(75, 23);
            this.btnAdd.TabIndex = 5;
            this.btnAdd.Text = "Thêm";
            // 
            // btnEdit
            // 
            this.btnEdit.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnEdit.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnEdit.Location = new System.Drawing.Point(111, 391);
            this.btnEdit.Name = "btnEdit";
            this.btnEdit.Size = new System.Drawing.Size(75, 23);
            this.btnEdit.TabIndex = 5;
            this.btnEdit.Text = "Sửa";
            // 
            // btnDelete
            // 
            this.btnDelete.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnDelete.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnDelete.Location = new System.Drawing.Point(207, 391);
            this.btnDelete.Name = "btnDelete";
            this.btnDelete.Size = new System.Drawing.Size(75, 23);
            this.btnDelete.TabIndex = 5;
            this.btnDelete.Text = "Xóa";
            // 
            // btnEnd
            // 
            this.btnEnd.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnEnd.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnEnd.Location = new System.Drawing.Point(639, 391);
            this.btnEnd.Name = "btnEnd";
            this.btnEnd.Size = new System.Drawing.Size(75, 23);
            this.btnEnd.TabIndex = 5;
            this.btnEnd.Text = "Đóng";
            // 
            // txtSearch
            // 
            // 
            // 
            // 
            this.txtSearch.Border.Class = "TextBoxBorder";
            this.txtSearch.Location = new System.Drawing.Point(512, 74);
            this.txtSearch.Name = "txtSearch";
            this.txtSearch.Size = new System.Drawing.Size(202, 20);
            this.txtSearch.TabIndex = 2;
            this.txtSearch.WatermarkText = "Nhập mã hoặc tên danh mục";
            // 
            // labelX5
            // 
            this.labelX5.Location = new System.Drawing.Point(446, 74);
            this.labelX5.Name = "labelX5";
            this.labelX5.Size = new System.Drawing.Size(60, 20);
            this.labelX5.TabIndex = 1;
            this.labelX5.Text = "Tìm kiếm";
            // 
            // labelX6
            // 
            this.labelX6.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelX6.Location = new System.Drawing.Point(163, 12);
            this.labelX6.Name = "labelX6";
            this.labelX6.Size = new System.Drawing.Size(405, 29);
            this.labelX6.TabIndex = 1;
            this.labelX6.Text = "QUẢN LÝ DANH MỤC CẬN LÂM SÀNG";
            // 
            // frmDanhMucCLS
            // 
            this.ClientSize = new System.Drawing.Size(738, 438);
            this.Controls.Add(this.btnEnd);
            this.Controls.Add(this.btnDelete);
            this.Controls.Add(this.btnEdit);
            this.Controls.Add(this.btnAdd);
            this.Controls.Add(this.txtGhichu);
            this.Controls.Add(this.cbbPhanNhom);
            this.Controls.Add(this.txtTenDM);
            this.Controls.Add(this.txtSearch);
            this.Controls.Add(this.txtMaDM);
            this.Controls.Add(this.labelX4);
            this.Controls.Add(this.labelX3);
            this.Controls.Add(this.labelX2);
            this.Controls.Add(this.labelX5);
            this.Controls.Add(this.labelX6);
            this.Controls.Add(this.labelX1);
            this.Controls.Add(this.grvDanhMucCLS);
            this.DoubleBuffered = true;
            this.Name = "frmDanhMucCLS";
            this.Text = "Quản lý danh mục Cận lâm sàng";
            ((System.ComponentModel.ISupportInitialize)(this.grvDanhMucCLS)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private DevComponents.DotNetBar.Controls.DataGridViewX grvDanhMucCLS;
        private System.Windows.Forms.DataGridViewTextBoxColumn maDM;
        private System.Windows.Forms.DataGridViewTextBoxColumn tenDM;
        private System.Windows.Forms.DataGridViewTextBoxColumn nhom;
        private System.Windows.Forms.DataGridViewTextBoxColumn note;
        private DevComponents.DotNetBar.LabelX labelX1;
        private DevComponents.DotNetBar.Controls.TextBoxX txtMaDM;
        private DevComponents.DotNetBar.LabelX labelX2;
        private DevComponents.DotNetBar.Controls.TextBoxX txtTenDM;
        private DevComponents.DotNetBar.LabelX labelX3;
        private DevComponents.DotNetBar.LabelX labelX4;
        private DevComponents.DotNetBar.Controls.ComboBoxEx cbbPhanNhom;
        private System.Windows.Forms.RichTextBox txtGhichu;
        private DevComponents.DotNetBar.ButtonX btnAdd;
        private DevComponents.DotNetBar.ButtonX btnEdit;
        private DevComponents.DotNetBar.ButtonX btnDelete;
        private DevComponents.DotNetBar.ButtonX btnEnd;
        private DevComponents.DotNetBar.Controls.TextBoxX txtSearch;
        private DevComponents.DotNetBar.LabelX labelX5;
        private DevComponents.DotNetBar.LabelX labelX6;
    }
}