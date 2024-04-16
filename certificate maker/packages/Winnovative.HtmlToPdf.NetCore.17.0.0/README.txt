Winnovative HTML to PDF Library for .NET Core
=============================================

Winnovative HTML to PDF Library for .NET Core can be easily integrated your applications targeting .NET Core or .NET Standard to create PDF documents from HTML pages and strings.

The library can also be used to convert HTML to images, convert HTML to SVG, create, edit and merge PDF documents.
You can see the http://www.winnovative-software.com/html-to-pdf-converter.aspx product page for a complete list of library features.

This version of the library is compatible with .NET Core and .NET Standard on Windows 32-bit (x86) and 64-bit (x64) platforms.

For applications targeting .NET Framework on Windows you can use the library from Winnovative.HtmlToPdf NuGet package.

In any .NET application for Linux, macOS, Windows, Azure App Service, Xamarin, UWP and other platforms you can use the cross-platform library from Winnovative.Client NuGet package.

Main Features
=============

* Create PDF documents from HTML with advanced support for CSS3, SVG, Web Fonts and JavaScript
* Automatically create PDF links, forms, bookmarks and table of contents from HTML tags
* Place the content from multiple HTML documents at any position in PDF pages, headers or footers
* Create JPEG, PNG and Bitmap raster images from HTML documents
* Create high quality SVG vector images from HTML documents
* Create PDF documents with text, graphics, images, headers and footers
* Create PDF documents with security features and digital signatures
* Create interactive PDF documents with forms, internal links, text notes and JavaScript actions
* Edit, stamp and merge PDF documents

Compatibility
=============

Winnovative HTML to PDF Library for .NET Core is compatible with Windows platforms which support .NET Standard 2.0 or above, including the platforms listed below:

* .NET Core 7, 6, 5, .NET Standard 2.0 , .NET Framework 4.6.2 (and above)
* Windows 32-bit (x86) and 64-bit (x64)
* Azure Cloud Services and Azure Virtual Machines
* Web, Console and Desktop applications

Getting Started
===============

After the reference to library was added to your project you are now ready to start writing code to convert HTML to PDF in your .NET application.
You can copy the C# code lines from the section below to create a PDF document from a web page or from a HTML string and save the resulted PDF to a memory buffer for further processing, to a PDF file or send it to browser for download in ASP.NET applications.

C# Code Samples
---------------

At the top of your C# source file add the 'using Winnovative;' statement to make available the Winnovative HTML to PDF API for your .NET application.

    // add this using statement at the top of your C# file
    using Winnovative;

To convert a HTML string or an URL to a PDF file you can use the C# code below.

    // create the converter object in your code where you want to run conversion
    HtmlToPdfConverter converter = new HtmlToPdfConverter();
    
    // convert the HTML string to a PDF file
    converter.ConvertHtmlToFile("<b>Hello World</b> from Winnovative !", null, "HtmlToFile.pdf");
    
    // convert HTML page from URL to a PDF file
    string htmlPageURL = "http://www.winnovative-software.com";
    converter.ConvertUrlToFile(htmlPageURL, "UrlToFile.pdf");

To convert a HTML string or an URL to a PDF document in a memory buffer and then save it to a file you can use the C# code below.

    // create the converter object in your code where you want to run conversion
    HtmlToPdfConverter converter = new HtmlToPdfConverter();
    
    // convert a HTML string to a memory buffer
    byte[] htmlToPdfBuffer = converter.ConvertHtml("<b>Hello World</b> from Winnovative !", null);
    
    // write the memory buffer to a PDF file
    System.IO.File.WriteAllBytes("HtmlToMemory.pdf", htmlToPdfBuffer);
    
    // convert an URL to a memory buffer
    string htmlPageURL = "http://www.winnovative-software.com";
    byte[] urlToPdfBuffer = converter.ConvertUrl(htmlPageURL);
    
    // write the memory buffer to a PDF file
    System.IO.File.WriteAllBytes("UrlToMemory.pdf", urlToPdfBuffer);

To convert in your ASP.NET Core applications a HTML string or an URL to a PDF document in a memory buffer and then send it for download to browser you can use the C# code below.

    // create the converter object in your code where you want to run conversion
    HtmlToPdfConverter converter = new HtmlToPdfConverter();
    
    // convert a HTML string to a memory buffer
    byte[] htmlToPdfBuffer = converter.ConvertHtml("<b>Hello World</b> from Winnovative !", null);
    
    FileResult fileResult = new FileContentResult(htmlToPdfBuffer, "application/pdf");
    fileResult.FileDownloadName = "HtmlToPdf.pdf";
    return fileResult;

Free Trial
==========

You can download the full Winnovative HTML to PDF Converter for .NET Core package from http://www.winnovative-software.com/download.aspx page of the website.

The package for .NET Core contains the product binaries, a demo Visual Studio project with full C# code for ASP.NET Core targeting .NET Core 6.0 and later versions, the library documentation in CHM format.

You can evaluate the library for free as long as it is needed to ensure that the solution fits your application needs.

Licensing
=========

The Winnovative Software licenses are perpetual which means they never expire for a version of the product and include free maintenance for the first year. You can find more details about licensing in http://www.winnovative-software.com/buy.aspx page of the website.

Support
=======

For technical and sales questions or for general inquiries about our software and company you can contact us using the email addresses from http://www.winnovative-software.com/contact.aspx page of the website.

