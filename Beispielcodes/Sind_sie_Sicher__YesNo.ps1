#.Net Bibliothek Forms laden
[void][reflection.assembly]::LoadWithPartialName("System.Windows.Forms")

#.Net Objekte initialisieren
$form = new-object Windows.Forms.Form
$Form.Size = New-Object System.Drawing.Size(325,200)
$Form.StartPosition = "CenterScreen"
$Form.Text = "Programm schliessen?" #Titel des Fensters

#Icon ändern
$Icon = [system.drawing.icon]::ExtractAssociatedIcon($PSHOME + "\powershell.exe")
$form.Icon = $Icon

#Bestätigungslabel
$Label = New-Object System.Windows.Forms.Label
$Label.Text = "Sind Sie Sicher?"
$Label.Left = 50 #Position innerhalb des Formulars
$Label.Top = 75

#Neuer Yes-Button:
$Cbutton = new-object Windows.Forms.Button
$Cbutton.Text = "Yes"
$Cbutton.Left = 50 #Position innerhalb des Formulars
$Cbutton.Top = 120
$Cbutton.Width = 60 #Grösse der Taste
$Cbutton.Height = 30
$Cbutton.BackColor = "black"
$Cbutton.ForeColor = "white"

#Neuer No-Button:
$Cbutton2 = new-object Windows.Forms.Button
$Cbutton2.Text = "No"
$Cbutton2.Left = 109 #Position innerhalb des Formulars
$Cbutton2.Top = 120
$Cbutton2.Width = 60 #Grösse der Taste
$Cbutton2.Height = 30
$Cbutton2.BackColor = "black"
$Cbutton2.ForeColor = "white"

#Click-Aktion dem Button beifügen
$Cbutton.Add_Click( { #Funktion die beim Tastenklick ausgeführt werden soll:
$script:answer = "Yes"; #Rückgabevariable mit Text füllen
$form.close() #Fenster schliessen lassen
} )
$Cbutton2.Add_Click( { #Funktion die beim Tastenklick ausgeführt werden soll:
$script:answer = "No"; #Rückgabevariable mit Text füllen
$form.close() #Fenster schliessen lassen
} )

#Button dem Formular beifügen mit
$form.Controls.Add($Cbutton)
$form.Controls.Add($Cbutton2)
$form.Controls.Add($Label)

#Formular starten und anzeigen
$script:answer = "Exit" #Rückgabevariable vordefinieren für Exit-Fall
$form.ShowDialog() | out-null #Prozess für Formularanzeige starten (ohne Konsolenausgabe)

#Abfrage der Benutzereingabe nach dem Schliessen des Fensters über die Script-Variable $answer
if ($script:answer -eq "Yes") {Write-Host Bonjourno kind Sir, you have chosen Yes}
if ($script:answer -eq "No") {Write-Host Jonboruno kind Sir,  you have chosen No}
if ($script:answer -eq "Exit") {Write-Host You have chosen nothing because you exited the pop-up using the X}