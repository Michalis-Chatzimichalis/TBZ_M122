#Generated Form Function
function GenerateForm {
########################################################################
# Code Generated By: SAPIEN Technologies PrimalForms (Community Edition) v1.0.10.0
# Generated On: 8/26/2019 9:44 AM
# Generated By: apoll
########################################################################

#region Import the Assemblies
[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null
#endregion

#region Generated Form Objects
$form = New-Object System.Windows.Forms.Form
$txb_Prozesse = New-Object System.Windows.Forms.TextBox
$btn_Aktualisieren = New-Object System.Windows.Forms.Button
$InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState
#endregion Generated Form Objects

#----------------------------------------------
#Generated Event Script Blocks
#----------------------------------------------
#Provide Custom Code for events specified in PrimalForms.
$btn_aktualisieren_click= 
{
#TODO: Place custom script here
    $txb_Prozesse.Text = $script:proz | Out-String -width 40

}

$OnLoadForm_StateCorrection=
{#Correct the initial state of the form to prevent the .Net maximized form issue
	$form.WindowState = $InitialFormWindowState
    $script:proz = Get-Process
}

#----------------------------------------------
#region Generated Form Code
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 261
$System_Drawing_Size.Width = 284
$form.ClientSize = $System_Drawing_Size
$form.DataBindings.DefaultDataSourceUpdateMode = 0
$form.Name = "form"
$form.Text = "Prozesse"

$txb_Prozesse.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 12
$System_Drawing_Point.Y = 41
$txb_Prozesse.Location = $System_Drawing_Point
$txb_Prozesse.Multiline = $True
$txb_Prozesse.Name = "txb_Prozesse"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 208
$System_Drawing_Size.Width = 260
$txb_Prozesse.Size = $System_Drawing_Size
$txb_Prozesse.TabIndex = 1
$txb_Prozesse.Font = New-Object System.Drawing.Font("Courier New", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] (0)))
$txb_Prozesse.TabIndex = 10

$form.Controls.Add($txb_Prozesse)


$btn_Aktualisieren.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 12
$System_Drawing_Point.Y = 12
$btn_Aktualisieren.Location = $System_Drawing_Point
$btn_Aktualisieren.Name = "btn_Aktualisieren"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 260
$btn_Aktualisieren.Size = $System_Drawing_Size
$btn_Aktualisieren.TabIndex = 0
$btn_Aktualisieren.Text = "Aktualisieren"
$btn_Aktualisieren.UseVisualStyleBackColor = $True
$btn_Aktualisieren.add_Click($btn_aktualisieren_click)

$form.Controls.Add($btn_Aktualisieren)

#endregion Generated Form Code

#Save the initial state of the form
$InitialFormWindowState = $form.WindowState
#Init the OnLoad event to correct the initial state of the form
$form.add_Load($OnLoadForm_StateCorrection)
#Show the Form
$form.ShowDialog()| Out-Null

} #End Function

#Call the Function
$Script:answer = "Exit"
GenerateForm

if ($Script:answer -eq "Exit") {Write-Host "Sie haben [X] gedrückt"}

