<%@ Page Language="C#" AutoEventWireup="true" Inherits="Digitaria.Web.Core.TemplateManager.Default" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xml:lang="en-US" xmlns="http://www.w3.org/1999/xhtml" lang="en-US">
<head runat="server">
    <link rel="Stylesheet" href="/Html/Assets/TemplateManager.css" type="text/css" media="all" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
</head>
<body>
    <div id="headerWrap">
        <div id="headerBar">
        </div>
        <div id="headerInner">
            <img src="/Html/Assets/logo.gif" alt="Digitaria" />
            <h1><asp:Label ID="ProjectName" runat="server" /></h1>
        </div>
    </div>
	
    <div id="overlay">
    </div>
    <div id="dialog">
        <form class="addLayoutForm" action="/Handlers/AddLayout.ajax">
        <label for="layoutName" id="layoutName">
            Layout Name</label>
        <input type="text" name="layoutName" />
        <label for="layoutClass">
            Layout Class</label>
        <input type="text" name="layoutClass" id="layoutClass" />
        <button type="submit">
            Submit</button>
        </form>
        <form class="addTemplateForm" action="/Handlers/CreateTemplate.ajax">
        <label for="layoutName" id="layoutName">
            Template Name</label>
        <input type="text" name="template" />
        <label for="layoutClass">
            Template Layout</label>
        <asp:Repeater ID="LayoutListRepeater" runat="server">
            <HeaderTemplate>
                <select name="layoutName">
            </HeaderTemplate>
            <ItemTemplate>
                <option value="<%# Eval("Name") %>">
                    <%# Eval("Name") %></option>
            </ItemTemplate>
            <FooterTemplate>
                </select>
            </FooterTemplate>
        </asp:Repeater>
        </select>
        <button type="submit">
            Submit</button>
        </form>
    </div>
    <div id="wrapper">
        <div class="pageBlocks">
            <!-- start layouts -->
            <h2>
                <a href="#" rel="addLayoutForm" class="addLayout">ADD LAYOUT</a>Layouts</h2>
            <div class="pageBlock">
                <h3>
                </h3>
                <asp:Repeater ID="LayoutRepeaterCol1" runat="server">
                    <HeaderTemplate>
                        <ul class="singleTier">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li><a href="/Handlers/RemoveLayout.ajax?layoutName=<%# Eval("Name") %>" class="removeIcon">
                        </a><a class="trigger" href='<%# ((string)Eval("Name")).Replace(' ', '-') %>.thtml'>
                            <%# Eval("Name") %></a>
                            <div class="templateInfo">
                                <asp:Repeater ID="ColumnRepeater" runat="server" DataSource='<%# (((Digitaria.Web.Core.TemplateManager.Layout)Container.DataItem).Columns) %>'>
                                    <HeaderTemplate>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <div class="columnAndRail">
                                            <div style="float: left;">
                                                <%# Eval("Name") %></div>
                                            <div style="float: right;">
                                                <%# Eval("Class") %></div>
                                        </div>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </div>
                        </li>
                    </ItemTemplate>
                    <FooterTemplate>
                        </ul></FooterTemplate>
                </asp:Repeater>
            </div>
            <div class="pageBlock">
                <h3>
                </h3>
                <asp:Repeater ID="LayoutRepeaterCol2" runat="server">
                    <HeaderTemplate>
                        <ul class="singleTier" start='<%= _layoutsInCol1+1 %>'>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li><a href="/Handlers/RemoveLayout.ajax?layoutName=<%# Eval("Name") %>" class="removeIcon">
                        </a><a class="trigger" href='<%# ((string)Eval("Name")).Replace(' ', '-') %>.thtml'>
                            <%# Eval("Name") %></a>
                            <div class="templateInfo">
                                <asp:Repeater ID="ColumnRepeater" runat="server" DataSource='<%# (((Digitaria.Web.Core.TemplateManager.Layout)Container.DataItem).Columns) %>'>
                                    <HeaderTemplate>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <div class="columnAndRail">
                                            <div style="float: left;">
                                                <%# Eval("Name") %></div>
                                            <div style="float: right;">
                                                <%# Eval("Class") %></div>
                                        </div>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </div>
                        </li>
                    </ItemTemplate>
                    <FooterTemplate>
                        </ul></FooterTemplate>
                </asp:Repeater>
            </div>
            <div class="pageBlock">
                <h3>
                </h3>
                <asp:Repeater ID="LayoutRepeaterCol3" runat="server">
                    <HeaderTemplate>
                        <ul class="singleTier" start='<%= _layoutsInCol2+_layoutsInCol1+1 %>'>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li><a href="/Handlers/RemoveLayout.ajax?layoutName=<%# Eval("Name") %>" class="removeIcon">
                        </a><a class="trigger" href='<%# ((string)Eval("Name")).Replace(' ', '-') %>.thtml'>
                            <%# Eval("Name") %></a>
                            <div class="templateInfo">
                                <asp:Repeater ID="ColumnRepeater" runat="server" DataSource='<%# (((Digitaria.Web.Core.TemplateManager.Layout)Container.DataItem).Columns) %>'>
                                    <HeaderTemplate>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <div class="columnAndRail">
                                            <div style="float: left;">
                                                <%# Eval("Name") %></div>
                                            <div style="float: right;">
                                                <%# Eval("Class") %></div>
                                        </div>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </div>
                        </li>
                    </ItemTemplate>
                    <FooterTemplate>
                        </ul></FooterTemplate>
                </asp:Repeater>
            </div>
            <div class="clear">
            </div>
            <!-- end layouts -->
        </div>
        <div class="pageBlocks">
            <!-- start templates -->
            <h2>
                <a href="#" rel="addTemplateForm" class="addLayout">ADD TEMPLATE</a>Templates</h2>
            <div class="pageBlock">
                <asp:Repeater ID="TemplateRepeaterCol1" runat="server">
                    <HeaderTemplate>
                        <ul class="templates">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li class="templateBlock"><a href="/Handlers/DeleteTemplate.ajax?template=<%# Eval("Name") %>"
                            class="removeIcon"></a><a class="trigger" href='<%# ((string)Eval("Name")).Replace(' ', '-') %>.thtml'
                                title='<%# Eval("Name") %>'>
                                <%# Eval("Name") %></a>
                            <div class="templateInfo">
                                <p>
                                    This template uses
                                    <%# Eval("LayoutName") %></p>
                                <asp:Repeater ID="ColumnRepeater" runat="server" DataMember='<%# Eval("LayoutName") %>'
                                    DataSource='<%# (((Digitaria.Web.Core.TemplateManager.Template)Container.DataItem).Rails) %>'>
                                    <HeaderTemplate>
                                        <ul>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <li>
                                            <div class="columnAndRail">
                                                <div style="float: left;">
                                                    <%# Digitaria.Web.Core.TemplateManager.HelperMethods.GetFriendlyName((string)Eval("Name"))%></div>
                                                <div style="float: right;">
                                                    <%# DisplayRailClass(((Digitaria.Web.Core.TemplateManager.Template)((RepeaterItem)Container.Parent.Parent).DataItem), (Digitaria.Web.Core.TemplateManager.Rail)Container.DataItem) %></div>
                                            </div>
                                        </li>
                                        <asp:Repeater ID="ModRepeater" runat="server" DataSource='<%# (((Digitaria.Web.Core.TemplateManager.Rail)Container.DataItem).Modules) %>'>
                                            <HeaderTemplate>
                                                <ul>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <li><a id="A1" href='<%# "module.thtml?module=" + Eval("QueryStringEncodedName") %>'
                                                    runat="server">
                                                    <%# DisplayModuleinTemplate((Digitaria.Web.Core.TemplateManager.Module)Container.DataItem, ((Digitaria.Web.Core.TemplateManager.Template)((RepeaterItem)Container.Parent.Parent.Parent.Parent).DataItem).LayoutName, ((Digitaria.Web.Core.TemplateManager.Rail)((RepeaterItem)Container.Parent.Parent).DataItem).Name)%></a>
                                                </li>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                </ul>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </ul></FooterTemplate>
                                </asp:Repeater>
                            </div>
                        </li>
                    </ItemTemplate>
                    <FooterTemplate>
                        </ul></FooterTemplate>
                </asp:Repeater>
            </div>
            <div class="pageBlock">
                <asp:Repeater ID="TemplateRepeaterCol2" runat="server">
                    <HeaderTemplate>
                        <ul class="templates" start='<%= _templatesInCol1+1 %>'>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li class="templateBlock"><a href="/Handlers/DeleteTemplate.ajax?template=<%# Eval("Name") %>"
                            class="removeIcon"></a><a class="trigger" href='<%# ((string)Eval("Name")).Replace(' ', '-') %>.thtml'
                                title='<%# Eval("Name") %>'>
                                <%# Eval("Name") %></a>
                            <div class="templateInfo">
                                <p>
                                    This template uses
                                    <%# Eval("LayoutName") %></p>
                                <asp:Repeater ID="ColumnRepeater" runat="server" DataMember='<%# Eval("LayoutName") %>'
                                    DataSource='<%# (((Digitaria.Web.Core.TemplateManager.Template)Container.DataItem).Rails) %>'>
                                    <HeaderTemplate>
                                        <ul>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <li>
                                            <div class="columnAndRail">
                                                <div style="float: left;">
                                                    <%# Digitaria.Web.Core.TemplateManager.HelperMethods.GetFriendlyName((string)Eval("Name"))%></div>
                                                <div style="float: right;">
                                                    <%# DisplayRailClass(((Digitaria.Web.Core.TemplateManager.Template)((RepeaterItem)Container.Parent.Parent).DataItem), (Digitaria.Web.Core.TemplateManager.Rail)Container.DataItem) %></div>
                                            </div>
                                        </li>
                                        <asp:Repeater ID="ModRepeater" runat="server" DataSource='<%# (((Digitaria.Web.Core.TemplateManager.Rail)Container.DataItem).Modules) %>'>
                                            <HeaderTemplate>
                                                <ul>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <li><a id="A1" href='<%# "module.thtml?module=" + Eval("QueryStringEncodedName") %>'
                                                    runat="server">
                                                    <%# DisplayModuleinTemplate((Digitaria.Web.Core.TemplateManager.Module)Container.DataItem, ((Digitaria.Web.Core.TemplateManager.Template)((RepeaterItem)Container.Parent.Parent.Parent.Parent).DataItem).LayoutName, ((Digitaria.Web.Core.TemplateManager.Rail)((RepeaterItem)Container.Parent.Parent).DataItem).Name)%></a>
                                                </li>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                </ul>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </ul></FooterTemplate>
                                </asp:Repeater>
                            </div>
                        </li>
                    </ItemTemplate>
                    <FooterTemplate>
                        </ul></FooterTemplate>
                </asp:Repeater>
            </div>
            <div class="pageBlock">
                <asp:Repeater ID="TemplateRepeaterCol3" runat="server">
                    <HeaderTemplate>
                        <ul class="templates" start='<%= _templatesInCol1+_templatesInCol2+1 %>'>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li class="templateBlock"><a href="/Handlers/DeleteTemplate.ajax?template=<%# Eval("Name") %>"
                            class="removeIcon"></a><a class="trigger" href='<%# ((string)Eval("Name")).Replace(' ', '-') %>.thtml'
                                title='<%# Eval("Name") %>'>
                                <%# Eval("Name") %></a>
                            <div class="templateInfo">
                                <p>
                                    This template uses
                                    <%# Eval("LayoutName") %></p>
                                <asp:Repeater ID="ColumnRepeater" runat="server" DataMember='<%# Eval("LayoutName") %>'
                                    DataSource='<%# (((Digitaria.Web.Core.TemplateManager.Template)Container.DataItem).Rails) %>'>
                                    <HeaderTemplate>
                                        <ul>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <li>
                                            <div class="columnAndRail">
                                                <div style="float: left;">
                                                    <%# Digitaria.Web.Core.TemplateManager.HelperMethods.GetFriendlyName((string)Eval("Name"))%></div>
                                                <div style="float: right;">
                                                    <%# DisplayRailClass(((Digitaria.Web.Core.TemplateManager.Template)((RepeaterItem)Container.Parent.Parent).DataItem), (Digitaria.Web.Core.TemplateManager.Rail)Container.DataItem) %></div>
                                            </div>
                                        </li>
                                        <asp:Repeater ID="ModRepeater" runat="server" DataSource='<%# (((Digitaria.Web.Core.TemplateManager.Rail)Container.DataItem).Modules) %>'>
                                            <HeaderTemplate>
                                                <ul>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <li><a id="A1" href='<%# "module.thtml?module=" + Eval("QueryStringEncodedName") %>'
                                                    runat="server">
                                                    <%# DisplayModuleinTemplate((Digitaria.Web.Core.TemplateManager.Module)Container.DataItem, ((Digitaria.Web.Core.TemplateManager.Template)((RepeaterItem)Container.Parent.Parent.Parent.Parent).DataItem).LayoutName, ((Digitaria.Web.Core.TemplateManager.Rail)((RepeaterItem)Container.Parent.Parent).DataItem).Name)%></a>
                                                </li>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                </ul>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </ul></FooterTemplate>
                                </asp:Repeater>
                            </div>
                        </li>
                    </ItemTemplate>
                    <FooterTemplate>
                        </ul></FooterTemplate>
                </asp:Repeater>
            </div>
            <div class="clear">
            </div>
            <!-- end templates -->
        </div>
        <div class="pageBlocks">
            <!-- start modules -->
            <h2>Modules</h2>
            <div class="pageBlock">
                <h3>
                </h3>
                <asp:Repeater ID="ModulesRepeaterCol1" runat="server">
                    <HeaderTemplate>
                        <ul class="templates">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li class="templateBlock"><a class="trigger" href='module.thtml?module=<%# Eval("QueryStringEncodedName") %>'>
                            <%# DisplayModuleInfo((Digitaria.Web.Core.TemplateManager.ModuleInfo)Container.DataItem) %></a>&nbsp;&nbsp;<span class="railsInModule"><%# DisplayRailsByModuleName((Digitaria.Web.Core.TemplateManager.ModuleInfo)Container.DataItem) %></span>
                            <div class="templateInfo">
                                <p>Location: <%# ((Digitaria.Web.Core.TemplateManager.ModuleInfo)Container.DataItem).GetFileName() %><br />
                                    This module can be placed in rail classes:</p>
                                <asp:Repeater ID="ColumnRepeater" runat="server" DataSource='<%# (((Digitaria.Web.Core.TemplateManager.ModuleInfo)Container.DataItem).Rails) %>'>
                                    <HeaderTemplate>
                                        <ul>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <li><%# Container.DataItem %></li>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </ul></FooterTemplate>
                                </asp:Repeater>
                            </div>
                        </li>
                    </ItemTemplate>
                    <FooterTemplate>
                        </ul></FooterTemplate>
                </asp:Repeater>
            </div>
            <div class="pageBlock">
                <h3>
                </h3>
                <asp:Repeater ID="ModulesRepeaterCol2" runat="server">
                    <HeaderTemplate>
                        <ul class="templates" start='<%= _modulesInCol1+1 %>'>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li class="templateBlock"><a class="trigger" href='module.thtml?module=<%# Eval("QueryStringEncodedName") %>'>
                            <%# DisplayModuleInfo((Digitaria.Web.Core.TemplateManager.ModuleInfo)Container.DataItem) %></a>&nbsp;&nbsp;<span class="railsInModule"><%# DisplayRailsByModuleName((Digitaria.Web.Core.TemplateManager.ModuleInfo)Container.DataItem) %></span>
                            <div class="templateInfo">
                                <p>Location: <%# ((Digitaria.Web.Core.TemplateManager.ModuleInfo)Container.DataItem).GetFileName() %><br />
                                    This module can be placed in rail classes:</p>
                                <asp:Repeater ID="ColumnRepeater" runat="server" DataSource='<%# (((Digitaria.Web.Core.TemplateManager.ModuleInfo)Container.DataItem).Rails) %>'>
                                    <HeaderTemplate>
                                        <ul>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <li><%# Container.DataItem %></li>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </ul></FooterTemplate>
                                </asp:Repeater>
                            </div>
                        </li>
                    </ItemTemplate>
                    <FooterTemplate>
                        </ul></FooterTemplate>
                </asp:Repeater>
            </div>
            <div class="pageBlock">
                <h3>
                </h3>
                <asp:Repeater ID="ModulesRepeaterCol3" runat="server">
                    <HeaderTemplate>
                        <ul class="templates" start='<%= _modulesInCol1+_modulesInCol2+1 %>'>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li class="templateBlock"><a class="trigger" href='module.thtml?module=<%# Eval("QueryStringEncodedName") %>'>
                            <%# DisplayModuleInfo((Digitaria.Web.Core.TemplateManager.ModuleInfo)Container.DataItem) %></a>&nbsp;&nbsp;<span class="railsInModule"><%# DisplayRailsByModuleName((Digitaria.Web.Core.TemplateManager.ModuleInfo)Container.DataItem) %></span>
                            <div class="templateInfo">
                                <p>Location: <%# ((Digitaria.Web.Core.TemplateManager.ModuleInfo)Container.DataItem).GetFileName() %><br />
                                    This module can be placed in rail classes:</p>
                                <asp:Repeater ID="ColumnRepeater" runat="server" DataSource='<%# (((Digitaria.Web.Core.TemplateManager.ModuleInfo)Container.DataItem).Rails) %>'>
                                    <HeaderTemplate>
                                        <ul>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <li><%# Container.DataItem %></li>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </ul></FooterTemplate>
                                </asp:Repeater>
                            </div>
                        </li>
                    </ItemTemplate>
                    <FooterTemplate>
                        </ul></FooterTemplate>
                </asp:Repeater>
            </div>
            <div class="clear">
            </div>
            <!-- end modules -->
        </div>
    </div>
    <div id="footerWrap">
        <div id="footerInner">
            <p>digitaria</p>
        </div>
    </div>

    <!--
    <script type="text/javascript" src="/includes/jsbin/jquery.js"></script>

    <script type="text/javascript" src="/includes/jsbin/jquery-ui.js"></script>

    <script type="text/javascript" src="/includes/jsbin/jCore.js"></script>
    -->
    
    <script type="text/javascript" src="/html/assets/templatemanager.js"></script>
	
    <!--
    <script type="text/javascript" src="/includes/jsbin/emptySite.js"></script>
    -->
    
</body>
</html>
