using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp5
{
    public partial class Form1 : Form
    {
        private Point old;
        private bool a=false ;
        Random r = new Random();

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Paint(object sender, PaintEventArgs e)
        {
                
        }

        private void 完整小人ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            int a = r.Next(5);
            Pen p = new Pen(Color.FromArgb(r.Next (255),r.Next (255),r.Next(255)), 2);
            Graphics g = this.CreateGraphics();
            g.Clear(Color .White );
            g.DrawEllipse(p, 100, 100, 60, 60+r.Next (15));
            g.DrawEllipse(p, 120, 120+a, 2, 2);
            g.DrawEllipse(p, 140, 120+a, 2, 2);
            g.DrawArc(p, 117, 125+r.Next (10), 25, 18, 0, 180);
        }

        private void 全部清空ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            
        }

        private void Form1_MouseMove(object sender, MouseEventArgs e)
        {
            old = e.Location;
            label1.Text = old.ToString();
        }
    }
}
