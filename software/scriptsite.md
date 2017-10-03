---
title: "ScriptSite - ATL Active Script Engine Wrapper - VisionTech Limited"
keywords: "active script,activex,scripting,vbscript,javascript,COM,ATL,visual c++"
description: "An ATL include file to assist hosting an active script engine in your project."
---
[Download](/software/download/ScriptSite.zip)  ·  [View Source Code](/software/download/ScriptSite.h.html) (link opens new window)

Microsoft did us a favour when they produced Active Scripting. We can readily add scripting facilities to our applications with practically no effort compared to what was required just a few years ago.

I've included scripting in a few applications and each time modified the previous copy of my code to fit the new requirements. Having decided this time to construct a more reusable wrapper and to make use of ATL, I decided to share the results of my efforts to save others some time.

At the heart of the code is the `CScriptSiteImpl` class. This is the base class from which you need to inherit for your project. I've included a minimal class `CScriptSiteBasic` (which you can use directly) that demonstrates what you need to do to use the code:

```
    <font color="#0000ff">class</font> ATL_NO_VTABLE CScriptSiteBasic :
        <font color="#0000ff">public</font> CComObjectRootEx<CComSingleThreadModel>,
        <font color="#0000ff">public</font> CScriptSiteImpl
    {
    <font color="#0000ff">public</font>:
    DECLARE_PROTECT_FINAL_CONSTRUCT()
    BEGIN_COM_MAP(CScriptSiteBasic)
        COM_INTERFACE_ENTRY(IActiveScriptSite)
        COM_INTERFACE_ENTRY(IActiveScriptSiteWindow)
    END_COM_MAP()
    };
```

To make use of this class, just use code as follows:

<pre>    LPCTSTR strScriptCode; <font color="#008000">_// this points to the script code we want to run_</font>
    ...
    CComObject<CScriptSiteBasic>* pBasic;
    CComQIPtr<IActiveScriptSite> spUnk;
    HR(CComObject<CScriptSiteBasic>::CreateInstance(&pBasic));
    spUnk = pBasic; <font color="#008000">_// let CComQIPtr tidy up for us_</font>
    HR(pBasic->Initiate(_T(<font color="#ff00ff">"jscript"</font>),GetDesktopWindow()));
    HR(pBasic->AddScript(strScriptCode));
    HR(pBasic->Run());
    HR(pBasic->Terminate());</pre>

You will more than likely want to include your own object model within the script engine. To do this, you will need to create your own class derived from <tt>CScriptSiteImpl</tt> in the same fashion as <tt>CScriptSiteBasic</tt> above.

You will need to call <tt>CScriptSiteImpl::AddObject</tt> once for each object to tell the script engine the names used in your model. Next, you will need to provide your own implementation of <tt>LookupNamedItem</tt> as follows:

<pre>    <font color="#008000">_// Override this method in your implementation and return the desired object
    // or TYPE_E_ELEMENTNOTFOUND if the name doesn't match one of yours
    // (You must call CScriptSiteImpl::AddObject in the first place to tell
    // the script engine that your objects exist)._</font>
    STDMETHOD(LookupNamedItem)(LPCOLESTR pstrName,LPUNKNOWN* ppunkItem)
    {
        <font color="#0000ff">return</font> TYPE_E_ELEMENTNOTFOUND;
    }</pre>

You need to check the value of pstrName and return the corresponding IUnknown interface for that object. Of course, the object must implement IDispatch because the script engines are late bound. If the name doesn't match one of your objects, return TYPE_E_ELEMENTNOTFOUND.

Finally, to include your own error handler, you need to override <tt>HandleScriptError</tt>:

<pre>    <font color="#008000">_// Override this method in your implementation to handle error messages_</font>
    STDMETHOD(HandleScriptError)(EXCEPINFO* pei,ULONG ulLine,LONG lPos,BSTR src)
    {
        ...
        ...
        <font color="#0000ff">return</font> NOERROR;
    }</pre>

<tt>pei</tt> points to the EXCEPINFO structure for the error, <tt>ulLine</tt> and <tt>lPos</tt> indicate the line and column in your source script where the error occurred, and <tt>src</tt> contains a copy of that source script line.

[Download](/software/download/ScriptSite.zip)  ·  [View Source Code](/software/download/ScriptSite.h.html) (link opens new window)