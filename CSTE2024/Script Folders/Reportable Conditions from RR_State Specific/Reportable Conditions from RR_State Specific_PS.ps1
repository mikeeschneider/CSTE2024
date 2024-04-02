## Multiple Folders Grab
$folders = "Z:\eCR Storage Folder\2024-03-12",
           "Z:\eCR Storage Folder\2024-03-13"

# Working Directory. This is the location you saved the CSTE2024 Folder from GitHub.
$WD = "C:\Users\user\Downloads"

# $expand_folder is where the compressed file will be unzipped
$expand_folder = -join($WD,"\","CSTE2024\Working Folders\expand_folder")

# $transform_folder is where the XSL transformation of the eCR will land
$transform_folder = -join($WD,"\","CSTE2024\Working Folders\transform_folder")

# $output_folder is where the csv output file will be saved
$output_folder = -join($WD,"\","CSTE2024\Working Folders\output_folder")

# $XSLT_file is the path to the XSL file used
$XSLT_file = -join($WD,"\","CSTE2024\Script Folders\Reportable Conditions from RR_State Specific\Reportable Conditions from RR_State Specific_XSL.xsl")

# Name the csv file below. Extension, ".csv", not needed.
$csv_name = "CSV file name"

# $wavFile is the sound/alarm noise you want to play when the script is done.
$wavFile = -join($WD,"\","CSTE2024\Sounds\Alarm09.wav")

## Things you don't need to edit
$expand_folder_xml = (-join( $expand_folder,"\*.xml"))
$expand_folder_html = (-join( $expand_folder,"\*.html"))

$csvExt = ".csv"

###### BEFORE STARTING ######
# You must edit the line 5 (<xsl:variable name="state" select="'ct'"/>) of the XSL
# with your state extension found in the RR
###### --------------- ######


function Get-RRXML {

param($Trail)


try {
# Unzipping folder
Expand-Archive -Path $Trail -DestinationPath $expand_folder -Force 

# Finds and assigns the RR xml to $rawfilerr
$rawfileRR = Get-ChildItem -Path $expand_folder -Filter "*RR.xml" -Name

$RR = [XML](Get-Content (-join( $expand_folder,"\",$rawfilerr))) 
$NameRR = $RR.ClinicalDocument.id.root+"_RR"
$NewNameRR = $NameRR+".xml"
$TransformedRR = $NameRR+".xml"
$Namepathrr = (-join( $expand_folder,"\",$Namexmlrr))


#Rename file
Rename-Item -NewName $NewNameRR -Path (-join( $expand_folder,"\",$rawfileRR))

#XSL Transformation
$xsltrr = New-Object System.Xml.Xsl.XslCompiledTransform
$xsltrr.Load($XSLT_file) 
$xsltrr.Transform((-join( $expand_folder,"\",$NewNameRR)),(-join( $transform_folder,"\",$TransformedRR)))  

            Remove-Item $expand_folder_xml
            Remove-Item $expand_folder_html


$transform_xml = (-join( $transform_folder,"\",$TransformedRR))

$RRxml = [XML](Get-Content $transform_xml)
$custobject = [PSCustomObject]@{
    eCRNum = $RRxml.RRxml.documentInfo.eCRNum.value
    setId = $RRxml.RRxml.documentInfo.setId.value
    versionNumber = $RRxml.RRxml.documentInfo.versionNumber.value
    
    ecrReceiptTime = $RRxml.RRxml.documentInfo.ecrReceiptTime.value
    ecrReceiptTime2 = $RRxml.RRxml.documentInfo.ecrReceiptTime2
    
    rrTime = $RRxml.RRxml.documentInfo.rrTime.value
    rrTime2 = $RRxml.RRxml.documentInfo.rrTime2
    
    encompassingEncounterDatelow = $RRxml.RRxml.documentInfo.encompassingEncounterDateLow

    encompassingEncounterDatehigh = $RRxml.RRxml.documentInfo.encompassingEncounterDateHigh
    
    encompassingEncounterCode = $RRxml.RRxml.documentInfo.encompassingEncounterCode.value

    manualInitiation = $RRxml.RRxml.documentInfo.manualInitiation.value

    Firstname = $RRxml.RRxml.documentInfo.FirstName.value
    Lastname = $RRxml.RRxml.documentInfo.LastName.value
    DOB = $RRxml.RRxml.documentInfo.DOB.value
    
    receivedOrgName = $RRxml.RRxml.documentInfo.receivedOrgName.value
    receivedOrgState = $RRxml.RRxml.documentInfo.receivedOrgState.value

    providerOrgName = $RRxml.RRxml.documentInfo.providerOrgName.value
    providerOrgState = $RRxml.RRxml.documentInfo.providerOrgState.value

    serviceProviderName = $RRxml.RRxml.documentInfo.serviceProviderOrgName.value
    serviceProviderState = $RRxml.RRxml.documentInfo.serviceProviderOrgState.value

    healthCareFacilityName = $RRxml.RRxml.documentInfo.healthCareFacilityName.value
    healthCareFacilityState = $RRxml.RRxml.documentInfo.healthCareFacilityState.value

    condition1code = $RRxml.RRxml.conditionCode.condition1state.value
    condition2code = $RRxml.RRxml.conditionCode.condition2state.value
    condition3code = $RRxml.RRxml.conditionCode.condition3state.value
    condition4code = $RRxml.RRxml.conditionCode.condition4state.value
    condition5code = $RRxml.RRxml.conditionCode.condition5state.value
    condition6code = $RRxml.RRxml.conditionCode.condition6state.value
    condition7code = $RRxml.RRxml.conditionCode.condition7state.value
    
    displayName1 = $RRxml.RRxml.conditionCode.displayName1.value
    displayName2 = $RRxml.RRxml.conditionCode.displayName2.value
    displayName3 = $RRxml.RRxml.conditionCode.displayName3.value
    displayName4 = $RRxml.RRxml.conditionCode.displayName4.value
    displayName5 = $RRxml.RRxml.conditionCode.displayName5.value
    displayName6 = $RRxml.RRxml.conditionCode.displayName6.value
    displayName7 = $RRxml.RRxml.conditionCode.displayName7.value

    rulescondition1 = $RRxml.RRxml.rules.rulescondition1
    rulescondition2 = $RRxml.RRxml.rules.rulescondition2
    rulescondition3 = $RRxml.RRxml.rules.rulescondition3
    rulescondition4 = $RRxml.RRxml.rules.rulescondition4
    rulescondition5 = $RRxml.RRxml.rules.rulescondition5
    rulescondition6 = $RRxml.RRxml.rules.rulescondition6
    rulescondition7 = $RRxml.RRxml.rules.rulescondition7

        
    } | Export-Csv (-join( $output_folder,"\",$csv_name,$csvExt)) -Append

# Remove transformed xml from $transform_folder
Remove-Item $transform_xml
}
catch {
# Records Errors in a separate CSV file name $csv_name+_ERRORS
    $custobject = [PSCustomObject]@{
    Error = ("An error occured: $($_.Exception.Message)" -join " ^ ")
    FilePath = $Trail
    }  | Export-Csv (-join( $output_folder,"\",$csv_name,"_ERRORS",$csvExt)) -Append
}
finally {}

}



        foreach ($folder in $compressed_folders){

        Get-ChildItem $folder -Filter "*.zip" |
        ForEach-Object {Get-RRXML $_.FullName}
        }


        # -Filter "*.zip" 
        # -Filter "1.2.840.114350.1.13.333*"
        # -Exclude "1.2.840.114350.1.13*"


$Alarm=New-Object System.Media.SoundPlayer
$Alarm.SoundLocation= $wavFile
$Alarm.playsync()

