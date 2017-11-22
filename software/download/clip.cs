using System;
using System.Diagnostics;
using System.Windows.Forms;
using System.Drawing;
using System.Drawing.Printing;

class Clip
{
	Bitmap m_bmp = null;

	public Clip() {
		IDataObject data = Clipboard.GetDataObject();
		if(data!=null) {
			object bmp = data.GetData("System.Drawing.Bitmap");
			if(bmp!=null) {
				m_bmp = (Bitmap)bmp;
				PrintDocument pd = new PrintDocument();
				pd.PrintPage += new PrintPageEventHandler(this.pd_PrintPage);
				pd.Print();
				Console.WriteLine("Printed.");
				return;
			}
		}
		Console.WriteLine("No bitmap found.");
	}

	public static void Main(string[] args) {
		new Clip();
	}

	private void pd_PrintPage(object sender, PrintPageEventArgs ev) {
		Graphics g = ev.Graphics;

		double bw2h = (double)m_bmp.Width / (double)m_bmp.Height;
		double pw2h = (double)ev.MarginBounds.Width / (double)ev.MarginBounds.Height;
		Rectangle bounds = ev.MarginBounds;

		if(bw2h >= pw2h) { // bound by width
			bounds.Height = (int)(bounds.Width/bw2h);
		} else { // bound by height
			bounds.Width = (int)(bounds.Height*bw2h);
		}
		g.DrawImage(m_bmp,bounds);
		ev.HasMorePages = false;
	}
}