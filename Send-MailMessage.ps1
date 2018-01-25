<#
.SYNOPSIS
    Send an email with attachments.
.DESCRIPTION
    Simple powershell script to send email with attachment using Gmail SMTP.
.PARAMETER From
    None
.PARAMETER To
    An array of destination emails.
.PARAMETER SMTPServer
    Gmail SMTP Server
.PARAMETER SMTPPort
    TLS port for GMail SMTP.
.PARAMETER Date
    Get current date.
.PARAMETER Body
    List = Array. Raw content instead of HTML.
.INPUTS
    None
.OUTPUTS
    None
.EXAMPLE
    Execute manually using powershell or automate using task scheduler to send an email at a fixed time.    
.NOTES
    Author:             Wan Shahruddin
    Why?:               I am bored af now
#>

Param (
    $From = "youremail@email.com"
    $To = @("email1@email.com","email2@email.com")
    $SMTPServer = "smtp.gmail.com"
    $SMTPPort = "587"
    $Credential = New-Object Management.Automation.PSCredential "youremail@email.com", ("Password" | ConvertTo-SecureString -AsPlainText -Force)
    $Subject = "Email Subject"
    $Body = @"
    This is an email
    
    Thank you.
"@
    $Attachments = "C:\Location"
)
#########################
# Don't edit below this #
#########################

Send-MailMessage -To $To -From $From -Subject $Subject -Body $Body -Attachments $Attachments -SmtpServer $SMTPServer -Port $SMTPPort -UseSsl -Credential $Credential