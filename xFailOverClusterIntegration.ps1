
<#PSScriptInfo

.VERSION 1.0.0.0

.GUID b2792af5-4ecf-485e-85bf-303bef202234

.AUTHOR Johan Ljunggren

.COMPANYNAME

.COPYRIGHT

.TAGS DSC Config

.LICENSEURI https://github.com/johlju/xFailOverClusterIntegration/blob/master/LICENSE

.PROJECTURI https://github.com/johlju/xFailOverClusterIntegration

.ICONURI

.EXTERNALMODULEDEPENDENCIES

.REQUIREDSCRIPTS

.EXTERNALSCRIPTDEPENDENCIES

.RELEASENOTES

#>

#Requires -Module xFailOverClusterIntegrationModule
#Requires -Module PSDscResources
#Requires -Module xComputerManagement
#Requires -Module xActiveDirectory

<#
    .DESCRIPTION
        Example configuration script to demonstrate pairing a
        PowerShell Desired State Configuration script with a module that
        contains supporting assets.

    .EXAMPLE
        xFailOverClusterIntegration `
            -ConfigurationData '.\ConfigurationData\xFailOverClusterIntegrationConfig.ConfigData.psd1
            -OutPath '.\xFailOverClusterIntegrationConfig\MOF
#>

Configuration xFailOverClusterIntegration
{
    Import-DscResource -ModuleName 'PSDscResources'

    Node san01
    {
        Group testGroup
        {
            Ensure    = 'Present'
            GroupName = $Node.GroupName
        }
    }
}

Configuration DomainController
{
    Import-DscResource -ModuleName 'PSDscResources'
    Import-DscResource -ModuleName 'xComputerManagement'
    Import-DscResource -ModuleName 'xActiveDirectory'

    Node dc01
    {
        Group testGroup
        {
            Ensure    = 'Present'
            GroupName = $Node.GroupName
        }
    }
}
