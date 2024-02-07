#Erik Desilets, 6 Feb 2022, CYB-300-T3415

#Variable for searching and acquiring files within the officefiles folder
$files = Get-ChildItem -Path C:\officefiles

#Repetition structure
#ForEach loop which checks each file in $files
ForEach ($f in $files){

       #Compound Conditional Statement to find HR and Sales files
        if($f -match "HR" -or $f -match "Sales"){

            #Rename variable to hold the new name with _backup addition
            $new_name = $f.BaseName + '_backup.txt'
            #Renames file to include previous title with the new _backup addition
            Rename-Item -Path $f.FullName -NewName $new_name

        }#closes if statement
}#closes ForEach statement

#Moves HR files from officefiles folder to the new HR_Backup folder
Get-Item -Path C:\officefiles\* -Include *HR* | Move-Item -Destination C:\HR_Backup
#Moves Sales files from officefiles folder to the new Sales_Backup folder
Get-Item -Path C:\officefiles\* -Include *Sales* | Move-Item -Destination C:\Sales_Backup
