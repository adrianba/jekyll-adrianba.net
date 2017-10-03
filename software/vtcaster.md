---
title: "VTCaster - VisionTech Limited"
keywords: "dynamic,cast,custom interace,COM,visual basic,ATL,visual c++,script,Implements,QueryInterface"
description: "Dynamically cast objects so that you can use custom interfaces in script."
---
## Dynamically cast interfaces in script

Recently someone asked in one of the VB newsgroups _"Can scripting code create a component interface that is part of a custom interface?"_.

My initial reaction was that no, you couldn't do this because scripting uses the IDispatch interface and you can only have one on your component. However, Sanin Saracevic put me right and pointed out that scripting can automatically wrap custom interfaces for you if you provide a method in your class to give you the custom interface. He also suggested writing a C++ component to read the component type library and dynamically cast the object to the required interface. This is what VTCaster does.

Okay, so that sounds a bit complicated; here's an example to help you see how it works.

Suppose I create a class file (_MyIface.cls_) in VB to define an interface I want to implement (note that there is no function body - this is just the interface):

```
Option Explicit  
Public Function MyTest() As String  
End Function
```

Now, I create another class (_Test.cls_), which will implement the `MyIface` interface (and also a Test() method).

```
Option Explicit  
Implements MyIface  

Public Function Test() As String  
    Test = "Test function"  
End Function  

Private Function MyIface_MyTest() As String  
    MyIface_MyTest = "Interface MyTest"  
End Function  
```

Now in my .VBS script file, or .ASP web page, I can use the following code:

```
Dim oTest,oIface,oCast,strTemp  

Set oTest = CreateObject("Project.Test")  
strTemp = oTest.Test ' strTemp now holds "Test function"  

Set oCast = CreateObject("VTCaster.DynCast")  
Set oIface = oCast.castToInterface(oTest,"_MyIface")  
strTemp = oIface.MyTest ' strTemp now holds "Interface MyTest"  
```

The `castToInterface` call allows you to pass an object, and the name of the required interface, and it returns this interface. VB usually prepends an underscore (_) to the beginning of interface names which is why the code above asks for the `"_MyIface"` interface). In ASP code, you would typically use `Server.CreateObject` rather than simply `CreateObject`.

You can [download the source code](/software/download/VTCaster.zip) for VTCaster [43K]. The zip file also includes a compiled DLL in case you don't have access to Visual C++. Don't forget to register the DLL with `regsvr32` before you try to use it.