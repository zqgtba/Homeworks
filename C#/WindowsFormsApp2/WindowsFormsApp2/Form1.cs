using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp2
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void wqf_SelectedIndexChanged(object sender, EventArgs e)
        {
            textBox2.Clear();
            for (int i = 0; i < 已选课程列表.SelectedItems.Count; i++)
            {
                if (已选课程列表.SelectedItems[i]!=null)
                {
                    textBox2.Text =textBox2 .Text + 已选课程列表. SelectedItems [i].ToString();
                }
                textBox2.Text += ' ';
            }      
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (textBox1.Text != "")
            {
                已选课程列表.Items.Add(textBox1.Text);
                textBox1.Clear();
            }
            else
                MessageBox.Show("没有输入");
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (已选课程列表.SelectedItems.Count > 1)
            {
                for (int i = 0; i < 已选课程列表.SelectedItems.Count; i++)
                {
                    已选课程列表.Items.Remove(已选课程列表.SelectedItems[0]);
                }
                已选课程列表.Items.RemoveAt(已选课程列表.SelectedIndex);
            }//多项删除
            else if(已选课程列表 .SelectedItems .Count ==1)
            {
                已选课程列表.Items.RemoveAt(已选课程列表.SelectedIndex);
            }//单项删除
            else if(已选课程列表.SelectedItems .Count ==0)
            {
                MessageBox.Show("没有选中");
            }
            textBox2.Clear();
        }
    }
}
