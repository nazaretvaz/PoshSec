 function Confirm-SecIsAdministrator {
 	<#    
    	.SYNOPSIS
    	    Checks to see if user is running as administrator
    	.DESCRIPTION
    	    This function checks to see if the user is currently running as an administrator
    	.PARAMETER WriteMessage
    	    This parameter writes a warning message to the screen to indicate that the user is not an administrator.
    	.EXAMPLE
    	    PS> Confirm-IsAdministrator
    	        False
    	.EXAMPLE
    	    PS> if (Confirm-IsAdministrator) { Write-Host "You are an admin" }
    	        You are an admin
    	.LINK
    	    www.poshsec.com
		.LINK 
			github.com/PoshSec
    	.NOTES
    	    This function is a utility function for the PoshSec module.
    #> 
	
	[CmdletBinding()]
	[OutputType([System.Boolean])]
    param(
    )

    if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")){
    	Write-Verbose -Message "You do not have Administrator rights to run this script! Please re-run this script as an Administrator!"
        return $false
    } else {
		  return $true
	}
}