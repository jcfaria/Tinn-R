#==========================================================================#
# What  : Necessary packages and details of installation to Tinn-R project #
# To    : Delphi 7 and CodeGear 2007                                       #
# Who   : Jose Claudio Faria                                               #
# When  : 2013/10/15                                                       #
# Doubts: joseclaudio.faria@gmail.com                                      #
#==========================================================================#

01. Abbrevia
    - Instructions: Abbrevia\readme.txt
      - Add the source subdirectory (e.g., d:\abbrevia\source) to the
        IDE's library path
    - B305vr70.dpk: compile
    - B305vd70.dpk: compile and install
    - It is a bit big suite of components and resources and
      it is not released with the sources of the Tinn-R project.

02. EditAlign
    - EditControls.dpk
    - Instructions: compile and install

03. FindFile
    - FdFile.dpk
    - Instructions: compile and install

04. HotkeyManager
    - HKManager.dpk
    - Instructions: compile and install

05. InstanceControl
    - IControl.dpk
    - Instructions: compile and install

06. JVCL - project JEDI
    - jcl: install.bat
    - jvcl: install.bat
    - It is a big suite of components and resources and
      it is not released with the sources of the Tinn-R project.

07. muconsole.1.00a
    - MuConsole.dpk
    - Instructions: compile and install

08. SynEdit
    - This version is adapted to Tinn-R project
    - Add the source subdirectory (e.g., C:\Users\jcfaria\Documents\RAD
      Studio\components\SynEdit\Source) to the IDE's library path
    - SynEdit_R2007.dpk: compile
    - SynEdit_D2007.dpk: compile and install

09. TB2k
    - tb2k_d2007.dpk: compile
    - tb2kdsgn_d2007.dpk: compile and install

10. trShape
    - trShape_D7.dpk: compile and install

11. TSpellers
    - SpellersRT_7.dpk: compile
    - SpellersD_7.dpk: compile and install

12. Sockets (Borland)
    - Main menu: Components\Install Packages
    - Add
    - PathOfCodeGEar\Bin\dclsockets100.bpl
    - Ok
    - It will be installed in the 'Internet' pallet

The XPMenu was removed from the project: more problems than solutions!

It is all!
Tinn-R must compile after the installation of the packages above.