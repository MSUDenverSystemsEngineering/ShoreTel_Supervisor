<#
.SYNOPSIS
	Displays a graphical console to browse the help for the App Deployment Toolkit functions
    # LICENSE #
    PowerShell App Deployment Toolkit - Provides a set of functions to perform common application deployment tasks on Windows. 
    Copyright (C) 2017 - Sean Lillis, Dan Cunningham, Muhammad Mashwani, Aman Motazedian.
    This program is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or any later version. This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. 
    You should have received a copy of the GNU Lesser General Public License along with this program. If not, see <http://www.gnu.org/licenses/>.
.DESCRIPTION
	Displays a graphical console to browse the help for the App Deployment Toolkit functions
.EXAMPLE
	AppDeployToolkitHelp.ps1
.NOTES
.LINK
	http://psappdeploytoolkit.com
#>

##*===============================================
##* VARIABLE DECLARATION
##*===============================================

## Variables: Script
[string]$appDeployToolkitHelpName = 'PSAppDeployToolkitHelp'
[string]$appDeployHelpScriptFriendlyName = 'App Deploy Toolkit Help'
[version]$appDeployHelpScriptVersion = [version]'3.6.5'
[string]$appDeployHelpScriptDate = '02/12/2017'

## Variables: Environment
[string]$scriptDirectory = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
#  Dot source the App Deploy Toolkit Functions
. "$scriptDirectory\AppDeployToolkitMain.ps1" -DisableLogging

##*===============================================
##* END VARIABLE DECLARATION
##*===============================================

##*===============================================
##* FUNCTION LISTINGS
##*===============================================

Function Show-HelpConsole {
	## Import the Assemblies
	Add-Type -AssemblyName 'System.Windows.Forms' -ErrorAction 'Stop'
	Add-Type -AssemblyName System.Drawing -ErrorAction 'Stop'

	## Form Objects
	$HelpForm = New-Object -TypeName 'System.Windows.Forms.Form'
	$HelpListBox = New-Object -TypeName 'System.Windows.Forms.ListBox'
	$HelpTextBox = New-Object -TypeName 'System.Windows.Forms.RichTextBox'
	$InitialFormWindowState = New-Object -TypeName 'System.Windows.Forms.FormWindowState'

	## Form Code
	$System_Drawing_Size = New-Object -TypeName 'System.Drawing.Size'
	$System_Drawing_Size.Height = 665
	$System_Drawing_Size.Width = 957
	$HelpForm.ClientSize = $System_Drawing_Size
	$HelpForm.DataBindings.DefaultDataSourceUpdateMode = 0
	$HelpForm.Name = 'HelpForm'
	$HelpForm.Text = 'PowerShell App Deployment Toolkit Help Console'
	$HelpForm.WindowState = 'Normal'
	$HelpForm.ShowInTaskbar = $true
	$HelpForm.FormBorderStyle = 'Fixed3D'
	$HelpForm.MaximizeBox = $false
	$HelpForm.Icon = New-Object -TypeName 'System.Drawing.Icon' -ArgumentList $AppDeployLogoIcon
	$HelpListBox.Anchor = 7
	$HelpListBox.BorderStyle = 1
	$HelpListBox.DataBindings.DefaultDataSourceUpdateMode = 0
	$HelpListBox.Font = New-Object -TypeName 'System.Drawing.Font' -ArgumentList ('Microsoft Sans Serif', 9.75, 1, 3, 1)
	$HelpListBox.FormattingEnabled = $true
	$HelpListBox.ItemHeight = 16
	$System_Drawing_Point = New-Object -TypeName 'System.Drawing.Point'
	$System_Drawing_Point.X = 0
	$System_Drawing_Point.Y = 0
	$HelpListBox.Location = $System_Drawing_Point
	$HelpListBox.Name = 'HelpListBox'
	$System_Drawing_Size = New-Object -TypeName 'System.Drawing.Size'
	$System_Drawing_Size.Height = 658
	$System_Drawing_Size.Width = 271
	$HelpListBox.Size = $System_Drawing_Size
	$HelpListBox.Sorted = $true
	$HelpListBox.TabIndex = 2
	$HelpListBox.add_SelectedIndexChanged({ $HelpTextBox.Text = Get-Help -Name $HelpListBox.SelectedItem -Full | Out-String })
	$helpFunctions = Get-Command -CommandType 'Function' | Where-Object { ($_.HelpUri -match 'psappdeploytoolkit') -and ($_.Definition -notmatch 'internal script function') } | Select-Object -ExpandProperty Name
	ForEach ($helpFunction in $helpFunctions) {
		$null = $HelpListBox.Items.Add($helpFunction)
	}
	$HelpForm.Controls.Add($HelpListBox)
	$HelpTextBox.Anchor = 11
	$HelpTextBox.BorderStyle = 1
	$HelpTextBox.DataBindings.DefaultDataSourceUpdateMode = 0
	$HelpTextBox.Font = New-Object -TypeName 'System.Drawing.Font' -ArgumentList ('Microsoft Sans Serif', 8.5, 0, 3, 1)
	$HelpTextBox.ForeColor = [System.Drawing.Color]::FromArgb(255, 0, 0, 0)
	$System_Drawing_Point = New-Object -TypeName System.Drawing.Point
	$System_Drawing_Point.X = 277
	$System_Drawing_Point.Y = 0
	$HelpTextBox.Location = $System_Drawing_Point
	$HelpTextBox.Name = 'HelpTextBox'
	$HelpTextBox.ReadOnly = $True
	$System_Drawing_Size = New-Object -TypeName 'System.Drawing.Size'
	$System_Drawing_Size.Height = 658
	$System_Drawing_Size.Width = 680
	$HelpTextBox.Size = $System_Drawing_Size
	$HelpTextBox.TabIndex = 1
	$HelpTextBox.Text = ''
	$HelpForm.Controls.Add($HelpTextBox)

	## Save the initial state of the form
	$InitialFormWindowState = $HelpForm.WindowState
	## Init the OnLoad event to correct the initial state of the form
	$HelpForm.add_Load($OnLoadForm_StateCorrection)
	## Show the Form
	$null = $HelpForm.ShowDialog()
}

