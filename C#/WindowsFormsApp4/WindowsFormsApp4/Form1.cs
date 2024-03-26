using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp4
{
    public partial class Form1 : Form
    {
        private Point old;
        private bool capture = false;
        private bool cap = false;
        public Form1()
        {
            InitializeComponent();
        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void panel1_MouseDown(object sender, MouseEventArgs e)
        {
            if(e.Button ==MouseButtons.Left )
            {
                capture = true;
                old = e.Location;
            }
            textBox2.Text = string.Format("{0}", old);
            textBox1.Text = string.Format("{0}", capture);
        }

        private void panel1_MouseUp(object sender, MouseEventArgs e)
        {
            if(e.Button ==MouseButtons.Left )
            {
                capture = false;
            }
            textBox1.Text = string.Format("{0}", capture);
        }
        private void Form1_KeyDown(object sender, KeyEventArgs e)
        { 

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void panel1_MouseHover(object sender, EventArgs e)
        {
            cap = true;
            textBox3.Text = string.Format("{0}", cap);
        }

        private void panel1_MouseMove(object sender, MouseEventArgs e)
        {
            cap = false;
            textBox3.Text = string.Format("{0}", cap);
            if (e.Button == MouseButtons.Left)
            {
                old = e.Location;
            }
            textBox2.Text = string.Format("{0}", old);
        }

        private void panel1_MouseEnter(object sender, EventArgs e)
        {
            textBox1.Text = string.Format("{0}", capture);
            textBox3.Text = string.Format("{0}", cap);
        }

        private void panel1_MouseLeave(object sender, EventArgs e)
        {
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
        }
        private string eve="";
        private void Form1_KeyPress(object sender, KeyPressEventArgs e)
        {
            eve += e.KeyChar ;
            textBox4.Text = eve;
        }

        private void Form1_KeyUp(object sender, KeyEventArgs e)
        {
            MessageBox.Show(eve);
            textBox4.Clear();
            eve = "";
        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
