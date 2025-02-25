if($ImportsPowerShellSpecificPsUtilsPsm1){
    return
}
$ImportsPowerShellSpecificPsUtilsPsm1 = $true

#Serves the same purpose as a "using" block
#in C# or a "with" statement in Python.
#This works, but if you want to give the 
#object a specific name, you MUST
#use a "param()" statement inside your
#script block.
#
#The "IDisposable" object will always be passed as the only
#parameter to the provided script block.
#
function Use-InThisBlockOnly{
    param(
        [Parameter(Mandatory=$true)]
        [IDisposable] $object,
        [Parameter(Mandatory=$true)]
        [ScriptBlock] $block
    )

    try {
        $null = .$block $object
    } finally {
        $object.Dispose()
    }
}
Export-ModuleMember -Function Use-InThisBlockOnly