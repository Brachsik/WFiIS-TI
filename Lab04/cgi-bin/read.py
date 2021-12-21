#!/usr/bin/python3
import cgi
from datetime import datetime
import socket
form = cgi.FieldStorage()
  
text1 = form.getvalue("Tytul","(no data)")
text2 = form.getvalue("Autor","(no data)")

  
# print HTTP/HTML headers
print ("Content-type: text/html")
print ()
print ("<!DOCTYPE html>")
print ("<html lang=\"en\">")
print ("<head>")
print ("<meta charset=\"UTF-8\">")
print ("<title>A CGI Script</title>")
print ("<link href=\"../CgiStyle.css\" rel=\"stylesheet\" type=\"text/css\">")
print ("</head>")
print ("<body>")
  
# print HTML body using form data
print ("<h1>REKORDY DOSTEPNE W BAZIE DANYCH</h1>")
print ("<form action=\"../formularz.html\">")
print ("<input type=\"submit\" value=\"Powrót do wpisu\" />")
print ("</form>")
print ("<table class=\"tabelka\">")
print ("<thead><tr><th>Tytul</th><th>Autor</th><th>Data</th><th>IP</th></tr></thead>")

f = open("./rekordy.dat", "a")

if text1 != "(no data)" and text2 != "(no data)":
	f.write(text1+";")
	f.write(text2+";")
	f.write((datetime.now()).strftime("%d-%b-%Y (%H:%M:%S.%f)"))
	f.write(";")
	f.write((([ip for ip in socket.gethostbyname_ex(socket.gethostname())[2] if not ip.startswith("127.")] or [[(s.connect(("8.8.8.8", 53)), s.getsockname()[0], s.close()) for s in [socket.socket(socket.AF_INET, socket.SOCK_DGRAM)]][0][1]]) + ["no IP found"])[0]+";\n")
f.close()

f = open("./rekordy.dat", "r")
for x in f:
	record = x.split(';')
	print ("<tr><td>" + record[0] + "</td>")
	print ("<td>" + record[1] + "</td>")
	print ("<td>" + record[2] + "</td>")
	print ("<td>" + record[3] + "</td></tr>")

f.close()
print ("</table>")
print ("</body>")
print ("</html>")
