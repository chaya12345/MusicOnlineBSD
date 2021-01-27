using System;
using System.Collections.Generic;
using System.IO;
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
            string projectPath = AppDomain.CurrentDomain.BaseDirectory.Substring(0,
                    AppDomain.CurrentDomain.BaseDirectory.LastIndexOf("Server") - 1) + "\\DAL\\src\\" +
                        folderName;
            string newFolderName = Path.Combine(projectPath, folderToFormatted);
            System.IO.Directory.CreateDirectory(newFolderName);
            var filePath = AppDomain.CurrentDomain.BaseDirectory.Substring(0,
                    AppDomain.CurrentDomain.BaseDirectory.LastIndexOf("Server") - 1) + "\\DAL\\src\\" +
                        folderName + "\\" + folderToFormatted + "\\" + postedFile.FileName;
            postedFile.SaveAs(filePath);
        }
        public static void SaveToTxtFile(string content, string folders, string fileName)
        {
            string FilePath = AppDomain.CurrentDomain.BaseDirectory.Substring(0,
                    AppDomain.CurrentDomain.BaseDirectory.LastIndexOf("Server") - 1) + "\\DAL\\src\\" +
                        "text\\" + folders + "\\" + fileName + ".txt";
            string FileContent = content;
            File.WriteAllText(FilePath, FileContent, System.Text.Encoding.UTF8);
        }
        public static string formatFolderName(string name)
        {
            return name.Replace(" ", "-");
        }
    }
}
