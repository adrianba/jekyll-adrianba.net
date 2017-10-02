---
slug: mdi-to-tiff-converter
title: MDI to TIFF converter
wordpress_id: 480
old_link: 'https://adrianba.net/2015/12/20/mdi-to-tiff-converter/'
last_modified_at: 2015-12-20T19:40:07.000Z
---

Microsoft Office Document Imaging (MODI) was part of Office up to Office 2007. It allowed you to scan multipage documents into .MDI files. MODI was deprecated and removed from Office 2010 and with a modern installation of Windows and Office there is no native support for .MDI files. If you have these files archived then you will need to convert them to another format.


<blockquote>_MDI to TIFF File Converter is a command line tool, which allows you to convert one or more MDI files to TIFF. MDI is a proprietary file format of MODI (Microsoft Office Document Imaging), which was deprecated as part of Office 2010. This conversion tool will allow you to view MDI files after they are converted to TIFF. TIFF files may be viewed using a variety of image viewing programs, such as the Windows Fax and Image Viewer._</blockquote>


The [MDI to TIFF File Converter](https://www.microsoft.com/en-us/download/details.aspx?id=30328) is a command line tool for converting old .MDI files to modern multipage TIFF files, which can be viewed with built-in tools like Windows Photo Viewer.

Run the converter from a command line prompt as follows:


`mdi2tif -source _myfile_.mdi -log output.txt`


This will produce the following output:


`Converting MDI file myfile.mdi
Writing results file output.txt...

Conversion completed.
Files with errors: [0/1]

See output.txt for more details. `


_myfile_.mdi will be converted to _myfile_.tif.
