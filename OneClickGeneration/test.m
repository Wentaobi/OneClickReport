import mlreportgen.report.*
rpt = Report();
toc = TableOfContents();
toc.Title = 'Report Contents'
toc.Title = getTitleReporter(toc);
toc.Title.TemplateSrc = 'MyTOCTemplate';
add(rpt,toc)