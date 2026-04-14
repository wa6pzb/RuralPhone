' DTMF Decoder (Polling Method)
' March 29th 2026
' Pins Q1-Q4 -> GP2, GP3, GP4, GP5 | StD -> GP6

SetPin gp2, din ' Q1
SetPin gp3, din ' Q2
SetPin gp4, din ' Q3
SetPin gp5, din ' Q4
SetPin gp6, din, pulldown ' StD (Active High)

file$="busy.wav"

Dim buffer$ = ""
Dim secret$ = "*123"
Dim milliwatt$ = "*100"
Dim busy$ = "*999"

Print "System Ready. Enter Code..."

Do
  ' 1. Check for a valid DTMF tone
  If Pin(gp6) = 1 Then
    
    ' 2. Read the 4-bit binary value
    raw = Pin(gp2) + (Pin(gp3)*2) + (Pin(gp4)*4) + (Pin(gp5)*8)
    
    ' 3. Map binary to Keypad characters
    Select Case raw
      Case 1 To 9:  key$ = Str$(raw)
      Case 10:      key$ = "0"
      Case 11:      key$ = "*"
      Case 12:      key$ = "#"
      Case 13:      key$ = "A"
      Case 14:      key$ = "B"
      Case 15:      key$ = "C"
      Case 0:       key$ = "D"
    End Select
    
    ' 4. Add key to buffer and keep only the last 4 digits
    buffer$ = buffer$ + key$
    If Len(buffer$) > 4 Then buffer$ = Right$(buffer$, 4)
    
    Print "Key: "; key$; "  [Buffer: "; buffer$; "]"
    
    ' 5. Check if the buffer matches the secret code
    If buffer$ = secret$ Then
      pause 500
      play tone 600, 600, 500
      Print "--- UNLOCKED ---"
      buffer$ = "" ' Optional: Clear buffer after success
    End If

    If buffer$ = milliwatt$ Then
      pause 500
      play tone 1004, 1004, 10000
      Print "--- 1004 Hz Tone ---"
      buffer$ = "" ' Optional: Clear buffer after success
    End If
    
    If buffer$ = busy$ Then
      pause 500
      play wav file$
      Print "--- busy Tone ---"
      buffer$ = "" ' Optional: Clear buffer after success
    End If

    ' 6. Wait for key release to prevent double-triggering
    Do While Pin(gp6) = 1
      Pause 10
    Loop
    
  End If
  
  Pause 50
Loop
