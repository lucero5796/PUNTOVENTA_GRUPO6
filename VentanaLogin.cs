using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using MiLibreria;


namespace Login
{
    public partial class VentanaLogin : Form
    {
        public VentanaLogin()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
        public static String codigo = "";
        private void btnIniciar_Click(object sender, EventArgs e)
        {
            try
            {
                string cmd = string.Format("SELECT * FROM TEmpleado WHERE Usuario='{0}' AND Contraseña='{1}'", textUsuario.Text.Trim(), textContraseña.Text.Trim());
                DataSet ds = Utilidades.Ejecutar(cmd);

                codigo = ds.Tables[0].Rows[0]["CodEmpleado"].ToString().Trim();
                string cuenta = ds.Tables[0].Rows[0]["Usuario"].ToString().Trim();
                string contra = ds.Tables[0].Rows[0]["Contraseña"].ToString().Trim();
                if (cuenta == textUsuario.Text.Trim() && contra== textContraseña.Text.Trim())
                {
                    if(Convert.ToBoolean(ds.Tables[0].Rows[0]["Status_admin"].ToString().Trim())==true)
                    {
                        VentanaAdmin VentanaAdministrador = new VentanaAdmin();
                        this.Hide();
                        VentanaAdministrador.Show();
                    }
                    else
                    {
                        VentanaUsuario VentanaUser = new VentanaUsuario();
                        this.Hide();
                        VentanaUser.Show();
                    }
                }
            }
            catch(Exception error)
            {
                MessageBox.Show("Usuario o contraseña incorrecta!.... ",error.Message);
            }
        }

        private void VentanaLogin_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }
        private void btnSalir_Click_1(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
