﻿using System;
using System.IO;
using Helpers;

namespace BLL.Workflows
{
    public class CleanTaskBootFiles
    {
        private readonly Models.Computer _computer;
        private readonly string _bootFile;
        private const string ConfigFolder = "pxelinux.cfg";

        public CleanTaskBootFiles(Models.Computer computer)
        {
            _computer = computer;
            _bootFile = Utility.MacToPxeMac(_computer.Mac);
        }

        private void DeleteProxyFile(string architecture, string extension = "")
        {
            try
            {

                File.Delete(Settings.TftpPath + "proxy" + Path.DirectorySeparatorChar + architecture +
                            Path.DirectorySeparatorChar + ConfigFolder + Path.DirectorySeparatorChar + _bootFile +
                            extension);
            }
            catch (Exception ex)
            {
                Logger.Log(ex.Message);
            }
        }

        private void DeleteStandardFile(string extension = "")
        {
            try
            {
                File.Delete(Settings.TftpPath + ConfigFolder + Path.DirectorySeparatorChar +
                            _bootFile + extension);
            }
            catch (Exception ex)
            {
                Logger.Log(ex.Message);
            }
        }

        public void CleanPxeBoot()
        {    
            if (Settings.ProxyDhcp == "Yes")
            {
                DeleteProxyFile("bios");
                DeleteProxyFile("bios", ".ipxe");
                DeleteProxyFile("efi32");
                DeleteProxyFile("efi32", ".ipxe");
                DeleteProxyFile("efi64");
                DeleteProxyFile("efi64", ".ipxe");
                DeleteProxyFile("efi64", ".cfg");
            }
            else
            {
                var mode = Settings.PxeMode;
                if (mode.Contains("ipxe"))
                    DeleteStandardFile(".ipxe");
                else if (mode.Contains("grub"))
                    DeleteStandardFile(".cfg");
                else        
                    DeleteStandardFile();
            }

            if(Convert.ToBoolean(_computer.CustomBootEnabled))
                BLL.ComputerBootMenu.CreateBootFiles(_computer);

        }
    }
}