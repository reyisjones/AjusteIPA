//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Text;
//using System.Threading.Tasks;
//using System.Data;
//using System.Data.SqlClient;
//using Microsoft.Reporting.WinForms;


//namespace AjusteIPA.Reports
//{
//    internal class ReportHelper
//    {
//        public void ReportLoad() {
//            Customers dsCustomers = GetData();
//            ReportDataSource datasource = new ReportDataSource("Customers", dsCustomers.Tables[0]);
//            this.reportViewer1.LocalReport.DataSources.Clear();
//            this.reportViewer1.LocalReport.DataSources.Add(datasource);
//            this.reportViewer1.RefreshReport();

//        }
//    }
//}
