Name "Tagaini Jisho ${VERSION}"
OutFile "install.exe"
SetCompressor /SOLID "lzma"

InstallDir "$PROGRAMFILES\Tagaini Jisho"
RequestExecutionLevel admin
LicenseData "${SRCDIR}/COPYING.txt"
Page license
Page directory
Page instfiles
UninstPage uninstConfirm
UninstPage instfiles

Section "Tagaini Jisho"
IfFileExists "$LOCALAPPDATA\VirtualStore\Program Files\Tagaini Jisho\kanjidic2.db" VSTOREKANJIDICEXISTS VSTOREKANJIDICEND
VSTOREKANJIDICEXISTS:
Delete "$LOCALAPPDATA\VirtualStore\Program Files\Tagaini Jisho\jmdict.db"
Delete "$LOCALAPPDATA\VirtualStore\Program Files\Tagaini Jisho\kanjidic2.db"
RMDir "$LOCALAPPDATA\VirtualStore\Program Files\Tagaini Jisho"
VSTOREKANJIDICEND:

SetOutPath "$INSTDIR"
File "${BUILDDIR}/src/gui/tagainijisho.exe"
File "${BUILDDIR}/*.db"
File "${SRCDIR}/src/gui/export_template.html"
File "${SRCDIR}/src/gui/detailed_default.html"
File "${SRCDIR}/src/gui/detailed_default.css"
File "${SRCDIR}/src/gui/jmdict/detailed_jmdict.html"
File "${SRCDIR}/src/gui/jmdict/detailed_jmdict.css"
File "${SRCDIR}/src/gui/kanjidic2/detailed_kanjidic2.html"
File "${SRCDIR}/src/gui/kanjidic2/detailed_kanjidic2.css"
File "${QTPATH}/bin/QtCore4.dll"
File "${QTPATH}/bin/QtGui4.dll"
File "${QTPATH}/bin/QtNetWork4.dll"
File "${QTPATH}/bin/libgcc_s_dw2-1.dll"
File "${MINGWDLLPATH}/mingwm10.dll"
File "qt.conf"
SetOutPath "$INSTDIR\i18n"
File "${BUILDDIR}/i18n/*.qm"
SetOutPath "$INSTDIR\doc"
File "${SRCDIR}/doc/manual.html"
File /r "${SRCDIR}/doc/images"
WriteUninstaller "$INSTDIR\uninstall.exe"
CreateDirectory "$SMPROGRAMS\Tagaini Jisho"
CreateShortCut "$SMPROGRAMS\Tagaini Jisho\Tagaini Jisho.lnk" "$INSTDIR\tagainijisho.exe"
CreateShortCut "$SMPROGRAMS\Tagaini Jisho\Uninstall.lnk" "$INSTDIR\uninstall.exe"
WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Tagaini Jisho" "DisplayName" "Tagaini Jisho"
WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Tagaini Jisho" "UninstallString" "$INSTDIR/uninstall.exe"
SectionEnd

Section "uninstall"
Delete "$SMPROGRAMS\Tagaini Jisho\Tagaini Jisho.lnk"
Delete "$SMPROGRAMS\Tagaini Jisho\Uninstall.lnk"
RMDir "$SMPROGRAMS\Tagaini Jisho"
RMDir /r "$INSTDIR\doc\images"
Delete "$INSTDIR\doc\manual.html"
RMDir "$INSTDIR\doc"
Delete "$INSTDIR\i18n\*.qm"
RMDir "$INSTDIR\i18n"
Delete "$INSTDIR\export_template.html"
Delete "$INSTDIR\detailed_default.html"
Delete "$INSTDIR\detailed_default.css"
Delete "$INSTDIR\detailed_jmdict.html"
Delete "$INSTDIR\detailed_jmdict.css"
Delete "$INSTDIR\detailed_kanjidic2.html"
Delete "$INSTDIR\detailed_kanjidic2.css"
Delete "$INSTDIR\QtCore4.dll"
Delete "$INSTDIR\QtGui4.dll"
Delete "$INSTDIR\QtNetwork4.dll"
Delete "$INSTDIR\qt.conf"
Delete "$INSTDIR\libgcc_s_dw2-1.dll"
Delete "$INSTDIR\mingwm10.dll"
Delete "$INSTDIR\export_template.html"
Delete "$INSTDIR\*.db"
Delete "$INSTDIR\tagainijisho.exe"
Delete "$INSTDIR\uninstall.exe"
RMDir "$INSTDIR"
DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Tagaini Jisho"
SectionEnd
