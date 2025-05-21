*** Settings ***
Library    OperatingSystem
Resource   os.robot

*** Test Cases ***
Create some Directories
    [Tags]    DirTest
    os.Create a base dir
    os.Create source directory
    os.Create dest directory

Create some Files
    [Tags]    FileTest
    os.Create File1
    os.Create File2
    os.Create File3

FileManagement
    [Tags]    FileMgmt
    os.Move File3 from DirtOne to DirtTwo
    os.Copy File1 from DirtOne to DirtTwo
