if [ "$ImportsPowerShellUniversalRepoUtilsPs1" != "" ]; then
    return
fi

export ImportsPowerShellUniversalRepoUtilsPs1=1
function Write_RepoCorruptMessage() {
    echo "Something happened to your copy of the code repository.
A file or directory that is required is missing.  You
will have to reset the repository to a previous commit.
"
}