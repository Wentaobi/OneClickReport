function tp = SetTitle()
import mlreportgen.dom.*;
import mlreportgen.report.* 
tp = TitlePage; 
tp.Title = 'APTIV Vehicle Drive Report'; 
tp.Image = which('APTIV.jpg');
tp.Subtitle = 'Vehicle Integration and Controls Team Testing'; 
tp.Publisher = {'Tester: Wen. B.'}; 
tp.Author = 'Vehicle: BMW-17';
tp.PubDate = date();
end