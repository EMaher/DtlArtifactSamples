# Artifact template

This artifact template provides standardized structure and error handling for DevTest Lab artifacts. 

The template provides a simple way to ensure that errors are bubbled up as artifact failures and all artifact output is available in the azure portal. It also provides a central location to define common functionality that is used by many artifacts so that it does not to be reimplemented in each artifact.

##Artifact structure

To follow the template, your artifact should conform to the following rules

1. Copy **Artifact-main.ps1**, **artifact-funcs.ps1** and **ChocolateyPackageInstaller.ps1** from this folder into your artifact folder. These files should not be modified. If/when the template is updated in the future these files should be replaced with the new template files.
2. Implement the logic of your artifact in a file called **artifact.ps1**
3. Have your **artifactfile.json** to invoke artifact-main.ps1. Note - if your artifact.ps1 script takes parameters then you should pass them to artifact-main. They will be passed along to your artifact.ps1 file

##Rules
* Do not report failures by calling 'Exit 1' in your script. The recommended ways for an artifact to report an error is to either **Write-Error**, or **throw 'some error'**. Either of these will cause the artifact to report as failed in the Azure Portal. Calling Exit will interrupt the template flow and will not report as a failure in the portal.
