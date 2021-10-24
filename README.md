# Das-POGBA-System
Das POGBA System ist ein datenbasierter Algorithmus zur Vorhersage des Potentials von Fussballspielern. Das System basiert auf dem CARMELO System aus dem Basketball und macht Gebrauch von den Daten des Videospiels Football Manager. Die extrahierten Daten reichen dabei von 2016-2020. Es wurden nur Spieler mit einer spielinternen Gesamtwertung von mindestens 75 von 200 beachtet, so setzt sich eine Datenbank von 389'546 unterschiedlichen Spielerprofilen zusammen. Das POGBA System erstellt dabei Karriereprognosen für einen spezifischen Spieler, unter Anbetracht der Karriereverläufe der ihm ähnlichsten gleichaltrigen Spieler.
Für Details zu den verschiedenen Berechnungen oder der Extraktion der Daten, kontaktieren sie mich per E-Mail: manuel.tuor@student.gkd.ch

Nun folgt eine kurze Anleitung zur Benutzung des Programms:
1. Laden sie GNU Octave 6.3.0 kostenlos unter einem der folgenden Links herunter, und installieren sie es (vermutlich ist das Programm auch mit Matlab kompatibel).
   Windows: https://www.gnu.org/software/octave/download#ms-windows
   MacOS: https://github.com/octave-app/octave-app/releases/tag/v6.3.0-beta1
   Linux: https://wiki.octave.org/Octave_for_GNU/Linux
2. Schliessen sie den Installationsprozess ab und laden sie das POGBA System herunter.
3. Öffnen sie Octave und navigieren sie im File Browser zum Ordner des POGBA Systems.
4. Geben sie im Command Window "Daten_Laden" ein, um alle für das Programm benötigten Variablen zu laden.
5. Danach geben sie "Vorhersage" ins Command Windows ein, um Vorhersagen berechnen zu lassen.
6. Dann Suchen sie links in der Datenbank ihren gewünschten Spieler.
7. Übertragen sie die UID und das Alter in die Felder aud der rechten Seite.
8. Wählen sie die Position für die positionelle Gewichtung.
9. Wählen sie die Art der Vorhersage, die Gewichtung und mit welchen Vergleichsspieler gerechnet werden soll.
10. Filtern sie die Vergleichsspieler nach Alter, CA und den Positionen.
11. Sobald die Anzahl Ergebnisse angezeigt wurde, können sie auf "Berechnen" klicken.
12. Die Ergebnisse der Vorhersage werden ihnen angezeigt.
13. Sie können nun die Karriere weitersimulieren, das Programm für einen neuen Spieler neustarten, oder es beenden.

Die Schritte 6-13 sind im untenstehenden Video illustriert:

https://user-images.githubusercontent.com/91838413/138596518-89dc9747-a6dc-4990-bb81-45584cb82a73.mp4
