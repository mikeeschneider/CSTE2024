# Working Directory. This is the location you saved the CSTE2024 Folder from GitHub.
$WD = "C:\Users\user\Downloads"

# $DestinationFolder is the location the zipped folder should be copied.
$DestinationFolder = -join($WD,"\","CSTE2024-main\CSTE2024-main\CSTE2024\Working Folders\output_folder\Search and Find Zips")

# $wavFile is the sound/alarm noise you want to play when the script is done.
$wavFile = -join($WD,"\","CSTE2024-main\CSTE2024-main\CSTE2024\Sounds\soundfile.wav")



# List all the folder paths (if applicable) separated by commas. These are locations the script will search for the $filenums
$folders = "Z:\eCR Storage Folder\2024-03-12",
            "Z:\eCR Storage Folder\2024-03-13"

# List all the eCR zipped folder names. Use an asterisk before or after $file (in loop below) if the names are incomplete.
$fileNums = "be6c7234-041c-555b-a444-4455667788",
            "be6d7234-041c-999b-a888-4455667799",
            "1.2.840.114350.1.13.409.2.7.8.688883.111111111"



foreach ($folder in $folders) {
foreach ($file in $fileNums) {
Get-ChildItem -Path $folder -Recurse -Filter *$file* |
ForEach-Object {Copy-Item -Path $_.FullName -Destination $DestinationFolder -Force}}}


$Alarm=New-Object System.Media.SoundPlayer
$Alarm.SoundLocation= $wavFile
$Alarm.playsync()
