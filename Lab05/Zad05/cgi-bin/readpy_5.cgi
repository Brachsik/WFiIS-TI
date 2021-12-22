#!/usr/bin/python3 
import cgitb
import sys
import cgi
from lxml import etree

cgitb.enable()
sys.stderr = sys.stdout
xmlfile = open('../XMLzad5.xml')     
xslfile = open('../XSLzad5.xsl')
xmldom = etree.parse(xmlfile)
xsldom = etree.parse(xslfile)
transform = etree.XSLT(xsldom) 
form = cgi.FieldStorage()
sort = form.getvalue('sort', 'name')
result = transform(xmldom, sort=f"'{sort}'")
print("Content-type: text/html") 
print("\n")
print(result)
