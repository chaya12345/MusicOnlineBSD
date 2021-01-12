using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace BL
{
    public class SavingFilesBL
    {
        public static void SaveFile(HttpPostedFile postedFile, string folderName)
        {
            var filePath = AppDomain.CurrentDomain.BaseDirectory.Substring(0,
                    AppDomain.CurrentDomain.BaseDirectory.LastIndexOf("Server") - 1) + "\\DAL\\src\\" +
                        folderName + "\\" + postedFile.FileName;
            postedFile.SaveAs(filePath);
        }
        public static void SaveFileWithFormattedName(HttpPostedFile postedFile, string folderName, string folderToFormatted)
        {
            folderToFormatted = formatFolderName(folderToFormatted);
            var filePath = AppDomain.CurrentDomain.BaseDirectory.Substring(0,
                    AppDomain.CurrentDomain.BaseDirectory.LastIndexOf("Server") - 1) + "\\DAL\\src\\" +
                        folderName + "\\" + folderToFormatted + "\\" + postedFile.FileName;
            postedFile.SaveAs(filePath);
        }
        private static string formatFolderName(string name)
        {
            return name.Replace(" ", "-");
        }
    }
}
