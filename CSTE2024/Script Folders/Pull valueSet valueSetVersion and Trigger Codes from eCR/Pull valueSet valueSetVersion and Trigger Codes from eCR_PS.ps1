
## Multiple Folders Grab
$folders = "Z:\eCR Storage Folder\2024-03-12",
            "Z:\eCR Storage Folder\2024-03-13"

# Working Directory. This is the location you saved the CSTE2024 Folder from GitHub.
$WD = "C:\Users\user\Downloads"

# $expand_folder is where the compressed file will be unzipped
$expand_folder = -join($WD,"\","CSTE2024-main\CSTE2024-main\CSTE2024\Working Folders\expand_folder")

# $transform_folder is where the XSL transformation of the eCR will land
$transform_folder_Valueset = -join($WD,"\","CSTE2024-main\CSTE2024-main\CSTE2024\Working Folders\transform_folder\transform_folder_valueSet_script")

# $output_folder is where the csv output file will be saved
$output_folder = -join($WD,"\","CSTE2024-main\CSTE2024-main\CSTE2024\Working Folders\output_folder")

# $XSLT_file is the path to the XSL file used
$XSLT_file_Valueset = -join($WD,"\","CSTE2024-main\CSTE2024-main\CSTE2024\Script Folders\Pull valueSet valueSetVersion and Trigger Codes from eCR\Pull valueSet valueSetVersion and Trigger Codes from eCR_XSL.xsl")

# $wavFile is the sound/alarm noise you want to play when the script is done.
$wavFile = -join($WD,"\","CSTE2024-main\CSTE2024-main\CSTE2024\Sounds\soundfile.wav")

## Things you don't need to edit
$expand_folder_xml = (-join( $expand_folder,"\*.xml"))
$expand_folder_html = (-join( $expand_folder,"\*.html"))


function Get-ValueSet {

param($Trail)

# Unzipping folder
Expand-Archive -Path $Trail -DestinationPath $expand_folder -Force 

# Find the path to the eCR.xml
$rawfileECR = Get-ChildItem -Path $expand_folder -Filter "*CR.xml" -Name

# Get eCR Document ID and create new file name
$ECR = [XML](Get-Content (-join( $expand_folder,"\", $rawfileECR))) 
$NameECR = $ECR.ClinicalDocument.id.root+"_ECR"+".xml"

# Rename file
Rename-Item -NewName $NameECR -Path (-join( $expand_folder,"\", $rawfileECR))

# XSL Transformation
$xsltrr = New-Object System.Xml.Xsl.XslCompiledTransform
$xsltrr.Load($XSLT_file_Valueset) 
$xsltrr.Transform((-join( $expand_folder,"\",$NameECR)),(-join( $transform_folder_Valueset,"\",$NameECR)))

# Remove files from the $expand_folder
Remove-Item $expand_folder_xml
Remove-Item $expand_folder_html

}



        foreach ($folder in $folders){

        Get-ChildItem $folder -Filter "*.zip" |
        ForEach-Object {Get-ValueSet $_.FullName}
        }


        # -Filter "*.zip" ### Will filter only for zipped folders
        # -Filter "1.2.840.114350.1.13.333*" ### Will filter for a specific folder/file name
        # -Exclude "1.2.840.114350.1.13*" ### Will exclude specific folder/file name


# Below code will remove all files with an xml extension from the $transform_folder.
#        Remove-Item (-join( $transform_folder_Valueset,"\*.xml"))


$Alarm=New-Object System.Media.SoundPlayer
$Alarm.SoundLocation= $wavFile
$Alarm.playsync()
