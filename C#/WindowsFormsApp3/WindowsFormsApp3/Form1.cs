using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp3
{
    public partial class Form1 : Form
    {

        public Form1()
        {
            InitializeComponent();
        }
        private void button1_Click(object sender, EventArgs e)
        {
            timer1.Start();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            timer1.Stop();
            MessageBox.Show(string.Format("中奖号码为\n{0} {1} {2} {3} {4} {5}\n{6}", label1.Text, label2.Text, label3.Text, label4.Text, label5.Text, label6.Text, label7.Text));
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            Random r = new Random();
            int gre = r.Next(1, 16);
            int[] a = new int[6];
            for (int i = 0; i < 6; i++)
            {
                a[i] = r.Next ()%34+1;
            }
            if (a[0] < 10)
            {
                label1.Text = string.Format("0{0}", a[0]);
            }
            else
            {
                label1.Text = string.Format("{0}", a[0]);
            }

            if (a[1] < 10)
            {
                label2.Text = string.Format("0{0}", a[1]);
            }
            else
            {
                label2.Text = string.Format("{0}", a[1]);
            }

            if (a[2] < 10)
            {
                label3.Text = string.Format("0{0}", a[2]);
            }
            else
            {
                label3.Text = string.Format("{0}", a[2]);
            }

            if (a[3] < 10)
            {
                label4.Text = string.Format("0{0}", a[3]);
            }
            else
            {
                label4.Text = string.Format("{0}", a[3]);
            }

            if (a[4] < 10)
            {
                label5.Text = string.Format("0{0}", a[4]);
            }
            else
            {
                label5.Text = string.Format("{0}", a[4]);
            }

            if (a[5] < 10)
            {
                label6.Text = string.Format("0{0}", a[5]);
            }
            else
            {
                label6.Text = string.Format("{0}", a[5]);
            }

            if(gre<10)
            {
                label7.Text = string.Format("0{0}", gre);
            }
            else
            {
                label7.Text = string.Format("{0}", gre);
            }
        }
    }
}
