<#
.SYNOPSIS
	This script is a template that allows you to extend the toolkit with your own custom functions.
    # LICENSE #
    PowerShell App Deployment Toolkit - Provides a set of functions to perform common application deployment tasks on Windows. 
    Copyright (C) 2017 - Sean Lillis, Dan Cunningham, Muhammad Mashwani, Aman Motazedian.
    This program is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or any later version. This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. 
    You should have received a copy of the GNU Lesser General Public License along with this program. If not, see <http://www.gnu.org/licenses/>.
.DESCRIPTION
	The script is automatically dot-sourced by the AppDeployToolkitMain.ps1 script.
.NOTES
    Toolkit Exit Code Ranges:
    60000 - 68999: Reserved for built-in exit codes in Deploy-Application.ps1, Deploy-Application.exe, and AppDeployToolkitMain.ps1
    69000 - 69999: Recommended for user customized exit codes in Deploy-Application.ps1
    70000 - 79999: Recommended for user customized exit codes in AppDeployToolkitExtensions.ps1
.LINK 
	http://psappdeploytoolkit.com
#>
[CmdletBinding()]
Param (
)

##*===============================================
##* VARIABLE DECLARATION
##*===============================================

# Variables: Script
[string]$appDeployToolkitExtName = 'PSAppDeployToolkitExt'
[string]$appDeployExtScriptFriendlyName = 'App Deploy Toolkit Extensions'
[version]$appDeployExtScriptVersion = [version]'1.5.0'
[string]$appDeployExtScriptDate = '02/12/2017'
[hashtable]$appDeployExtScriptParameters = $PSBoundParameters

##*===============================================
##* FUNCTION LISTINGS
##*===============================================

# <Your custom functions go here>

##*===============================================
##* END FUNCTION LISTINGS
##*===============================================

##*===============================================
##* SCRIPT BODY
##*===============================================

If ($scriptParentPath) {
	Write-Log -Message "Script [$($MyInvocation.MyCommand.Definition)] dot-source invoked by [$(((Get-Variable -Name MyInvocation).Value).ScriptName)]" -Source $appDeployToolkitExtName
}
Else {
	Write-Log -Message "Script [$($MyInvocation.MyCommand.Definition)] invoked directly" -Source $appDeployToolkitExtName
}

##*===============================================
##* END SCRIPT BODY
##*===============================================
# SIG # Begin signature block
# MIIU4wYJKoZIhvcNAQcCoIIU1DCCFNACAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDCvKAwWIPjyjwR
# M4lJg7dqZ6NT9qtI4ErSKnWnW5LwJaCCD4cwggQUMIIC/KADAgECAgsEAAAAAAEv
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
# gAAwGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQwLwYJKoZIhvcNAQkEMSIEINwk
# 5l0/xIsS6E3vmHx3ArK2GTSwDUxFABl9Z6xk3R7nMA0GCSqGSIb3DQEBAQUABIIB
# AFE2Xqu4VRwQrXNGlg1lBNP9R0HI1vNjmjuJdAbhBHJiDs3XyYCBjsRuGG/YARnl
# C8k80z+s4czvdpBLNBYnc4/SURE6NTd0IfZX/Kb1CddfmmdJcyJLf4awg/mo9N5u
# CjCmkL4TobYrbt7OIpEzRuij139IZdRb6AdVbkqsYd7v8GYUk5cY3AfwVQ08Qr2F
# /ZElvbuN6xD5uaUXcIVdQzYT9sR0+AjiU5OG+spkmwmojStonhJwYiKO5izWLNBe
# dhfUwZd3nrsqFQP5tdFQ/RB75FSWMEH4qGIa/BEWU347m5dXYDCoj9zg7Dth3DUi
# xFefqoCorFhouj2qpZDXqDWhggKiMIICngYJKoZIhvcNAQkGMYICjzCCAosCAQEw
# aDBSMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTEoMCYG
# A1UEAxMfR2xvYmFsU2lnbiBUaW1lc3RhbXBpbmcgQ0EgLSBHMgISESHWmadklz7x
# +EJ+6RnMU0EUMAkGBSsOAwIaBQCggf0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
# ATAcBgkqhkiG9w0BCQUxDxcNMTgwMzA2MDAwMzEzWjAjBgkqhkiG9w0BCQQxFgQU
# /DGXU5Y9lcf6T+9nEab5V9rkGhswgZ0GCyqGSIb3DQEJEAIMMYGNMIGKMIGHMIGE
# BBRjuC+rYfWDkJaVBQsAJJxQKTPseTBsMFakVDBSMQswCQYDVQQGEwJCRTEZMBcG
# A1UEChMQR2xvYmFsU2lnbiBudi1zYTEoMCYGA1UEAxMfR2xvYmFsU2lnbiBUaW1l
# c3RhbXBpbmcgQ0EgLSBHMgISESHWmadklz7x+EJ+6RnMU0EUMA0GCSqGSIb3DQEB
# AQUABIIBAIeuwzDwyEtZYSCaIc0vFG5iqaehdLUnZcee+cnngspgvu72bEWxQqZk
# RmQCxUsqwf2FVwx8we4DJQoprFW7zI5erBL2y1J3QUJ0HF63km+ZGeYFLVeyrFSp
# L9m66LZm1IVn5h+6kTzpJ9IwiEwsnxTbvt8hfYEsKMYGMqmhzsxx5uHesKZlEGRg
# j/AWE4rLEgQN3hP3sKf4aqzCvERb+jIoqRvFW+No4nuBeiMZRec0mWIfnVuvScJ0
# vKl5Fss9Cm9G7ECoe7y/z5ta6EFlo4OH/tA0vUl1Gf54pEA6oVxK4FyBQ5GVhly0
# 8WVBJI0FFDAwJM3SgbFiizzZ8d8JsVU=
# SIG # End signature block
