
<#PSScriptInfo

.VERSION 1.0.0.0

.GUID b2792af5-4ecf-485e-85bf-303bef202234

.AUTHOR Johan Ljunggren

.COMPANYNAME

.COPYRIGHT

.TAGS DSC Config

.LICENSEURI https://github.com/johlju/xFailOverCluster-Integration/blob/master/LICENSE

.PROJECTURI https://github.com/johlju/xFailOverCluster-Integration

.ICONURI

.EXTERNALMODULEDEPENDENCIES

.REQUIREDSCRIPTS

.EXTERNALSCRIPTDEPENDENCIES

.RELEASENOTES

#>

#Requires -Module xFailOverCluster-IntegrationModule
#Requires -Module PSDscResources

<#
    .DESCRIPTION
        Example configuration script to demonstrate pairing a
        PowerShell Desired State Configuration script with a module that
        contains supporting assets.

    .EXAMPLE
        xFailOverCluster-IntegrationConfig `
            -ConfigurationData '.\ConfigurationData\xFailOverCluster-IntegrationConfig.ConfigData.psd1
            -OutPath '.\xFailOverCluster-IntegrationConfig\MOF
#>

configuration xFailOverCluster-IntegrationConfig
{
    Import-DscResource -ModuleName 'PSDscResources'

    Node $AllNodes.NodeName
    {
        Group testGroup
        {
            Ensure    = 'Present'
            GroupName = $Node.GroupName
        }
    }
}
