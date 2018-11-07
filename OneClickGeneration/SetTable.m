function t = SetTable(t)
import mlreportgen.dom.*;
import mlreportgen.report.*
t.Style = {RowHeight('0.5in')};
t.Border = 'double';
t.BorderWidth = '1px';
t.ColSep = 'solid';
t.ColSepWidth = '2';
t.RowSep = 'solid';
t.RowSepWidth = '2';
t.HAlign = 'left';
% Set this property first to prevent overwriting alignment properties
t.TableEntriesStyle = {FontFamily('Arial'),Width('1.5in'),Color('green'),Bold};
t.TableEntriesHAlign = 'center';
t.TableEntriesVAlign = 'middle';
r = TableRow();
append(r,TableEntry('MIN'));
append(r,TableEntry('MAX'));
append(r,TableEntry('MEAN'));
append(r,TableEntry('STD'));
append(t.Header,r);
end