##*===============================================
##* END FUNCTION LISTINGS
##*===============================================

##*===============================================
##* SCRIPT BODY
##*===============================================

Write-Log -Message "Load [$appDeployHelpScriptFriendlyName] console..." -Source $appDeployToolkitHelpName

## Show the help console
Show-HelpConsole

Write-Log -Message "[$appDeployHelpScriptFriendlyName] console closed." -Source $appDeployToolkitHelpName

##*===============================================
##* END SCRIPT BODY
##*===============================================
# SIG # Begin signature block
# MIIU4wYJKoZIhvcNAQcCoIIU1DCCFNACAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCEhLLxn4J4+GqO
# /cnHSFL/ZRYhK6NlawoAKjV8xFMpYqCCD4cwggQUMIIC/KADAgECAgsEAAAAAAEv
# TuFS1zANBgkqhkiG9w0BAQUFADBXMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xv
# YmFsU2lnbiBudi1zYTEQMA4GA1UECxMHUm9vdCBDQTEbMBkGA1UEAxMSR2xvYmFs
# U2lnbiBSb290IENBMB4XDTExMDQxMzEwMDAwMFoXDTI4MDEyODEyMDAwMFowUjEL
# MAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKDAmBgNVBAMT
# H0dsb2JhbFNpZ24gVGltZXN0YW1waW5nIENBIC0gRzIwggEiMA0GCSqGSIb3DQEB
# AQUAA4IBDwAwggEKAoIBAQCU72X4tVefoFMNNAbrCR+3Rxhqy/Bb5P8npTTR94ka
# v56xzRJBbmbUgaCFi2RaRi+ZoI13seK8XN0i12pn0LvoynTei08NsFLlkFvrRw7x
# 55+cC5BlPheWMEVybTmhFzbKuaCMG08IGfaBMa1hFqRi5rRAnsP8+5X2+7UulYGY
# 4O/F69gCWXh396rjUmtQkSnF/PfNk2XSYGEi8gb7Mt0WUfoO/Yow8BcJp7vzBK6r
# kOds33qp9O/EYidfb5ltOHSqEYva38cUTOmFsuzCfUomj+dWuqbgz5JTgHT0A+xo
# smC8hCAAgxuh7rR0BcEpjmLQR7H68FPMGPkuO/lwfrQlAgMBAAGjgeUwgeIwDgYD
# VR0PAQH/BAQDAgEGMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFEbYPv/c
# 477/g+b0hZuw3WrWFKnBMEcGA1UdIARAMD4wPAYEVR0gADA0MDIGCCsGAQUFBwIB
# FiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAzBgNVHR8E
# LDAqMCigJqAkhiJodHRwOi8vY3JsLmdsb2JhbHNpZ24ubmV0L3Jvb3QuY3JsMB8G
# A1UdIwQYMBaAFGB7ZhpFDZfKiVAvfQTNNKj//P1LMA0GCSqGSIb3DQEBBQUAA4IB
# AQBOXlaQHka02Ukx87sXOSgbwhbd/UHcCQUEm2+yoprWmS5AmQBVteo/pSB204Y0
# 1BfMVTrHgu7vqLq82AafFVDfzRZ7UjoC1xka/a/weFzgS8UY3zokHtqsuKlYBAIH
# MNuwEl7+Mb7wBEj08HD4Ol5Wg889+w289MXtl5251NulJ4TjOJuLpzWGRCCkO22k
# aguhg/0o69rvKPbMiF37CjsAq+Ah6+IvNWwPjjRFl+ui95kzNX7Lmoq7RU3nP5/C
# 2Yr6ZbJux35l/+iS4SwxovewJzZIjyZvO+5Ndh95w+V/ljW8LQ7MAbCOf/9RgICn
# ktSzREZkjIdPFmMHMUtjsN/zMIIEnzCCA4egAwIBAgISESHWmadklz7x+EJ+6RnM
# U0EUMA0GCSqGSIb3DQEBBQUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9i
# YWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIFRpbWVzdGFtcGluZyBD
# QSAtIEcyMB4XDTE2MDUyNDAwMDAwMFoXDTI3MDYyNDAwMDAwMFowYDELMAkGA1UE
# BhMCU0cxHzAdBgNVBAoTFkdNTyBHbG9iYWxTaWduIFB0ZSBMdGQxMDAuBgNVBAMT
# J0dsb2JhbFNpZ24gVFNBIGZvciBNUyBBdXRoZW50aWNvZGUgLSBHMjCCASIwDQYJ
# KoZIhvcNAQEBBQADggEPADCCAQoCggEBALAXrqLTtgQwVh5YD7HtVaTWVMvY9nM6
# 7F1eqyX9NqX6hMNhQMVGtVlSO0KiLl8TYhCpW+Zz1pIlsX0j4wazhzoOQ/DXAIlT
# ohExUihuXUByPPIJd6dJkpfUbJCgdqf9uNyznfIHYCxPWJgAa9MVVOD63f+ALF8Y
# ppj/1KvsoUVZsi5vYl3g2Rmsi1ecqCYr2RelENJHCBpwLDOLf2iAKrWhXWvdjQIC
# KQOqfDe7uylOPVOTs6b6j9JYkxVMuS2rgKOjJfuv9whksHpED1wQ119hN6pOa9PS
# UyWdgnP6LPlysKkZOSpQ+qnQPDrK6Fvv9V9R9PkK2Zc13mqF5iMEQq8CAwEAAaOC
# AV8wggFbMA4GA1UdDwEB/wQEAwIHgDBMBgNVHSAERTBDMEEGCSsGAQQBoDIBHjA0
# MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0
# b3J5LzAJBgNVHRMEAjAAMBYGA1UdJQEB/wQMMAoGCCsGAQUFBwMIMEIGA1UdHwQ7
# MDkwN6A1oDOGMWh0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20vZ3MvZ3N0aW1lc3Rh
# bXBpbmdnMi5jcmwwVAYIKwYBBQUHAQEESDBGMEQGCCsGAQUFBzAChjhodHRwOi8v
# c2VjdXJlLmdsb2JhbHNpZ24uY29tL2NhY2VydC9nc3RpbWVzdGFtcGluZ2cyLmNy
# dDAdBgNVHQ4EFgQU1KKESjhaGH+6TzBQvZ3VeofWCfcwHwYDVR0jBBgwFoAURtg+
# /9zjvv+D5vSFm7DdatYUqcEwDQYJKoZIhvcNAQEFBQADggEBAI+pGpFtBKY3IA6D
# lt4j02tuH27dZD1oISK1+Ec2aY7hpUXHJKIitykJzFRarsa8zWOOsz1QSOW0zK7N
# ko2eKIsTShGqvaPv07I2/LShcr9tl2N5jES8cC9+87zdglOrGvbr+hyXvLY3nKQc
# MLyrvC1HNt+SIAPoccZY9nUFmjTwC1lagkQ0qoDkL4T2R12WybbKyp23prrkUNPU
# N7i6IA7Q05IqW8RZu6Ft2zzORJ3BOCqt4429zQl3GhC+ZwoCNmSIubMbJu7nnmDE
# Rqi8YTNsz065nLlq8J83/rU9T5rTTf/eII5Ol6b9nwm8TcoYdsmwTYVQ8oDSHQb1
# WAQHsRgwggbIMIIFsKADAgECAhN/AAAAIhO6jvua86/0AAEAAAAiMA0GCSqGSIb3
# DQEBCwUAMGIxEzARBgoJkiaJk/IsZAEZFgNlZHUxGTAXBgoJkiaJk/IsZAEZFglt
# c3VkZW52ZXIxFTATBgoJkiaJk/IsZAEZFgV3aW5hZDEZMBcGA1UEAxMQd2luYWQt
# Vk1XQ0EwMS1DQTAeFw0xNjA1MjcyMTI0MDJaFw0xODA1MjcyMTI0MDJaMIG/MQsw
# CQYDVQQGEwJVUzERMA8GA1UECBMIQ29sb3JhZG8xDzANBgNVBAcTBkRlbnZlcjEw
# MC4GA1UEChMnTWV0cm9wb2xpdGFuIFN0YXRlIFVuaXZlcnNpdHkgb2YgRGVudmVy
# MSgwJgYDVQQLEx9JbmZvcm1hdGlvbiBUZWNobm9sb2d5IFNlcnZpY2VzMTAwLgYD
# VQQDEydNZXRyb3BvbGl0YW4gU3RhdGUgVW5pdmVyc2l0eSBvZiBEZW52ZXIwggEi
# MA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCxCPUOmGXq89WCOBso0z5QIApw
# EosnzQeoI9zP+n8wEb7BEA//+UTmjIZHe3jP0dF6C7EFhx2FcZxs8XQgSH5bnwor
# rkLMa1FzcP2GlcNE5F+ms1zk5Bp2x2nsMOcx+12h9A6eU+JR3nXfWFwkNfvOAKrj
# 1mo4BO5TEvx4DtrVBYFli+0JGnALa1Hd7A68nYtG743FPbioQn8EQSnDr+Jjtd8l
# vujd9I5IQPptiU3inmcoaG+UFz8HKu7QS/mOLpoz/kjbSShxdNF0mcFmowg8WYMu
# f8f1trOtsmWJ3lpyroKek8Ie9oOnKw3And2dOgqWxVXnfLEhW8b6PElvZc73AgMB
# AAGjggMXMIIDEzAOBgNVHQ8BAf8EBAMCBaAwEwYDVR0lBAwwCgYIKwYBBQUHAwEw
# GwYJKwYBBAGCNxUKBA4wDDAKBggrBgEFBQcDAzAdBgNVHQ4EFgQUxu8skV6twX8T
# i5hj8XjbzTUYeqgwHwYDVR0jBBgwFoAUbmigb8ibDuAf063cjbVhC57XDzQwggEo
# BgNVHR8EggEfMIIBGzCCARegggEToIIBD4aBxWxkYXA6Ly8vQ049d2luYWQtVk1X
# Q0EwMS1DQSgxKSxDTj1WTVdDQTAxLENOPUNEUCxDTj1QdWJsaWMlMjBLZXklMjBT
# ZXJ2aWNlcyxDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0aW9uLERDPXdpbmFkLERD
# PW1zdWRlbnZlcixEQz1lZHU/Y2VydGlmaWNhdGVSZXZvY2F0aW9uTGlzdD9iYXNl
# P29iamVjdENsYXNzPWNSTERpc3RyaWJ1dGlvblBvaW50hkVodHRwOi8vVk1XQ0Ew
# MS53aW5hZC5tc3VkZW52ZXIuZWR1L0NlcnRFbnJvbGwvd2luYWQtVk1XQ0EwMS1D
# QSgxKS5jcmwwggE+BggrBgEFBQcBAQSCATAwggEsMIG6BggrBgEFBQcwAoaBrWxk
# YXA6Ly8vQ049d2luYWQtVk1XQ0EwMS1DQSxDTj1BSUEsQ049UHVibGljJTIwS2V5
# JTIwU2VydmljZXMsQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz13aW5h
# ZCxEQz1tc3VkZW52ZXIsREM9ZWR1P2NBQ2VydGlmaWNhdGU/YmFzZT9vYmplY3RD
# bGFzcz1jZXJ0aWZpY2F0aW9uQXV0aG9yaXR5MG0GCCsGAQUFBzAChmFodHRwOi8v
# Vk1XQ0EwMS53aW5hZC5tc3VkZW52ZXIuZWR1L0NlcnRFbnJvbGwvVk1XQ0EwMS53
# aW5hZC5tc3VkZW52ZXIuZWR1X3dpbmFkLVZNV0NBMDEtQ0EoMSkuY3J0MCEGCSsG
# AQQBgjcUAgQUHhIAVwBlAGIAUwBlAHIAdgBlAHIwDQYJKoZIhvcNAQELBQADggEB
# AIpoMvUtE1iFHSbi7X/M9a+JBPpiAQZzEbq70is1mzdosSVTMN7QoWk4WzHCJBpX
# Oh7cvBrTLf0m4EqJ7OwPY43ZW7MycOjgtk393CaCzr9BiEDjWzJf8r5bDDCodEFm
# dodj3/el8nV4HapjiGnJKrhg0b3xRjPP4cvjtBltbqO7tngkpDu+m63X68aC3wrt
# XwJulfsGeTbd0v4hkji9GCTpLT92mkJyJE04SA/thv4F7yNx1W5XCEWswZeGLiR5
# 9C5AlUm1WrhjAaoyxabDJWfljV//qk+TeoC5CNQ7ZkqdxFBYPc5d2UdkmmiK76D+
# qaobXtlVJ9wRYfFoOaUb5dQxggSyMIIErgIBATB5MGIxEzARBgoJkiaJk/IsZAEZ
# FgNlZHUxGTAXBgoJkiaJk/IsZAEZFgltc3VkZW52ZXIxFTATBgoJkiaJk/IsZAEZ
# FgV3aW5hZDEZMBcGA1UEAxMQd2luYWQtVk1XQ0EwMS1DQQITfwAAACITuo77mvOv
# 9AABAAAAIjANBglghkgBZQMEAgEFAKBmMBgGCisGAQQBgjcCAQwxCjAIoAKAAKEC
# gAAwGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQwLwYJKoZIhvcNAQkEMSIEIOlq
# rAScjMDnliRqvf/99vAZYFJSiL7mOftVhV1pID6AMA0GCSqGSIb3DQEBAQUABIIB
# ABBKAoF0UXzLmS3A8Jclx/DS8MrrQGHHWva6gRkkglwjLwuMJDbAVkKpSCTSNGsD
# 1viw++WkfJLXMDrWD0rdwAWsjYWLAB43Ya49hHhX72cH3yRKnlZhwQTk9BUEYAxB
# DSuZP6Td0Ds1yIhwO88BDsxzIopKydsB/+hG6OFZnhYZVPdn6HesjFlUO7C1+NNM
# +/UCHhfUHGDZMC6aihMhk3XBE3LKeSZdhP8wxyYWtQiXvjY4NrykgA7qr1xXm2An
# xO8+ZNMIYBLoqS3B/9PXcfdszh38Gll6XD53Hu+Eh3P1Ybb4rW+xLgpsCTn/dKtb
# dNp8mutM3iaZVPygph4XbjmhggKiMIICngYJKoZIhvcNAQkGMYICjzCCAosCAQEw
# aDBSMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTEoMCYG
# A1UEAxMfR2xvYmFsU2lnbiBUaW1lc3RhbXBpbmcgQ0EgLSBHMgISESHWmadklz7x
# +EJ+6RnMU0EUMAkGBSsOAwIaBQCggf0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
# ATAcBgkqhkiG9w0BCQUxDxcNMTgwMzA2MDAwMzA0WjAjBgkqhkiG9w0BCQQxFgQU
# 7D142Hmn7HEJ0uSwJ5YIuY3l91IwgZ0GCyqGSIb3DQEJEAIMMYGNMIGKMIGHMIGE
# BBRjuC+rYfWDkJaVBQsAJJxQKTPseTBsMFakVDBSMQswCQYDVQQGEwJCRTEZMBcG
# A1UEChMQR2xvYmFsU2lnbiBudi1zYTEoMCYGA1UEAxMfR2xvYmFsU2lnbiBUaW1l
# c3RhbXBpbmcgQ0EgLSBHMgISESHWmadklz7x+EJ+6RnMU0EUMA0GCSqGSIb3DQEB
# AQUABIIBAG83YVedZQ1D03ugwOfxn/i46Moq08tLEr0y7rxKhM7pLp8y/C2ZO6ch
# 6TIqNxTuxid4AX+BP4uIeJggeOyCv22uceXgXtat3+jUhh6CljjpGtFfwNQwnsFU
# kmnR6VveuXSyBGTLlBtVcAnavYDwIjQGkQ/poZGJxoxtQXuC/8E1ATAcxm/H7tRM
# ruqfXx8ghGCZbdSlQ+91YzsrV0oDLhoec44RXNnB26ZBvcq3Cfo0pPLX74aweMFJ
# wLFlcUa7jTeMxNZ5ivuMsalqL+gnrBol/PDgDbPyArzfLQuy1nRoA01eI39ybgON
# 1BMenV5u+Hw/eKOGw24+h1k4RmXf+Yg=
# SIG # End signature block
