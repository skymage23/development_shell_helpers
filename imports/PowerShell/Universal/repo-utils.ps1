if($ImportsPowerShellUniversalRepoUtilsPs1){
    return
}

$ImportsPowerShellUniversalRepoUtilsPs1 = $true

function Write-RepoCorruptMessage {
    Write-Host @"
Something happened to your copy of the code repository.
A file or directory that is required is missing.  You
will have to reset the repository to a previous commit.

"@ 
}