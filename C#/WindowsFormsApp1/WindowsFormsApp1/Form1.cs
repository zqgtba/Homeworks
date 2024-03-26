using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            Random r = new Random();
            int[] a = new int[10];
            for (int i=0;i<10;i++)
            {
                a[i] = r.Next() % 100;
            }
            label6.Text = string.Format ("{0}",a[0]);
            label7.Text = string.Format("{0}", a[1]);
            label8.Text = string.Format("{0}", a[2]);
            label9.Text = string.Format("{0}", a[3]);
            label10.Text = string.Format("{0}", a[4]);
            label11.Text = string.Format("{0}", a[5]);
            label12.Text = string.Format("{0}", a[6]);
            label13.Text = string.Format("{0}", a[7]);
            label14.Text = string.Format("{0}", a[8]);
            label15.Text = string.Format("{0}", a[9]);
            string[] s = { "+", "-", "*" };
            int[] b = new int[5];
            for(int i=0;i<5;i++)
            {
                b[i] = r.Next() % 3;
            }
            label16.Text = s[b[0]];
            label17.Text = s[b[1]];
            label18.Text = s[b[2]];
            label19.Text = s[b[3]];
            label20.Text = s[b[4]];
            
        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            int score = 0;
            try
            {
                {
                    if (label20.Text == "+")
                    {
                        if (Convert.ToInt32(textBox1.Text) == Convert.ToInt32(label6.Text) + Convert.ToInt32(label15.Text))
                        {
                            label30.BackColor = Color.Green;
                            score += 20;
                        }

                        else
                            label30.BackColor = Color.Red;
                    }
                    if (label20.Text == "-")
                    {
                        if (Convert.ToInt32(textBox1.Text) == Convert.ToInt32(label6.Text) - Convert.ToInt32(label15.Text))
                        {
                            label30.BackColor = Color.Green;
                            score += 20;
                        }
                        else
                            label30.BackColor = Color.Red;
                    }
                    if (label20.Text == "*")
                    {
                        if (Convert.ToInt32(textBox1.Text) == Convert.ToInt32(label6.Text) * Convert.ToInt32(label15.Text))
                        {
                            label30.BackColor = Color.Green;
                            score += 20;
                        }
                        else
                            label30.BackColor = Color.Red;
                    }
                }//第一道题

                {
                    if (label19.Text == "+")
                    {
                        if (Convert.ToInt32(textBox2.Text) == Convert.ToInt32(label7.Text) + Convert.ToInt32(label14.Text))
                        {
                            label29.BackColor = Color.Green;
                            score += 20;
                        }

                        else
                            label29.BackColor = Color.Red;
                    }
                    if (label19.Text == "-")
                    {
                        if (Convert.ToInt32(textBox2.Text) == Convert.ToInt32(label7.Text) - Convert.ToInt32(label14.Text))
                        {
                            label29.BackColor = Color.Green;
                            score += 20;
                        }
                        else
                            label29.BackColor = Color.Red;
                    }
                    if (label19.Text == "*")
                    {
                        if (Convert.ToInt32(textBox2.Text) == Convert.ToInt32(label7.Text) * Convert.ToInt32(label14.Text))
                        {
                            label29.BackColor = Color.Green;
                            score += 20;
                        }
                        else
                            label29.BackColor = Color.Red;
                    }
                }//第二道题

                {
                    if (label18.Text == "+")
                    {
                        if (Convert.ToInt32(textBox3.Text) == Convert.ToInt32(label8.Text) + Convert.ToInt32(label13.Text))
                        {
                            label28.BackColor = Color.Green;
                            score += 20;
                        }

                        else
                            label28.BackColor = Color.Red;
                    }
                    if (label18.Text == "-")
                    {
                        if (Convert.ToInt32(textBox3.Text) == Convert.ToInt32(label8.Text) - Convert.ToInt32(label13.Text))
                        {
                            label28.BackColor = Color.Green;
                            score += 20;
                        }
                        else
                            label28.BackColor = Color.Red;
                    }
                    if (label18.Text == "*")
                    {
                        if (Convert.ToInt32(textBox3.Text) == Convert.ToInt32(label8.Text) * Convert.ToInt32(label13.Text))
                        {
                            label28.BackColor = Color.Green;
                            score += 20;
                        }
                        else
                            label28.BackColor = Color.Red;
                    }
                }//第三道题

                {
                    if (label17.Text == "+")
                    {
                        if (Convert.ToInt32(textBox4.Text) == Convert.ToInt32(label9.Text) + Convert.ToInt32(label12.Text))
                        {
                            label27.BackColor = Color.Green;
                            score += 20;
                        }

                        else
                            label27.BackColor = Color.Red;
                    }
                    if (label17.Text == "-")
                    {
                        if (Convert.ToInt32(textBox4.Text) == Convert.ToInt32(label9.Text) - Convert.ToInt32(label12.Text))
                        {
                            label27.BackColor = Color.Green;
                            score += 20;
                        }
                        else
                            label27.BackColor = Color.Red;
                    }
                    if (label17.Text == "*")
                    {
                        if (Convert.ToInt32(textBox4.Text) == Convert.ToInt32(label9.Text) * Convert.ToInt32(label12.Text))
                        {
                            label27.BackColor = Color.Green;
                            score += 20;
                        }
                        else
                            label27.BackColor = Color.Red;
                    }
                }//第四道题

                {
                    if (label16.Text == "+")
                    {
                        if (Convert.ToInt32(textBox5.Text) == Convert.ToInt32(label10.Text) + Convert.ToInt32(label11.Text))
                        {
                            label26.BackColor = Color.Green;
                            score += 20;
                        }

                        else
                            label26.BackColor = Color.Red;
                    }
                    if (label16.Text == "-")
                    {
                        if (Convert.ToInt32(textBox5.Text) == Convert.ToInt32(label10.Text) - Convert.ToInt32(label11.Text))
                        {
                            label26.BackColor = Color.Green;
                            score += 20;
                        }
                        else
                            label26.BackColor = Color.Red;
                    }
                    if (label16.Text == "*")
                    {
                        if (Convert.ToInt32(textBox5.Text) == Convert.ToInt32(label10.Text) * Convert.ToInt32(label11.Text))
                        {
                            label26.BackColor = Color.Green;
                            score += 20;
                        }
                        else
                            label26.BackColor = Color.Red;
                    }
                }//第五道题
                label32.Text = string.Format("{0}", score);
            }
            catch (FormatException )
            {
                MessageBox .Show ("请认真答卷！");
            }

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
    }
}
