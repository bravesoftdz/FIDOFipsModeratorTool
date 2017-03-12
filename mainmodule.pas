unit mainmodule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls, Spin,
  Grids, Calendar, ComCtrls, IniFiles, modclass,browsefolder,
  AppEvnts,paintfidotext, Buttons,filectrl, XPMan, Menus;


type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet4: TTabSheet;
    StaticText1: TStaticText;
    ComboBox1: TComboBox;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    TabSheet5: TTabSheet;
    GroupBox2: TGroupBox;
    StaticText2: TStaticText;
    Edit5: TEdit;
    StaticText3: TStaticText;
    Edit4: TEdit;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    incmonthes: TSpinEdit;
    Label10: TLabel;
    DateTimePicker1: TDateTimePicker;
    StaticText4: TStaticText;
    DateTimePicker2: TDateTimePicker;
    Button3: TButton;
    GroupBox4: TGroupBox;
    Label8: TLabel;
    ComboBox3: TComboBox;
    Label9: TLabel;
    Edit3: TEdit;
    GroupBox5: TGroupBox;
    StaticText5: TStaticText;
    Edit6: TEdit;
    Label3: TLabel;
    comod_name: TEdit;
    modlist: TStringGrid;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    StaticText7: TStaticText;
    ComboBox4: TComboBox;
    Label4: TLabel;
    modname: TEdit;
    Label6: TLabel;
    modaddress: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    modcomment: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    modbegin: TDateTimePicker;
    Label15: TLabel;
    modend: TDateTimePicker;
    moderatorialvalue: TRadioGroup;
    Label16: TLabel;
    modmod: TComboBox;
    Button2: TButton;
    Button4: TButton;
    Button5: TButton;
    modcategory: TComboBox;
    GroupBox8: TGroupBox;
    Button1: TButton;
    needclose: TCheckBox;
    fd: TFontDialog;
    GroupBox9: TGroupBox;
    Button8: TButton;
    Button9: TButton;
    GroupBox10: TGroupBox;
    mod_list: TListBox;
    mod_edit: TEdit;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    GroupBox11: TGroupBox;
    cat_list: TListBox;
    cat_edit: TEdit;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    GroupBox12: TGroupBox;
    path2fips: TEdit;
    brow: TSpeedButton;
    GroupBox13: TGroupBox;
    browsenodelist: TSpeedButton;
    Path2nodelist: TEdit;
    Button16: TButton;
    od: TOpenDialog;
    Memo1: TMemo;
    Label7: TLabel;
    modreason: TMemo;
    Panel1: TPanel;
    Panel2: TPanel;
    modarea: TComboBox;
    label111: TLabel;
    filter: TRadioGroup;
    Button20: TButton;
    create_report: TButton;
    mode: TRadioGroup;
    area_list: TStringGrid;
    StatusBar1: TStatusBar;
    ApplicationEvents1: TApplicationEvents;
    cd: TColorDialog;
    Label17: TLabel;
    Label18: TLabel;
    CheckBox4: TCheckBox;
    Dontadd: TCheckBox;
    prules: TTabSheet;
    rulestext: TRichEdit;
    Panel3: TPanel;
    CodePage: TRadioGroup;
    wrap: TCheckBox;
    StaticText8: TStaticText;
    GroupBox15: TGroupBox;
    Button7: TButton;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    Button26: TButton;
    rulselect: TComboBox;
    StaticText6: TStaticText;
    StaticText9: TStaticText;
    CheckBox5: TCheckBox;
    msgtext: TRichEdit;
    Button6: TButton;
    bTrans: TButton;
    TabSheet3: TTabSheet;
    Panel4: TPanel;
    templatetext: TRichEdit;
    Button17: TButton;
    CheckBox6: TCheckBox;
    macrotemplate: TListBox;
    Button28: TButton;
    SaveDialog1: TSaveDialog;
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    Button27: TButton;
    SpeedButton2: TSpeedButton;
    deleteall: TButton;
    checkdeleteall: TCheckBox;
    statistics: TLabel;
    Button19: TButton;
    Label1: TLabel;
    SpeedButton3: TSpeedButton;
    TemplateName: TComboBox;
    XPManifest1: TXPManifest;
    SortMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure incmonthesChange(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker1CloseUp(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure modareaClick(Sender: TObject);
    procedure modlistClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure modnameChange(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure area_listClick(Sender: TObject);
    procedure mod_listClick(Sender: TObject);
    procedure cat_listClick(Sender: TObject);
    procedure browClick(Sender: TObject);
    procedure browsenodelistClick(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure showallClick(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure CodePageClick(Sender: TObject);
    procedure combobox2Change(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure wrapClick(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure create_reportClick(Sender: TObject);
    procedure Edit4Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure ApplicationEvents1Hint(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure StaticText8Click(Sender: TObject);
    procedure moderatorialvalueClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure rulselectChange(Sender: TObject);
    procedure StaticText9Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure bTransClick(Sender: TObject);
    procedure DontaddClick(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure Button28Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure templatetextChange(Sender: TObject);
    procedure msgtextChange(Sender: TObject);
    procedure deleteallClick(Sender: TObject);
    procedure checkdeleteallClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure TemplateNameExit(Sender: TObject);
    procedure TemplateNameKeyPress(Sender: TObject; var Key: Char);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
   private
    { Private declarations }
   public
    { Public declarations }
  end;

function FindNextWnd(StartHWND: HWND; AString : String): HWND;
{$a-}
//Это константы для макроподстановок. Просто так ничего не менять
const macroses:array[0..14] of shortstring=(
'@@D_BEG','@@D_END','@@MODER','@@_NODE','@@REASN',
'@@COMNT','@@_ECHO','@@MNAME','@@MADDR','@@DNAME',
'@@DADDR','@@D_NOW','@@ALLMO','@@MESSG','@@INCLD');

var
Moder:Tmoderatorial;
moderat:TModerator;
forecho,forsysop,fordist,AreaX: String;
indexes:array of integer;
Form1: TForm1;
sourcetext:TStringlist;
template,modadress,adress,Date1, Date2:string;
colfon:integer;

implementation

{$R *.DFM}
{$I-}

function str2word(param:string):integer;
begin
if (param='[ ]') then result:=0;
if (param='[*]') then result:=1;
if (param='[*][*]') then result:=2;
if (param='[+]') then result:=3;
if (param='[+][*]') then result:=4;
if (param='[+][*][*]') then result:=5;
if (param='[+][+]') then result:=6;
if (param='[+][+][*]') then result:=7;
if (param='[+][+][*][*]') then result:=8;
if (param='[!]') then result:=9;
end;

function FindNextWnd(StartHWND: HWND; AString : String): HWND;
var
  Buffer : array [0..255] of char;
begin
  Result := StartHWND;
  repeat
    Result := FindWindowEx(0, Result, nil, nil);
    GetWindowText(Result, Buffer, SizeOf(Buffer));
    if StrPos(StrUpper(Buffer), PChar(UpperCase(AString))) <> nil
    then  Break;
  until (Result = 0);
end;



Procedure Post;
Begin

End;

function ReadString(const Section, Ident, Default: string): string;
var
MyIni: TIniFile;
begin
  MyIni := TIniFile.Create(changefileext(application.exename,'.ini'));
  Result := MyIni.ReadString(Section, Ident, Default);
  MyIni.Free;
end;


// Поиск имени сисопа по нодлисту...
Function FillSysOpName:string;
Var
t: textfile;
Found: Boolean;
Hub, st, fipsdir{, tmp}: string;

Begin
// Подготовка данных...
fipsdir:=readstring('Fipsdir','Fipsdir1', '');
st:=readstring('Nodelist','nodelist1','');

AssignFile(t,st);
Reset(t);
Found:=False;
 while not (eof(t) or Found) do
  begin
   ReadLn(t,st);
   if Pos('Zone,' + inttostr(moder.zone), st)=1 then
   while not (eof(t) or Found) do {ищем pегион}
     begin
      ReadLn(t,st);
      if Pos('Zone,',st)=1 then break; {пошла следующая зона}
      if Pos('Region,' + Copy(inttostr(Moder.net),1,2),st)=1 then
  begin
   if StrToInt(inttostr(Moder.net)) > 99 then {опpеделяем, входит ли узел в "сеть" или нет}
   while not (eof(t) or (Pos('Host,' + inttostr(Moder.net),st)=1)) do {если входит, то листаем до хоста}
     ReadLn(t,st);
     Hub:=st;
     while not eof(t) do   {ищем узел}
       begin
        ReadLn(t,st);
        if Pos('Hub,',st)=1 then Hub:=st;
        if (Pos('Region,',st)=1) or (Pos('Host,',st)=1) then break; {пошел следующий хост/pегион}
        if Pos(',' + inttostr(Moder.Node) + ',',st)>0 then
         begin
    Delete(st,1,Pos(',',st));
    {адpес}
    Delete(st,1,Pos(',',st));
    {название узла}
    Delete(st,1,Pos(',',St));
    {местонаходжение узла}
    Delete(st,1,Pos(',',St));
    Insert(' ', st, Pos('_', st)); // Вместо _ пробел
    Delete (st, Pos('_',st), 1);
    Result:=Copy(st,1,Pos(',',St)-1); {имя сисопа}
    Found:=True;
    Break;
         end;
       end;
  end;
     end;
  end;
CloseFile (t);
End;

// ИЗМЕНЕНЫ 3 функции отправки письма...
///////    Награда в эху     ////////////////////
// Переменная Where=
// 1 - если послать в эху
// 2 - если послать ноде
// 3 - если послать поинту

Procedure CreateImportTo(ActivePage, Where:byte);
Var
count:integer;
f,f2:textfile;
tmp: String;
text: string;
SysOpName: string;
adr:FTNadr;
q:string;
Label 1;

Begin
// Если находимся в "просмотре писем", то не использовать никаких файлов...
q:=paramstr(1);
If Form1.PageControl1.ActivePageIndex=1 then q:='';
If Form1.CheckBox4.Checked=false then q:='';
If Where=2 Then
    begin
  // Имя сисопа по нодлисту...
  // Если не указан Имя НОДЛИСТА, то на имя SysOp
  adress:=inttostr(Moder.zone) + ':' + inttostr(Moder.Net) +
  '/' + inttostr(Moder.node) + '.' + IntToStr(moder.point);
  SysOpName:=FillSysOpName;
    End;
	Case Where of
  	1: tmp:='To_ECHO.imp';
        2: tmp:='To_NODE.imp';
  	3: tmp:='To_POINT.imp';
	   End;

     count:=1;
	repeat
	text:=ReadString('Fipsdir', 'fipsdir1','')+'\import\' + Moder.Area + '_' + Moder.Disturber_Name + '_'+Date1 + ' ' + inttostr(count) + '  '+tmp;
	inc(count);
	until (not fileexists(text)) and (count<30);

	AssignFile(f,text);
	Rewrite(f);
	//Тут сохраняем имена файлов для отображения потом текста письма
	Case Where of
	  1: forecho:=text;
  	2: forsysop:=text;
	  3: fordist:=text;
	End;

Case Where of
  1: Writeln (f,'Area ' + Moder.Area);
  2: Writeln (f,'Area NETMAIL');
  3: Writeln (f,'Area NETMAIL');
End;

Writeln (f,'FROM ' + form1.comod_name.text);
Writeln (f,'FROMADR ' + form1.edit6.text);
Case Where of
  1: Writeln (f, 'TO '+ Moder.Disturber_name);
  2: If SysOpName='' Then Writeln (f, 'TO Sysop')
      Else Writeln (f, 'TO ' + SysOpName);
  3: Writeln (f, 'TO ' + Moder.Disturber_name);
    end;
Case Where of
  2: Writeln (f, 'TOADR ' + inttostr(Moder.zone) + ':' +
      inttostr(Moder.Net)+'/' + inttostr(Moder.node)); // + '.0');
  3: Writeln (f, 'TOADR ' + moderat.getstringaddress);
    end;
Case Where of
  1: Writeln (f, 'Subject Moderatorial ' + modword2str(form1.moderatorialvalue.itemindex));
  2: begin
       adr:=Moderat.StrToFTN (adress);
       Write (f, 'Subject Moderatorial '+ modword2str(form1.moderatorialvalue.itemindex));
       If adr.point<>0 then Writeln(f,' to '+ adress) else Writeln(f,'');
     end;
  3: Writeln (f, 'Subject Moderatorial ' + modword2str(form1.moderatorialvalue.itemindex));
   end;
Writeln (f,'');
Writeln (f, '@BeginText');
form1.Edit4Click(form1);
writeln (f,strtooem(sourcetext.text));
Writeln (f, '@EndText');
Writeln (f, 'WriteMail');
CloseFile (f);
if ((q <> '') and (fileexists(q))) then CloseFile (f2);
End;

Function FillArea(name: string):string;
Var
F: TextFile;
i:integer;
s:string;

begin
// Open files /////////////
AssignFile(f, name);
reset (F);

readln (F, Moder.area);

s:='';
For i:=7 to length(Moder.area) do
  Begin
    if moder.area[i]=' ' then break;
    s:=s + moder.area[i];
  End;

i:=1;
Moder.area:=Uppercase(s);
s:='';

Repeat
s:=ReadString('Area','Area'+IntToStr(i),'');
Inc(i);
s:=UpperCase(s);
If s=Moder.area then
      Begin
       Result:=s;
       CloseFile(F);
       Exit;
      End;
Until (s='');
If ((s='') and ((form1.edit1.text<>'') and (fileexists(form1.edit1.text)))) then
   Result:='Вы не являетесь модератором ' + Moder.Area
        Else
   Result:=s;
// Close files //////
CloseFile(F);
end;

Procedure Fill_disturber_address(adress:string);
var
i: integer;
addr:ftnadr;

Begin
// Это режим награждения через коммандную строку
for i:=(length(adress)) downto 1 do
 begin
   if (adress[i]=' ') then
     begin
      adress:=copy (adress, i+1, length(adress)-i);
		if not moderat.AdrCorrect(adress) then exit;
		addr:=moderat.strtoftn(adress);
    moder.zone:=addr.Zone;
    moder.net:=addr.Region;
    moder.node:=addr.Node;
    moder.point:=addr.Point;
    Exit;
       //break;
     end;
 end;
// А это режим награждения БЕЗ коммандной строки...

    if not moderat.AdrCorrect(adress) then exit;
		addr:=moderat.strtoftn(adress);
    moder.zone:=addr.Zone;
    moder.net:=addr.Region;
    moder.node:=addr.Node;
    moder.point:=addr.Point;
End;


// Заполняет Moder.Disturber_name и адрес
procedure FillAdress_Name(name: string);
Var Filename: TextFile;
i:integer;
adress: string;
tmp:string;

begin
AssignFile(FileName, name);
reset (FileName);
readln (FileName, adress);
readln (FileName, adress);
tmp:=adress;
Fill_disturber_address(adress);
// tmp=adress
// Для версии ниже 1.10.07 идет Имя, адрес
// Для версии 1.11 идет имя  адрес...
// Точно работает под 1.10.06 и 1.11
// Под 1.10.07 (Новогодний билд) НЕ БУДЕТ РАБОТАТЬ из-за бага
// с сохранением письма через скрипт (похоже хорошо Владимир погулял...
// Перед новым годом... Хе-хе...)
for i:=7 to (length(tmp)-1) do
  if ((tmp[i]=',') or ((tmp[i]=' ') and (tmp[i+1]=' '))) then
      Begin
       Moder.Disturber_name:=copy(tmp, 7, i-7);
       break;
      End;
CloseFile(Filename);
adress:=moderat.getstringaddress;
end;

procedure TForm1.FormActivate(Sender: TObject);
var
DT: TDateTime;
SystemTime: TSystemTime;
i:integer;
s1, tmp:string;
Label 1;


begin
if paramstr(1)='-post' then
              Begin
                Post;
                Application.Destroy;
              End;
edit1.text:=paramstr(1);
CheckBox4.Checked:=true;
If edit1.text='' then CheckBox4.Checked:=false;
If ((edit1.text<>'') and not(fileexists(edit1.text))) then
 begin
  CheckBox4.Checked:=false;
  Edit1.Text:='';
 End;

	memo1.lines.clear;
  modreason.lines.Clear;
//Добавляем заполнение пути в настройке пути
	path2fips.Text:=readstring('fipsdir','fipsdir1',extractfilepath(application.exename));
  Path2nodelist.Text:=readstring('nodelist','nodelist1',extractfilepath(application.exename));
	if not directoryexists(path2fips.Text) then
	Begin
  	application.MessageBox(pchar('Папка '+path2fips.Text+' не существует. Укажите правильное расположение папки FIPS'),'Ошибка настройки папки FIPS',mb_ok+mb_iconerror);
		pagecontrol1.ActivePageIndex:=4;
  	browClick(sender);
	End;

//Заполняем список модерируемых эх
	area_list.rowcount:=2;
	ComboBox1.Items.clear;
	rulselect.Items.clear;
	modarea.items.clear;
	area_list.rows[1].clear;
	area_list.Cells[0,0]:='Область';
	area_list.Cells[1,0]:='Должность';
	area_list.Cells[2,0]:='Адрес';
	area_list.Cells[3,0]:='Файл шаблона';
	i:=1;
	repeat
		s1:=ReadString('Area','area'+IntToStr(i),'');
		if s1<>'' then
	  begin
			area_list.RowCount:=area_list.RowCount+1;
			modarea.items.add(s1);
		  area_list.cells[0,i]:=ReadString('Area','area'+IntToStr(i),'');
		  area_list.cells[1,i]:=ReadString('Area','Post'+IntToStr(i),'');
	  	area_list.cells[2,i]:=ReadString('Area','Address'+IntToStr(i),'');
	    area_list.cells[3,i]:=ReadString('Area','Template'+IntToStr(i),'');
  	end;
		inc(i);
//	if area_list.rowCount>2 then area_list.rowCount:=area_list.rowCount-1;
	until 	s1='';
	modarea.itemindex:=0;
	ComboBox1.Items.text:=modarea.items.text;
	rulselect.Items.text:=modarea.items.text;
	modarea.ItemIndex:=0;
	combobox1.ItemIndex:=0;
	area_list.row:=1;
//combobox1.itemindex:=0;
	rulselect.itemindex:=0;
//Modarea.ItemIndex:=0;
	if (area_list.cells[0,area_list.rowcount-1]='') and (area_list.rowcount>2) then area_list.rowcount:=area_list.rowcount-1;
	Button2.Enabled:=False;
///  Это режим награждения, если в ком. строке передан файл
//   сохраненного письма...
	If ( (edit1.text='') or not(fileexists(edit1.text))) then goto 1;
	PageControl1.ActivePage:=TabSheet1;
// ЧАСТЬ НАГРАЖДЕНИЯ

// Заполнение поля - Адрес/Имя нарушителя
	FillAdress_Name(edit1.text);
//  Эта нижняя строчка - бред какой-то...  :)
	adress:=moderat.getstringaddress;
// Заполнение поля имени нарушителя и его адреса...
	Edit5.Text:=inttostr(moder.zone)+':'+inttostr(moder.net)+'/'+inttostr(moder.node);
	if moder.point<>0 then edit5.text:=edit5.text+'.'+inttostr(moder.point);
	Edit4.Text:=Moder.Disturber_name;

//////////////////////////////////////////////////////////
// Нода или поинт, если нода, то
// CheckBox ([x] Поинту) становится серым. А потом... пропадает... :)
// Если потом ручками поменять адресс и другие данные, то, чтобы не
// перезапускать программу из-за отсутствия чекбокса,
// просто поставить галочку
	If moder.point=0 then CheckBox3.Checked:=False else CheckBox3.Checked:=True;
	If fillArea(edit1.text)=('Вы не являетесь модератором ' + Moder.Area) Then
	Begin
		CheckBox1.Checked:=false;
		CheckBox2.Checked:=false;
		CheckBox3.Checked:=false;
		CheckBox4.Checked:=false;
		Edit4.Text:='';
		Edit5.Text:='';
    tmp:='Вы не являетесь модератором ' + Moder.Area;
    Application.MessageBox(pchar(tmp),'Ошибка',mb_ok+mb_iconerror);
	End;
// ОБЩАЯ ЧАСТЬ
1:
	If (edit1.text='') then PageControl1.ActivePage:=TabSheet2;
	Modmod.itemindex:=1;
	moderatorialvalueClick(Sender);

// Общие заполнения, есть письмо, нет письма - один хрен,
// поля-то нужно заполнить
// Заполнение "С добавлением в группу"
//Добавил заполнение настроечного листбокса
	combobox4.Items.Clear;
	modcategory.Items.Clear;
	cat_list.items.clear;
	i:=1;
	While (Readstring('category','category'+inttostr(i),'')<>'') do
	Begin
		s1:=Readstring('category','category'+inttostr(i),'');
		cat_list.items.add(s1);
		Inc (i);
	End;
  //Инициализируем, если инишки не было начальными значениями
	if cat_list.items.Count<1 then cat_list.Items.Text:='Подпичик "обыкновенный"'#13'Подозрительная личность'#13'Провокатор и флеймер'#13'Hадежен'#13'Кащенит, ТВHщик и т.д...';
	//Присваиваем другим спискам тот же текст
	combobox4.Items.text:=cat_list.Items.Text;
	modcategory.Items.text:=cat_list.Items.Text;

 // КОНЕЦ
	combobox4.ItemIndex:=0;
	modcategory.ItemIndex:=0;
	cat_list.itemindex:=0;

// Заполнение причин...
	i:=1;
	ComboBox3.Items.clear;
	Modreason.lines.clear;
	mod_list.Items.clear;

	While (ReadString('REASON', 'REASON'+IntToStr(i),'')<>'') do
	Begin
		s1:=ReadString('REASON', 'REASON'+IntToStr(i),'');
		mod_list.Items.Add(s1);
		Inc(i);
	End;
  //Инициализируем, если инишки не было начальными значениями
	if mod_list.items.Count<1 then mod_list.Items.Text:=
  	'Излишнее цитирование (overquoting)'#13+
    'Сообщение не по теме конференции (Offtopic)'#13+
    'Обращение к (Ко)Модератору в эхе'#13+
    'Использование ненормативной лексики'#13+
		'Оскорбление подписчиков'#13+
    'Личная переписка в эхе'#13+
    'Hарушение полиси'#13+
    'Рецидив модераториала'#13+
    'Постинг UUE без согласования с модератором'#13+
    'Разжигание флейма'#13+
    'Hенастроенный софт'#13+
    'Рекламное сообщение'#13+
    'Отсутствие реального имени автора письма'#13;
	//Присваиваем другим спискам тот же текст
	combobox3.Items.text:=mod_list.Items.Text;
	Edit3.Text:='';
	ComboBox3.itemindex:=-1;
//Modreason.itemindex:=0;
	mod_list.itemindex:=0;
//m Заполнение полей эдит для настроек
	area_listClick(Sender);
	mod_listClick(Sender);
	cat_listClick(Sender);

	GetLocalTime(SystemTime);
	DT:=SystemTimeToDateTime(SystemTime);
	DateTimePicker1.Date:=DT;
	datetimepicker2.date:=IncMonth(datetimepicker1.date,incmonthes.Value);

	Date1:=DateToStr(DateTimePicker1.Date);
	Date2:=DateToStr(DateTimePicker2.Date);

////////// Заполняем выбор эх ///////////////////////////

// Заполнение адреса модератора
	modadress:=ReadString('Area', 'Post'+inttostr(combobox1.itemindex+1), '');
	comod_name.Text:=modadress;

	modadress:=ReadString('Area', 'Address'+inttostr(combobox1.itemindex+1), '');
	Edit6.Text:=modadress;

// Названия эх дублируется в закладках: награда и просмотр...
	ComboBox1.itemindex:=ComboBox1.items.IndexOf(FillArea(edit1.text));
	rulselect.Text:=FillArea(edit1.text);

// Добавление правил эхи
	If moder.area='' then moder.area:=ReadString('Area','Area1','');
	if fileexists('.\rules\' + Moder.Area+'.txt') then
	begin
		rulestext.Lines.LoadFromFile('.\rules\' + Moder.Area+'.txt');
	end;
	ComboBox1.itemindex:=combobox1.items.IndexOf(moder.area);
	modarea.ItemIndex:=ComboBox1.itemindex;
// Тут начинается заполнение таблицы модераториалов.

	modlist.Cells[0,0]:='Имя';
	modlist.Cells[1,0]:='Адрес';
	modlist.Cells[2,0]:='"Награда"';
	modlist.Cells[3,0]:='Причина';
	modlist.Cells[4,0]:='Начало';
	modlist.Cells[5,0]:='Окончание';
	modlist.Cells[6,0]:='Комментарий';
	modlist.Cells[7,0]:='Категория';
	modlist.Cells[8,0]:='Область';

	modarea.ItemIndex:=combobox1.itemindex;
	modarea.items.IndexOf(readstring('area','area1',''));
	modareaclick(sender);
	combobox2Change(sender);
end;

procedure TForm1.Button1Click(Sender: TObject);
Var
	adr:ftnadr;
  tmpstr:TStringlist;

begin
Edit4Click(sender);
If template='' then
  Begin
    application.MessageBox('Укажите файл шаблона для вашей эхоконференции в настройках','Ошибка',mb_ok+mb_iconerror);
    Exit;
  End;

 If UpperCase(Copy(ComboBox1.Text, 1, 15))=
      UpperCase('Вы не являетесь') Then
   Begin
    CheckBox1.Checked:=false;
    CheckBox2.Checked:=false;
    CheckBox3.Checked:=false;
    application.MessageBox(pchar(ComboBox1.Text),'Ошибка',mb_ok+mb_iconerror);
    Exit;
   End;
// Проверка, выбрана ли область модерирования
if ComboBox1.Text='' then
   Begin
    application.MessageBox('Необходимо выбрать область','Ошибка',mb_ok+mb_iconerror);
    exit;
   End;
// Проверка, выбрано ли имя нарушителя
If Edit4.Text='' then
Begin
	application.MessageBox('Необходимо ввести имя нарушителя','Ошибка',mb_ok+mb_iconerror);
	exit;
End;

// Проверка, выбран ли адрес и корректен ли он
If not(Moderat.AdrCorrect(Edit5.Text)) Then
  Begin
   application.MessageBox('Неправильный адрес','Ошибка',mb_ok+mb_iconerror);
   exit;
  End;
If memo1.Lines.Count<1 then
  Begin
   application.MessageBox('Необходимо выбрать причину','Ошибка',mb_ok+mb_iconerror);
   exit;
  End;

// Конец
// Заполнение полей Tmoderatorial
With Moder do
Begin
	area:=ComboBox1.Text; // Area
	Fill_disturber_address(Edit5.Text); // адрес нарушителя
	Disturber_name:=Edit4.Text;   // имя нарушителя
	moderatorial:=moderatorialvalue.itemindex; // награла
	dateofbegin:=DateTimePicker1.Date; // начало
	Dateofend:=DateTimePicker2.Date;   // конец
	reason:=memo1.Text;      // причина
	comment:=Edit3.Text;         // комментарий
End;

Moder.category:=combobox4.itemindex;

if not dontadd.Checked then
begin
	moderat.addmod;
	moderat.setmod(moder);
end;

If CheckBox4.Checked then
Begin
	tmpstr:=tstringlist.create;
	if fileexists(edit1.text) then tmpstr.loadfromfile(edit1.text);
	moderat.addtext(tmpstr);
	tmpstr.free;
End;

adr:=Moderat.StrToFTN(Edit5.Text);
If adr.Point=0 then CheckBox3.Checked:=False;
Edit4Click(sender);
if (CheckBox1.Checked=True and CheckBox1.Visible=True) then CreateImportTo(0,1);
if (CheckBox2.Checked=True and CheckBox2.Visible=True) then CreateImportTo(0,2);
if (CheckBox3.Checked=True and CheckBox3.Visible=True) then CreateImportTo(0,3);

modareaclick(sender);
Button2.Enabled:=false;

if needclose.checked then
Begin
    Form1.close;
End;
	try
		if (fileexists(edit1.text)) then DeleteFile (edit1.text);
  except
		application.MessageBox(pchar('Невозможно удалить файл '+edit1.text),'Ошибка удаления файла',mb_ok+mb_iconerror);
  end;
Edit4.text:='';
Edit5.text:='';
Memo1.Text:='';
Checkbox4.Checked:=false;
Application.Messagebox (
   Pchar('Созданы файлы импорта в каталоге: '+ #13 +
  readstring('fipsdir','fipsdir1','') + '\import'),
  '''Награждение'' успешно',
  mb_ok+mb_iconinformation);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 application.MessageBox('Создатели:'+#13+'Ilya Breikin 2:5015/113.33 aka 2:5015/176.21'+#13+'Maxim Tserkovniy 2:469/117.29','О программе',mb_ok+mb_iconinformation);
end;

procedure fontsave(afont:TFont;asection:String);
var progini:TInifile;
BEGIN
	progini:=tinifile.create(changefileext(application.ExeName,'.ini'));
	progini.WriteString (asection,'Name', afont.Name); //Четные
	progini.WriteInteger(asection,'Charset',afont.Charset);
	progini.WriteInteger(asection,'Color', afont.Color);
	progini.WriteInteger(asection,'Height', afont.Height);
	progini.WriteInteger(asection,'Size', afont.Size);
	progini.WriteInteger(asection,'Style',Byte(afont.Style));
  progini.free;
END;

procedure fontopen(asection:string;var aFont:TFont);
var progini:TInifile;
BEGIN
	progini:=tinifile.create(changefileext(application.ExeName,'.ini'));
	afont.Name    := progini.ReadString (asection,'Name','Courier New');
	afont.Charset := progini.ReadInteger(asection,'Charset',russian_CHARSET);
	afont.Color   := progini.ReadInteger(asection,'Color', clWindowText);
	afont.Height  := progini.ReadInteger(asection,'Height',-11);
	afont.Size    := progini.ReadInteger(asection,'Size',9);
	afont.Style   := TFontStyles(Byte(progini.ReadInteger(asection,'Style',0)));
  progini.free;
END;



procedure TForm1.FormCreate(Sender: TObject);
var	progini:TInifile;
	cou:integer;

	ds:string;
label 2;
begin
// Пока оставить...
{If ((ParamCount=0) or Not(fileexists(ParamStr(1))) then
   Begin
    ShowMessage ('Mod_Tool.exe <Saved_Letter> <F.I.P.S._Dir> <Your FIDO adress>');
    Halt;
   End;
}
	Form1.Caption:='F.I.P.S. Moderator''s Tool, ver: '+ GetFileVersion(application.ExeName);
	sourcetext:=TStringList.Create;
	moderat:=TModerator.create(extractfilepath(application.exename)+'moderator.dat');
	fontwin:=tfont.create;
	zfmfeven:=tfont.create;
	zfmfodd:=tfont.create;
	zfmforigin:=tfont.create;
	zfmfcludge:=tfont.create;
	zfmftear:=tfont.create;
	if not fileexists(changefileext(application.ExeName,'.ini')) then
      application.MessageBox('Необходимо сначала настроить список модерируемых эх и файлы шаблонов','Первый запуск FIPSModTool',mb_iconinformation+mb_ok);
	progini:=tinifile.create(changefileext(application.ExeName,'.ini'));
	colfon:=progini.ReadInteger('BGColor','Color',clWhite);
	msgtext.Color:=colfon;
  fontopen('Fontwin',fontwin);
  fontopen('ZFMFOrigin',ZFMFOrigin);
  fontopen('ZFMFCludge',ZFMFCludge);
  fontopen('ZFMFOdd',ZFMFOdd);
  fontopen('ZFMFEven',ZFMFEven);
  fontopen('ZFMFTear',ZFMFTear);
	checkdeleteall.Checked:= progini.readBool('DeleteAll','CheckDelete',checkdeleteall.checked);

	if checkdeleteall.Checked then
     begin
		cou:=0;
		repeat
			moderat.setpos(cou);
			if not moderat.getvalid then moderat.deletemod(cou) else inc(cou);
      if moderat.getcount=0 then goto 2;
     	until cou>moderat.getcount;
	end;
2:	cou:=0;

	while progini.readString('TemplateNames','item'+inttostr(cou),'')<>'' do
     begin
	   	templatename.items.add(progini.readString('TemplateNames','item'+inttostr(cou),''));
		inc(cou);
     end;
	progini.free;
end;







procedure TForm1.incmonthesChange(Sender: TObject);
begin
	datetimepicker2.date:=IncMonth(datetimepicker1.date,incmonthes.Value);
end;


procedure TForm1.ComboBox1Click(Sender: TObject);
begin
Edit5.Text:='';
Edit4.Text:='';
// Синхронизация выбора эх в награждении и правилах...
//ComboBox2.Text:=ComboBox1.Text;
//Modarea.Text:=ComboBox1.Text;
//if fileexists('.\rules\' + ComboBox1.Text+'.txt') then
//   Richedit1.Lines.LoadFromFile('.\rules\' + ComboBox1.Text+'.txt');

end;

procedure TForm1.DateTimePicker1Change(Sender: TObject);
begin
datetimepicker2.date:=IncMonth(datetimepicker1.date,incmonthes.Value);

Date1:=DateToStr(DateTimePicker1.Date);
Date2:=DateToStr(DateTimePicker2.Date);
end;

procedure TForm1.DateTimePicker1CloseUp(Sender: TObject);
begin
Date1:=DateToStr(DateTimePicker1.Date);
Date2:=DateToStr(DateTimePicker2.Date);
datetimepicker2.date:=IncMonth(datetimepicker1.date,incmonthes.Value);

Date1:=DateToStr(DateTimePicker1.Date);
Date2:=DateToStr(DateTimePicker2.Date);

end;


procedure TForm1.FormDestroy(Sender: TObject);
var	progini:TInifile;
	cou:integer;
begin
  // При закрытии формы сохраняются измененния в "Просмотре писем"
  Button16Click (sender);
  // Button2Click (sender);
	progini:=tinifile.create(changefileext(application.ExeName,'.ini'));
  fontsave(fontwin,'Fontwin');
  fontsave(ZFMFOrigin,'ZFMFOrigin');
  fontsave(ZFMFCludge,'ZFMFCludge');
  fontsave(ZFMFEven,'ZFMFEven');
  fontsave(ZFMFOdd,'ZFMFOdd');
  fontsave(ZFMFTear,'ZFMFTear');
	progini.WriteInteger('BGColor','Color',colfon);
	cou:=0;

	progini.EraseSection('Templatenames');
	while templatename.items.count>cou do
	begin
     	progini.WriteString('TemplateNames','item'+inttostr(cou),templatename.items[cou]);
    inc(cou);
	end;

	progini.free;
	fontwin.FREE;
	zfmfeven.FREE;
	zfmfodd.FREE;
	zfmforigin.FREE;
	zfmfcludge.FREE;
    	zfmftear.free;

	sourcetext.free;
       	moderat.free;
end;

// Показ всех нарушителей выбранной эхи
procedure TForm1.modareaClick(Sender: TObject);
var	ind,i:integer;

begin
// Эту строку не трогать !!! НУЖНА
If (PageControl1.ActivePageIndex=1) then ComboBox1.itemindex:=Modarea.itemindex;

//Поменен стиль комбобокса, так что текст использовать и присваивать нельзя
Combobox1Change(Sender);

If PageControl1.ActivePage=TabSheet2 then
   Form1.Caption:='F.I.P.S. Moderator''s Tool, ver: '+GetFileVersion(application.ExeName)+', Area: ' + Modarea.Text;
	modlist.rowcount:=2;
  modlist.Rows[1].Clear;
  modlist.Rows[2].Clear;
	setlength(indexes,0);
	ind:=1;
	if moderat.getcount<>0 then
  begin
// Заполнение списков наказанных. В порядке их занесения в базу. Сортировки пока нет
		for i:=0 to moderat.getcount-1 do
		Begin
  		moderat.setpos(i);
   if ((moderat.getarea<>'') and (moderat.getarea<>modarea.text) and (not (filter.itemindex=0))) then continue;
//	if not (filter.itemindex=2 and adrcorrect(modaddress.text) and ) then if
   	 modlist.Cells[0,i+1]:=moderat.getname;                 //modlist.rowcount-1
	   modlist.Cells[1,i+1]:=moderat.getstringaddress;
  	 modlist.Cells[2,i+1]:=moderat.getmoderatorial;
	   modlist.Cells[3,i+1]:=moderat.getreason;
  	 modlist.Cells[4,i+1]:=datetostr(moderat.getdateofbegin);
	   modlist.Cells[5,i+1]:=datetostr(moderat.getdateofend);
  	 modlist.Cells[6,i+1]:=moderat.getcomment;
	   modlist.Cells[7,i+1]:=combobox4.items[moderat.getcategory];
  	 modlist.Cells[8,i+1]:=moderat.getarea;
	   modlist.RowCount:=i+3;
  	 inc(ind);
	   setlength(indexes,ind);
  	 indexes[ind-1]:=i;
		End;
	end;
  // Если первая строка пустая, а вторая заполнена, то очистка второй...
if (modlist.RowCount>2) and (modlist.cells[0,modlist.rowcount-1]='') then modlist.RowCount:=modlist.RowCount-1;
  // Типа обновление
  modlistclick(sender);
end;


// Из-за процедуры сортировки изменю.
procedure TForm1.modlistClick(Sender: TObject);
var i:integer;
s1: string;

label a1;

begin
  if modlist.cells[1,1]='' then exit;

// Адрес
  modaddress.Text:=modlist.Cells[1,modlist.row];          //moderat.getstringaddress;

// Имя
  modname.Text:=modlist.Cells[0,modlist.row];             //moderat.getname;

// Награда
modmod.itemindex:=str2word(modlist.Cells[2,modlist.row]);         //moderat.getmoderatorialword;

// Причина
  modreason.text:=modlist.Cells[3,modlist.row];           //moderat.getreason;

// Комментарий
  modcomment.Text:=modlist.Cells[6,modlist.row];          //moderat.getcomment;
  modcomment.Hint:=modcomment.Text;
  application.hinthidepause:=10000;

i:=1;
	While (Readstring('category','category'+inttostr(i),'')<>'') do
	Begin
		s1:=Readstring('category','category'+inttostr(i),'');
    if (s1=modlist.Cells[7,modlist.row]) then
      Begin
        modcategory.ItemIndex:=i-1;
        goto a1;
      End;
		Inc (i);
	End;
a1:
//modcategory.itemindex:=modlist.Cells[7,modlist.row];    //moderat.getcategory;

// Дата начала
modbegin.DateTime:=strtodate(modlist.Cells[4,modlist.row]);        //moderat.getdateofbegin;

// Дата конца
modend.DateTime:=strtodate(modlist.Cells[5,modlist.row]);          //moderat.getdateofend;

  Button2.Enabled:=False;

// При нажатии на "Показать всех нарушителей"
If Pagecontrol1.ActivePage=TabSheet2 then
      Form1.Caption:='F.I.P.S. Moderator''s Tool, ver: '+GetFileVersion(application.ExeName)+', Area: ' + Moderat.getarea;
  Modarea.items.IndexOf(Moderat.getarea);
  rulselect.itemindex:=Modarea.itemindex;
  ComboBox2change (Sender);

end;


// Нажатие-мое на "Сохранить" в "Просмотр писем"
procedure TForm1.Button2Click(Sender: TObject);
begin
// Если область пуста и происходят изменения в каком-либо
// элементе, то загорается кнопочка Сохранить, но сохранять-то нечего,
// поэтому вызывается кнопка Добавить, а Сохранить сереет
// Иначе ошибка...
If Modlist.Cells[0,1]='' then
Begin
	Button2.Enabled:=false;
//	Button4click(sender);
End;
///
	moderat.setpos(indexes[modlist.row]);
  moderat.setname(modname.text);
  moderat.setstringaddress(modaddress.Text);
  moderat.setcomment(modcomment.text);
  moderat.setmoderatorialword(modmod.itemindex);
  moderat.setreason(modreason.text);
  moderat.setdateofbegin(modbegin.datetime);
  moderat.setdateofend(modend.datetime);
  moderat.setCategory(modcategory.itemindex);
//	moderat.setoffset(spinedit1.value);
//	moderat.settextlength(spinedit2.value);
  modareaclick(sender);
  moderat.renume;
end;

// Нажатие-мое на "Добавить" в "Просмотр писем"
procedure TForm1.Button4Click(Sender: TObject);
begin
  moderat.addmod;

  moderat.setarea(modarea.Text);
	moderat.setname(modname.text);
  moderat.setstringaddress(modaddress.Text);
  moderat.setcomment(modcomment.text);
  moderat.setmoderatorialword(modmod.itemindex);
  moderat.setreason(modreason.text);
  moderat.setdateofbegin(modbegin.datetime);
  moderat.setdateofend(modend.datetime);
  moderat.setCategory(modcategory.itemindex);
  modareaclick(sender);
end;

// Нажатие-мое на "Удалить" в "Просмотр писем"
procedure TForm1.Button5Click(Sender: TObject);
begin
	If modlist.Cells[0,1]='' then exit;
	If application.MessageBox('Удалить нарушителя ?','Напоминание',MB_YESNO+MB_ICONQUESTION)=id_no then exit;
	moderat.deletemod(indexes[modlist.row]);
	modlist.rows[modlist.rowcount-1].Clear;
	modareaclick(sender);

end;


procedure TForm1.modnameChange(Sender: TObject);
begin
	Button2.Enabled:=True;
end;

procedure TForm1.PageControl1Change(Sender: TObject);
begin
if pagecontrol1.ActivePageIndex=0 then moderatorialvalueClick(Sender);
if pagecontrol1.ActivePageIndex=4 then rulselectChange(sender);
if pagecontrol1.ActivePageIndex=2 then
  Begin
    StaticText9Click (sender);
    StaticText9Click (sender);
  End;

if pagecontrol1.ActivePageIndex=5 then
begin
  if not fileexists(template) then
  begin
		templatetext.lines.Clear;
    templatetext.lines.add('Добрый день.');
    templatetext.lines.add('');
		templatetext.lines.add('Вы или Ваш поинт нарушили правила эхоконференции * @_echo *');
		templatetext.lines.add('и из-за чего весь Ваш узел * @_node * получает @MODER');
    templatetext.lines.add('');
		templatetext.lines.add(' _Причина(ны):_');
		templatetext.lines.add('@reasn');
		templatetext.lines.add('@Comnt');
    templatetext.lines.add('');
		templatetext.lines.add('#Дата получения:# @d_beg #Дата окончания модераториала:# @d_end');
    templatetext.lines.add('');
		templatetext.lines.add('* ----=== Hачало письма нарушителя ===----*');
		templatetext.lines.add('@messg');
		templatetext.lines.add('* ----=== Конец письма нарушителя ===----*');
    templatetext.lines.add('');
		templatetext.lines.add('@mname AKA @maddr');
    templatetext.lines.add('');
		templatetext.lines.add('[Created by F.I.P.S. Moderator''s Tool (c) 2003, BIO&TMA ]');
    templatetext.lines.add('');
		statusbar1.panels[0].text:='Загрузка шаблона по умолчанию';
		exit;
  End;
  templatetext.Font.Assign(fontwin);
       	templatetext.Color:=colfon;
  templatetext.Lines.LoadFromFile(template);
  templatetext.font.Charset:=default_charset;
  templatetext.SetFocus;
end;
	CheckBox5Click(sender);
	Button2.Enabled:=False;
	modlistclick (sender);
	If PageControl1.ActivePage<>TabSheet2 then
		Form1.Caption:='F.I.P.S. Moderator''s Tool, ver: '+GetFileVersion(application.ExeName)
		else
		Form1.Caption:='F.I.P.S. Moderator''s Tool, ver: '+GetFileVersion(application.ExeName)+', Area: ' + Modarea.Text;

button27.Visible:=false;
msgtext.PlainText:=true;
mode.visible:=true;
statictext9.visible:=true;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
	area_list.RowCount:=area_list.RowCount+1;
end;

procedure TForm1.Button9Click(Sender: TObject);
var	cou:integer;
begin
	if application.MessageBox('Вы действительно хотите удалить выделенную область?','Подтверждение удаления',mb_yesno+mb_iconquestion)=id_no then exit;
  for cou:=area_list.row to area_list.rowcount-2 do area_list.rows[cou]:=area_list.rows[cou+1];
  area_list.rows[area_list.row].clear;
	area_list.RowCount:=area_list.RowCount-1;
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
	mod_list.items[mod_list.itemindex]:=mod_edit.text;
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
	mod_list.items.add(mod_edit.text);
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
	if application.MessageBox('Вы действительно хотите удалить выделенную причину?','Подтверждение удаления',mb_yesno+mb_iconquestion)=id_no then exit;
  mod_list.items.delete(mod_list.itemindex);
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
	cat_list.items[cat_list.itemindex]:=cat_edit.text;
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
	cat_list.items.add(cat_edit.text);
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
	if application.MessageBox('Вы действительно хотите удалить выделенную категорию?','Подтверждение удаления',mb_yesno+mb_iconquestion)=id_no then exit;
  cat_list.items.delete(cat_list.itemindex);
end;

procedure TForm1.area_listClick(Sender: TObject);
begin
//	if area_list.items.count<1 then exit;
//	area_edit.text:=area_list.Items[area_list.itemindex];
end;

procedure TForm1.mod_listClick(Sender: TObject);
begin
	if mod_list.items.count<1 then exit;
	mod_edit.text:=mod_list.Items[mod_list.itemindex];
end;

procedure TForm1.cat_listClick(Sender: TObject);
begin
	if cat_list.items.count<1 then exit;
  cat_edit.text:=cat_list.Items[cat_list.itemindex];
end;

procedure TForm1.browClick(Sender: TObject);
var	s1:string;
begin
	s1:=browse(Handle,'c:\');
	if not directoryexists(s1) then exit;
	path2fips.text:=s1;
//	if copy(path2fips.text,length(path2fips.text)-1,1)<>'\' then path2fips.text:=path2fips.text+'\';
end;

procedure TForm1.browsenodelistClick(Sender: TObject);
begin
	if not od.execute then exit;
  Path2Nodelist.Text:=od.filename;
end;

procedure TForm1.Button16Click(Sender: TObject);
var	myini:tinifile;
	i:integer;
begin
	MyIni:=TIniFile.Create(changefileext(application.exename,'.ini'));
	myini.EraseSection('area');
  for i:=1 to area_list.RowCount-1 do
  Begin
		if area_list.cells[0,i]='' then break;
		myini.writestring('area','area'+inttostr(i),uppercase(area_list.cells[0,i]));
		myini.writestring('area','Post'+inttostr(i),area_list.cells[1,i]);
		myini.writestring('area','Address'+inttostr(i),area_list.cells[2,i]);
		myini.writestring('area','Template'+inttostr(i),area_list.cells[3,i]);
  End;
  //  for i:=1 to area_list.items.count do myini.writestring('area','area'+inttostr(i),area_list.items[i-1]);
	myini.EraseSection('category');
  for i:=1 to cat_list.items.count do myini.writestring('category','category'+inttostr(i),cat_list.items[i-1]);
	myini.EraseSection('reason');
  for i:=1 to mod_list.items.count do myini.writestring('reason','reason'+inttostr(i),mod_list.items[i-1]);
	myini.erasesection('fipsdir');
  myini.WriteString('fipsdir','fipsdir1',path2fips.text);
	myini.erasesection('nodelist');
  myini.WriteString('nodelist','nodelist1',Path2Nodelist.text);
  myini.free;
  Formactivate (sender);
end;

procedure TForm1.ComboBox3Change(Sender: TObject);
begin
	memo1.lines.add(combobox3.text);
end;

procedure TForm1.Memo1Change(Sender: TObject);
begin
//if (sender as tmemo).lines[(sender as tmemo).lines.count]='' then (sender as tmemo).lines.delete((sender as tmemo).lines.count);
	Button2.Enabled:=True;
  Edit4Click(sender);
end;

procedure TForm1.showallClick(Sender: TObject);
begin
	modareaClick(sender);
end;


procedure TForm1.Button17Click(Sender: TObject);
begin
	if not fileexists(template) then
  Begin
		if application.MessageBox('Файл шаблона не существует. Создать новый шаблон?','Ошибка сохранения шаблона',mb_yesno+mb_iconwarning)=id_no then exit;
    savedialog1.InitialDir:=extractfilepath(application.exename);
		savedialog1.FileName:='template2.txt';
  	if not savedialog1.Execute then exit;
    template:=savedialog1.filename;
	End;
	templatetext.Lines.SaveToFile(template);
  combobox2Change(sender);
end;

procedure TForm1.CodePageClick(Sender: TObject);
begin
	rulselectChange(Sender);
end;

procedure TForm1.combobox2Change(Sender: TObject);
var adr: FtnAdr;
begin
if modlist.Cells[0,1]='' then exit;
  msgtext.ReadOnly:=true;
	msgtext.PlainText:=false;
  mode.visible:=true;
  statictext9.visible:=true;
	panel2.visible:=true;
	button27.Visible:=false;
	msgtext.Lines.Clear;
  form1.Enabled:=false;
  msgtext.Font:=fontwin;
  msgtext.Color:=colfon;
try
	case mode.ItemIndex of
	1:Begin
		msgtext.lines.BeginUpdate;
		if not fileexists(fordist) then
    Begin
      msgtext.lines.add('Указанное письмо не найдено');
      exit;
    End;
		msgtext.lines.loadfromfile(fordist);
  End;
	2:Begin
		msgtext.lines.BeginUpdate;
		if not fileexists(forsysop) then
    Begin
      msgtext.lines.add('Указанное письмо не найдено');
      exit;
    End;
		msgtext.lines.loadfromfile(forsysop);
  End;
	3:Begin
		msgtext.lines.BeginUpdate;
		if not fileexists(forecho) then
    Begin
      msgtext.lines.add('Указанное письмо не найдено');
      exit;
    End;
		msgtext.lines.loadfromfile(forecho);
  End;
	0:Begin
	  Edit4Click(sender);
		msgtext.lines.BeginUpdate;
		msgtext.Text:=strtooem(sourcetext.Text);
  End;
	end;
	msgtext.text:=OemToAnsiStr(msgtext.text);
  msgtext.font.Charset:=default_charset;
	if statictext9.BorderStyle=sbssunken then
	Begin
		coloratrib(msgtext);
		colorating(msgtext,true);
	End;
  if statictext9.BorderStyle<>sbssunken then colorating(msgtext,false);
finally
  adr:=Moderat.StrToFTN(modaddress.text);
/////
// modword2str(Moderat.getallmod(inttostr(adr.Zone) + ':'+inttostr(adr.Region)+'/'+inttostr(adr.Node)
/////
 statistics.caption:='Итого узел ' + inttostr(adr.Zone)+':'+inttostr(adr.Region)+'/'+inttostr(adr.Node) + ' имеет ' + modword2str(Moderat.getallmod(modaddress.Text));
     form1.Enabled:=true;
	msgtext.lines.endupdate;
end;
end;

procedure TForm1.Button19Click(Sender: TObject);
var	tmpstr:TStringList;
begin
  if Modlist.cells[0,1]='' then exit;
	msgtext.lines.Clear;
	tmpstr:=tstringlist.create;
  moderat.setpos(modlist.row);
	try
		try
			moderat.gettext(tmpstr);
		except
  		application.MessageBox('Невозможно открыть текст письма','Ошибка отображения текста письма',mb_ok+mb_iconerror);
    	exit;
	  end;
		pagecontrol1.ActivePageIndex:=2;
  	msgtext.lines.text:=oemtoansistr(tmpstr.text);
	finally
		panel2.visible:=false;
	  tmpstr.free;
		coloratrib(msgtext);
		colorating(msgtext,true);
  end;
end;

procedure TForm1.Button20Click(Sender: TObject);
begin
	if fileexists(edit1.text) then
  begin
		button27.Visible:=true;
		msgtext.PlainText:=true;
		mode.visible:=false;
    statictext9.visible:=false;
    msgtext.ReadOnly:=false;
    msgtext.lines.clear;
		msgtext.Lines.BeginUpdate;
		pagecontrol1.ActivePageIndex:=2;
		msgtext.lines.LoadFromFile(edit1.text);
  	msgtext.text:=oemtoansistr(msgtext.text);
//    for cou:=0 to 5 do msgtext.lines.delete(0);
		colorating(msgtext,true);
		msgtext.Lines.EndUpdate;
	end;
end;

procedure TForm1.wrapClick(Sender: TObject);
begin
	if wrap.checked then rulestext.WordWrap:=true else rulestext.WordWrap:=false;

//m<20.03.03>
//  msgtext.setfocus;
//  msgtext.Lines.Move(msgtext.Lines.Count, 0);
//m</20.03.03>
end;

procedure TForm1.Button18Click(Sender: TObject);
var	adr:ftnadr;
begin
	if not moderat.AdrCorrect(edit5.text) then exit;
  adr:=Moderat.StrToFtn(Edit5.Text);
	application.MessageBox(pchar('Узел '+inttostr(adr.zone)+':'+inttostr(adr.region)+'/'+inttostr(adr.node)+' имеет '+modword2str(moderat.getallmod(edit5.text))+#13+'Сейчас получает '+modword2str(moderatorialvalue.itemindex)+#13+'Итого '+modword2str(moderat.getallmod(edit5.text)+moderatorialvalue.ItemIndex)),'Статистика узла',mb_ok+mb_iconinformation);
end;


procedure TForm1.create_reportClick(Sender: TObject);
var 	f:textfile;
	text,ttt,tmp2: string;
  cou:integer;
  list_:TStringlist;
  tmp:integer;
begin
if modlist.cells[0,1]='' then exit;
	if application.MessageBox(pchar('Сейчас будет создан отчет по нарушениям в эхе '+modarea.text+#13+'Продолжить?'),'Создание отчета нарушений',mb_yesno+mb_iconquestion)=id_no then exit;
	text:=ReadString('Fipsdir', 'fipsdir1','')+'\import\'+ModArea.text +'_'+datetostr(now())+'_report.imp';
	ttt:=text;
	AssignFile(f, text);
	rewrite(f);

  Moder.Area:=modarea.text;
  tmp:=1;
  tmp2:=readstring('area','area1','');
  while (moder.area<>tmp2) do
  begin
  	inc (tmp);
  	tmp2:=readstring('area','area'+inttostr(tmp),'');
  end;
  Writeln (f,'Area ' + Moder.Area); //Записываем в отчет имя эхи
	Writeln (f,'From ' + ReadString('Area', 'post'+inttostr(tmp), ''));
	Writeln (f,'FromAdr ' + ReadString('Area','Address'+inttostr(tmp),''));

  Writeln (f, 'To ' + 'All'); //Записываем в отчет адресата
  Writeln (f, strtooem('Subject Отчет по модераториалам '));
  Writeln (f,'');
	Writeln (f, '@BeginText');

	Text:='В области '+modarea.text+' на '+datetostr(now())+' действуют модераториалы:';
	text:=strtooem(Text);
	Writeln(f, Text);
	Writeln(f,'');
	list_:=TStringlist.create;
	list_.Clear;
	writeln(f,rpad_('-','-',75));
//Тут шапка таблицы
	writeln(f,strtooem(rpad_('Узел',' ',12)+rpad_('Hарушитель',' ',30)+rpad_('Hаграда',' ',11)+rpad_('Выставлена',' ',12)+rpad_('По',' ',11)));
	writeln(f,rpad_('-','-',75));
//В этом цикле добавляем в текст письма строки с нарушениями
	if moderat.getcount<>0 then
  begin
		for cou:=0 to moderat.getcount-1 do
  	Begin
			moderat.setpos(cou);
	    if (not moderat.getvalid) or (modarea.text<>moderat.getarea) then continue;
			list_.add(rpad_(moderat.getnodeaddress,' ',12)+rpad_(moderat.getname,' ',30)+rpad_(moderat.getmoderatorial,' ',11)+rpad_(datetostr(moderat.getdateofbegin),' ',12)+rpad_(datetostr(moderat.getdateofend),' ',11));
	  End;
  end;
//Самый тупой способ сортировки массива строк :-)))))
	list_.Sort;
	Text:=list_.text;
	text:=strtooem(Text);
//Ну и записываем отсортированный массив строк с нарушениями в письмо
	Writeln(f, Text);
	writeln(f,rpad_('-','-',75));
	list_.free;
	writeln(f);
	Writeln (f, 'Created by F.I.P.S. Moderator''s Tool (c) BIO&TMA');
	Writeln (f, '@EndText');
	Writeln (f, 'WriteMail');
	CloseFile (f);
  application.MessageBox(pchar('Создан файл импорта FIPS'+#13+ttt+#13+'с отчетом по модераториалам'),'Успешное создание отчета',mb_ok+mb_iconinformation);
End;

procedure TForm1.Edit4Click(Sender: TObject);
var	tmp2,tmp1,tmp:string;
  i1:integer;
  tmpstr:TStringList;
  Adr:string;
begin
if PageControl1.ActivePageIndex=0 then adr:=Edit5.Text;
if PageControl1.ActivePageIndex=1 then adr:=Modaddress.Text;

//Начало блока создание тела письма
	sourcetext.Clear;
// Обновление TEMPLATE
  i1:=1;
  tmp:=readstring('area','area'+inttostr(i1),'');
  If PageControl1.ActivePageIndex=0 then tmp2:=ComboBox1.Text;
  If PageControl1.ActivePageIndex=1 then tmp2:=modarea.Text;
  While ( (tmp<>tmp2) and (tmp<>'') ) do
  Begin
    inc (i1);
    tmp:=readstring('area','area'+inttostr(i1),'');
  End;

	if not fileexists(template) then
	begin
  	statusbar1.panels[0].text:='Файл шаблона не найден';
    exit;
  end;
  sourcetext.LoadFromFile(template);
  tmp:=sourcetext.text;
  repeat
		i1:=scanff(tmp,'@@',i1+1);
    if i1=0 then break;
		tmp1:=uppercase(copy(tmp,i1,length(macroses[0])));
    if tmp1=macroses[0] then
    Begin
      system.delete(tmp,i1,length(macroses[0]));
      system.insert(date1,tmp,i1);
    End;
		if tmp1=macroses[1] then
    Begin
      system.delete(tmp,i1,length(macroses[1]));
      system.insert(date2,tmp,i1);
    End;
		if tmp1=macroses[2] then
    Begin
      system.delete(tmp,i1,length(macroses[2]));
      system.insert(modword2str(moderatorialvalue.itemindex),tmp,i1);
    End;
		if tmp1=macroses[3] then
    Begin
      system.delete(tmp,i1,length(macroses[3]));
      system.insert(getaddresswopoint(edit5.text),tmp,i1);
    End;
		if tmp1=macroses[4] then
    Begin
      system.delete(tmp,i1,length(macroses[4]));
      system.insert(memo1.text,tmp,i1);
    End;
		if tmp1=macroses[5] then
    Begin
      system.delete(tmp,i1,length(macroses[5]));
      system.insert(edit3.text,tmp,i1);
    End;
		if tmp1=macroses[6] then
    Begin
      system.delete(tmp,i1,length(macroses[6]));
      system.insert(combobox1.text,tmp,i1);
    End;
		if tmp1=macroses[7] then
    Begin
      system.delete(tmp,i1,length(macroses[7]));
      system.insert(comod_name.text,tmp,i1);
    End;
		if tmp1=macroses[8] then
    Begin
      system.delete(tmp,i1,length(macroses[8]));
      system.insert(edit6.text,tmp,i1);
    End;
		if tmp1=macroses[9] then
    Begin
      system.delete(tmp,i1,length(macroses[9]));
      system.insert(edit4.text,tmp,i1);
    End;
		if tmp1=macroses[10] then
    Begin
      system.delete(tmp,i1,length(macroses[10]));
      system.insert(edit5.text,tmp,i1);
    End;
		if tmp1=macroses[11] then
    Begin
      system.delete(tmp,i1,length(macroses[11]));
      system.insert(datetostr(now()),tmp,i1);
    End;
		if tmp1=macroses[12] then
    Begin
      system.delete(tmp,i1,length(macroses[12]));
  ///////////////////////////////////////
      system.insert(modword2str(moderat.getallmod(adr)),tmp,i1);
    End;
		if tmp1=macroses[13] then
    Begin
      system.delete(tmp,i1,length(macroses[13]));
			if (fileexists(edit1.text)) then
			begin
				tmpstr:=TStringList.create;
				tmpstr.loadfromfile(edit1.text);
				if tmpstr.count>5 then
        begin
					tmpstr.Delete(0);
					tmpstr.Delete(0);
					tmpstr.Delete(0);
					tmpstr.Delete(0);
					tmpstr.Delete(0);
					tmpstr.Delete(0);
  			end;
	      system.insert(oemtoansistr(tmpstr.text),tmp,i1);
        tmpstr.free;
	         	End;
      if Not(fileexists(edit1.text)) then
      Begin
        tmpstr:=TStringList.create;
        tmpstr.Text:=' ';
        system.insert(oemtoansistr(tmpstr.text),tmp,i1);
        tmpstr.free;
      End;
    end;

		if tmp1=macroses[14] then
    Begin
			if (fileexists(edit1.text)) then
			begin
				tmpstr:=TStringList.create;
				try
					tmp2:=copy(tmp,i1+7,scanff(tmp,#13,i1)-(i1+7));
					tmpstr.loadfromfile(tmp2);
				except
					application.MessageBox(pchar('Не возможно вставить файл '+tmp2),'Ошибка вставки файла',mb_iconerror+mb_ok);
        end;
	      system.delete(tmp,i1,scanff(tmp,#13,i1)-i1);
	      system.insert(oemtoansistr(tmpstr.text),tmp,i1);
        tmpstr.free;
	         	End;
    end;


  until i1=0;
  sourcetext.text:=tmp;
end;

procedure TForm1.Button22Click(Sender: TObject);
begin
	cd.Color:=colfon;
  if not cd.execute then exit;
  msgtext.Color:=cd.color;
  colfon:=cd.color;
  ComboBox2Change(sender);
end;

procedure TForm1.ApplicationEvents1Hint(Sender: TObject);
begin
	statusbar1.Panels[0].text:=application.hint;
end;



procedure TForm1.Button7Click(Sender: TObject);
begin
	fd.font.assign(fontwin);
	fd.Execute;
	msgtext.Font.assign(fd.Font);
	fontwin.Assign(fd.Font);
  ComboBox2Change(sender);
end;

procedure TForm1.Button25Click(Sender: TObject);
begin
	fd.font.assign(zfmfodd);
	fd.Execute;
	msgtext.Font.assign(fd.Font);
	zfmfodd.Assign(fd.Font);
  ComboBox2Change(sender);
end;

procedure TForm1.Button23Click(Sender: TObject);
begin
	fd.font.assign(zfmforigin);
	fd.Execute;
	msgtext.Font.assign(fd.Font);
	zfmforigin.Assign(fd.Font);
  ComboBox2Change(sender);
end;

procedure TForm1.Button24Click(Sender: TObject);
begin
	fd.font.assign(zfmfeven);
	fd.Execute;
	msgtext.Font.assign(fd.Font);
	zfmfeven.Assign(fd.Font);
  ComboBox2Change(sender);
end;

procedure TForm1.Button26Click(Sender: TObject);
begin
	fd.font.assign(zfmftear);
	fd.Execute;
	msgtext.Font.assign(fd.Font);
	zfmftear.Assign(fd.Font);
  ComboBox2Change(sender);
end;

procedure TForm1.StaticText8Click(Sender: TObject);
begin
	if statictext8.BorderStyle=sbssingle then statictext8.BorderStyle:=sbsSunken else statictext8.BorderStyle:=sbssingle;
	rulselectChange(Sender);  
end;

procedure TForm1.moderatorialvalueClick(Sender: TObject);
var	adr:ftnadr;
	t,cou:word;
begin
  if moderat.AdrCorrect(edit5.text) then
    adr:=moderat.StrToFTN(edit5.text)
            else
    Exit;
	t:=0;
	if moderat.getcount<>0 then
  begin
		for cou:=0 to moderat.getcount-1 do
  	Begin
    	moderat.setpos(cou);
			if ((adr.Zone=moderat.getzone) and (adr.Region=moderat.getnet) and (adr.Node=moderat.getnode) and moderat.getvalid) then t:=t+moderat.getmoderatorialword;
  	End;
  end;
  label18.caption:='Было '+modword2str(t);
	label17.caption:='Итого '+modword2str(moderatorialvalue.itemindex+t);
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
Var
i: integer;
tmp:string;
begin
	i:=1;
	Repeat
		tmp:=readstring('area','area'+inttostr(i),'');
		inc(i);
  Until ((tmp='') or (tmp=ComboBox1.Text));
	Form1.comod_name.Text:=readstring('area','post'+inttostr(i-1),'');
	Form1.Edit6.Text:=readstring('area','address'+inttostr(i-1),'');
	template:=readstring('area','template'+inttostr(i-1),'');
     templatename.text:=template;
end;

procedure TForm1.Edit5Change(Sender: TObject);
Var
Adr: FTNAdr;
begin
	If (not(Moderat.AdrCorrect(Edit5.Text))) then exit;
	moderatorialvalueClick (sender);
  Adr:=Moderat.StrToFtn(Edit5.Text);
  If Adr.Point=0 then CheckBox3.Checked:=False
      else
          CheckBox3.Checked:=True;

end;

procedure TForm1.CheckBox5Click(Sender: TObject);
begin
	if CheckBox5.checked then msgtext.WordWrap:=true else msgtext.WordWrap:=false;
end;

procedure TForm1.rulselectChange(Sender: TObject);
var tmp:string;
begin
	rulestext.Lines.Clear;
  rulestext.Font.Assign(fontwin);
       	rulestext.Color:=colfon;
	rulestext.lines.BeginUpdate;
try
  If not (fileexists(extractfilepath(application.exename)+ '\rules\' + rulselect.items[rulselect.itemindex]+'.txt')) then
	Begin
		rulestext.Lines.Add ('Не найден файл правил: '+extractfilepath(application.exename)+ 'rules\' + rulselect.Text + '.txt');
		Exit;
   	End;
	tmp:=extractfilepath(application.exename)+ 'rules\' + rulselect.Text + '.txt';
	if not fileexists(tmp) then exit;
	rulestext.lines.LoadFromFile(tmp);
	If codepage.Itemindex=0 then rulestext.text:=OemToAnsiStr(rulestext.text);
  rulestext.font.Charset:=default_charset;
	if statictext8.BorderStyle=sbssunken then
	Begin
		coloratrib(rulestext);
		colorating(rulestext,true);
	End;
  if statictext8.BorderStyle<>sbssunken then colorating(rulestext,false);
finally
  rulestext.lines.EndUpdate;
end;
rulestext.SetFocus;

end;

procedure TForm1.StaticText9Click(Sender: TObject);
begin
	if statictext9.BorderStyle=sbssingle then statictext9.BorderStyle:=sbsSunken else statictext9.BorderStyle:=sbssingle;
	ComboBox2Change(sender);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
	od.InitialDir:=extractfilepath(application.exename);
	if not od.execute then exit;
	area_list.cells[3,area_list.row]:=od.filename;
end;
// Перенос данных для награждения
procedure TForm1.bTransClick(Sender: TObject);
var	tmpstr:TStringList;
begin
  If Modlist.Cells[0,1]='' then exit;
	pagecontrol1.ActivePageIndex:=0;
  combobox1.itemindex:=modarea.itemindex;
//  combobox1.text:=modarea.text;
	modadress:=ReadString('Area', 'Post'+inttostr(combobox1.itemindex+1), '');
	comod_name.Text:=modadress;
	modadress:=ReadString('Area', 'Address'+inttostr(combobox1.itemindex+1), '');
	Edit6.Text:=modadress;

	edit4.text:=modname.text;
  edit5.text:=modaddress.text;
  memo1.text:=modreason.text;
  edit3.text:=modcomment.text;
  moderatorialvalue.ItemIndex:=modmod.itemindex;
  datetimepicker1.date:=modbegin.date;
  datetimepicker2.date:=modend.date;
	combobox4.ItemIndex:=modcategory.ItemIndex;
  dontadd.checked:=true;
  checkbox4.Checked:=true;
	edit1.text:='textmsg.~tmp';
	tmpstr:=TStringList.create;
	tmpstr.Clear;
  moderat.gettext(tmpstr);
	try
		tmpstr.SaveToFile('textmsg.~tmp');
	except
		application.MessageBox('Ошибка сохранения текста письма','Ошибка',mb_iconerror+mb_ok);
  end;
  tmpstr.free;
  Edit4Click(sender);
end;

procedure TForm1.DontaddClick(Sender: TObject);
begin
	if dontadd.Checked then label17.Visible:=false else label17.Visible:=true;
end;

procedure TForm1.CheckBox6Click(Sender: TObject);
begin
	if CheckBox6.checked then templatetext.WordWrap:=true else templatetext.WordWrap:=false;
end;

procedure TForm1.Button28Click(Sender: TObject);
begin
	templatetext.seltext:=macroses[macrotemplate.itemindex];
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
	if not od.execute then exit;
  edit1.text:=od.FileName;
  SpeedButton2Click(sender);
end;

procedure TForm1.Button27Click(Sender: TObject);
begin
	try
		msgtext.text:=strtooem(msgtext.text);
		msgtext.Lines.SaveToFile(edit1.text);
		msgtext.text:=oemtoansistr(msgtext.text);
  except
		application.MessageBox('Ошибочное имя файла для сохранения. Измените на правильное на вкладке "Режим модераториала" в самом верхнем поле ввода','Ошибка сохранения',mb_ok+mb_iconerror);
  end;
	colorating(msgtext,true);
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
Var
tmp:string;

begin
Edit4Click (Sender);

If Not(FileExists(Edit1.Text)) then
   Begin
    Edit4.Text:='';
    Edit5.Text:='';
    Exit;
   End;

If Edit1.Text='' then exit;
  memo1.lines.clear;
  modreason.lines.Clear;
	FillAdress_Name(edit1.text);
	adress:=moderat.getstringaddress;
  Edit5.Text:=inttostr(moder.zone)+':'+inttostr(moder.net)+'/'+inttostr(moder.node);
	if moder.point<>0 then edit5.text:=edit5.text+'.'+inttostr(moder.point);
	Edit4.Text:=Moder.Disturber_name;
	If moder.point=0 then CheckBox3.Checked:=False else CheckBox3.Checked:=True;
  ComboBox1.itemindex:=ComboBox1.items.IndexOf(FillArea(edit1.text));
  ComboBox1Change (Sender);
	If fillArea(edit1.text)=('Вы не являетесь модератором ' + Moder.Area) Then

	Begin
		CheckBox1.Checked:=false;
		CheckBox2.Checked:=false;
		CheckBox3.Checked:=false;
		CheckBox4.Checked:=false;
		Edit4.Text:='';
		Edit5.Text:='';
    tmp:='Вы не являетесь модератором ' + Moder.Area;
    Application.MessageBox(pchar(tmp),'Ошибка',mb_ok+mb_iconerror);
  end;
  combobox2Change(Sender);
End;


procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
// При нажатии на Enter происходит занесение данных
If key=char(13) then SpeedButton2Click(Sender);
end;

procedure TForm1.templatetextChange(Sender: TObject);
var	cou:integer;
begin
//	templatetext.Lines.BeginUpdate;
	for cou:=1 to length(templatetext.text)-2 do
     if copy(templatetext.text,cou,2)='@@' then
     begin
     	templatetext.SelStart:=cou-1;
		templatetext.SelLength:=7;
    templatetext.SelAttributes.Style:=[fsbold];
    templatetext.SelLength:=0;
     end;
//	templatetext.Lines.EndUpdate;
end;

procedure TForm1.msgtextChange(Sender: TObject);
begin
//

end;

procedure TForm1.deleteallClick(Sender: TObject);
var	cou:integer;
f:textfile;
	text,ttt,tmp2: string;
  list_:TStringlist;
  tmp:integer;
  nums:integer;
label 1,2;
begin
if modlist.cells[0,1]='' then exit;
////////////////////////////////////////////////////////////////////////////////
// Создание отчета у кого кончился срок наказания                           ////
////////////////////////////////////////////////////////////////////////////////
	if application.MessageBox(pchar('Отчет по законченым наказаниям '+modarea.text),'Создание отчета окончания наказаний',mb_yesno+mb_iconquestion)=id_no then goto 1;
	text:=ReadString('Fipsdir', 'fipsdir1','')+'\import\'+ModArea.text +'_'+datetostr(now())+'_ENDreport.imp';
	ttt:=text;
	AssignFile(f, text);
	rewrite(f);

  Moder.Area:=modarea.text;
  tmp:=1;
  tmp2:=readstring('area','area1','');
  while (moder.area<>tmp2) do
  begin
  	inc (tmp);
  	tmp2:=readstring('area','area'+inttostr(tmp),'');
  end;
  Writeln (f,'Area ' + Moder.Area); //Записываем в отчет имя эхи
	Writeln (f,'From ' + ReadString('Area', 'post'+inttostr(tmp), ''));
	Writeln (f,'FromAdr ' + ReadString('Area','Address'+inttostr(tmp),''));

  Writeln (f, 'To ' + 'All'); //Записываем в отчет адресата
  Writeln (f, strtooem('Subject Отчет по истекшим срокам наказания '));
  Writeln (f,'');
	Writeln (f, '@BeginText');

	Text:='В области '+modarea.text+' на '+datetostr(now())+' закончился срок наказаний:';
	text:=strtooem(Text);
	Writeln(f, Text);
	Writeln(f,'');
	list_:=TStringlist.create;
	list_.Clear;
	writeln(f,rpad_('-','-',75));
//Тут шапка таблицы
	writeln(f,strtooem(rpad_('Узел',' ',12)+rpad_('Hарушитель',' ',30)+rpad_('Hаграда',' ',11)+rpad_('Выставлена',' ',12)+rpad_('По',' ',11)));
	writeln(f,rpad_('-','-',75));
//В этом цикле добавляем в текст письма строки с нарушениями
// переменная nums - количество закончившихся модераториалов
nums:=0;
	if moderat.getcount<>0 then
  begin
		for cou:=0 to moderat.getcount-1 do
  	Begin
			moderat.setpos(cou);
	    if (moderat.getvalid) or (modarea.text<>moderat.getarea) then continue;
      inc (nums);
			list_.add(rpad_(moderat.getnodeaddress,' ',12)+rpad_(moderat.getname,' ',30)+rpad_(moderat.getmoderatorial,' ',11)+rpad_(datetostr(moderat.getdateofbegin),' ',12)+rpad_(datetostr(moderat.getdateofend),' ',11));
	  End;
  end;
if nums=0 then
     begin
       	CloseFile (f);
        Deletefile(ReadString('Fipsdir', 'fipsdir1','')+'\import\'+ModArea.text +'_'+datetostr(now())+'_ENDreport.imp');
        Showmessage ('Закончившихся модераториалов нет');
        Exit;
     end;
//Самый тупой способ сортировки массива строк :-)))))
	list_.Sort;
	Text:=list_.text;
	text:=strtooem(Text);
//Ну и записываем отсортированный массив строк с нарушениями в письмо
	Writeln(f, Text);
	writeln(f,rpad_('-','-',75));
	list_.free;
	writeln(f);
	Writeln (f, 'Created by F.I.P.S. Moderator''s Tool (c) BIO&TMA');
	Writeln (f, '@EndText');
	Writeln (f, 'WriteMail');
	CloseFile (f);
  application.MessageBox(pchar('Создан файл импорта FIPS'+#13+ttt+#13+'с отчетом по закончившимся модераториалами'),'Успешное создание отчета',mb_ok+mb_iconinformation);
////////////////////////////////////////////////////////////////////////////////

1:	if application.MessageBox('Вы действительно хотите удалить все просроченные модераториалы?','Подтверждение удаления',mb_yesno+mb_iconquestion)=id_no then exit;
	cou:=0;
	repeat
		moderat.setpos(cou);
		if not moderat.getvalid then moderat.deletemod(cou) else inc(cou);
     if moderat.getcount=0 then goto 2;
     until cou>moderat.getcount;
2:	combobox2Change(Sender);

  //обновление MODLIST после чистки
modareaClick(sender);
end;

procedure TForm1.checkdeleteallClick(Sender: TObject);
var	progini:TINIFile;
begin
	progini:=tinifile.create(changefileext(application.ExeName,'.ini'));
	progini.WriteBool('DeleteAll','CheckDelete',checkdeleteall.checked);
     progini.free;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
	if not od.execute then exit;
  templatename.text:=od.FileName;
	TemplateNameExit(sender);
end;

procedure TForm1.TemplateNameExit(Sender: TObject);
begin
	if not fileexists(templatename.text) then
     begin
		application.MessageBox('Указанный файл шаблона не существует','Ошибка использования шаблона',mb_iconerror+mb_ok);
		exit;
     end;
	template:=templatename.text;
	if pos(template,templatename.items.text)=0 then templatename.items.add(templatename.text);
     while (templatename.Items.count>20) do templatename.items.Delete(0);
end;

procedure TForm1.TemplateNameKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then TemplateNameExit(Sender);
end;

//
// Пересохранение moderatorial.dat с учетом сортировки
//
Procedure ReSave (moderat:TModerator;mm:integer);
var i,j: integer;
 s1:string;
tmpstr:TStringList;

Begin
// mm:=moderat.getcount;
 If Form1.modlist.Cells[0,1]='' then exit;
 for i:=0 to mm-1 do
  Begin
    moderat.setpos(i);
//    moderat.gettext(tmpstr);
    moderat.deletemod(i);
  End;

// moderat.free;
// DeleteFile(extractfilepath(application.exename)+'moderator.dat');
//moderat:=TModerator.create(extractfilepath(application.exename)+'moderator.dat');

For i:=1 to mm do
 Begin
//  moderat.addmod;
  moderat.setpos(i-1);
  moderat.setarea(Form1.modlist.Cells[8,i]);
  moderat.setname(Form1.modlist.Cells[0,i]);
  moderat.setstringaddress(Form1.modlist.Cells[1,i]);
  moderat.setcomment(Form1.modlist.Cells[6,i]);
  moderat.setmoderatorialword(str2word(Form1.modlist.Cells[2,i]));
  moderat.setreason(Form1.modlist.Cells[3,i]);
  moderat.setdateofbegin(strtodate(Form1.modlist.Cells[4,i]));
  moderat.setdateofend(strtodate(Form1.modlist.Cells[5,i]));

  j:=1;
	While (Readstring('category','category'+inttostr(j),'')<>'') do
	Begin
		s1:=Readstring('category','category'+inttostr(j),'');
    if (s1=Form1.modlist.Cells[7,i]) then
      Begin
        moderat.setCategory(j-1);
      End;
		Inc (j);
	End;

 End;
//modareaclick(sender);

End;


//
// Сортировка по имени
//
procedure TForm1.N1Click(Sender: TObject);
var	i,j,mm:integer;
tmp,tmp2,s1:string;
t3:TStrings; // так...

//label a1;

begin
  for j:=0 to moderat.getcount-2 do
   Begin
		for i:=(j+1) to moderat.getcount-1 do
		Begin
       if (modlist.Cells[0,j+1]) > (modlist.Cells[0,i+1]) then
                    Begin
          // Все равно 10000 нарушителей не будет никогда
                     modlist.Rows[10000]:=modlist.Rows[j+1];
                     modlist.Rows[j+1]:=modlist.Rows[i+1];
                     modlist.Rows[i+1]:=modlist.Rows[10000];
                    End;
		End;
   End;
 mm:=moderat.getcount;
ReSave (moderat, mm);
// modareaclick(sender);
end;

procedure TForm1.N2Click(Sender: TObject);
var	i,j,mm:integer;
tmp,tmp2:string;
t3:TStrings; // так...

begin
  for j:=0 to moderat.getcount-2 do
   Begin
		for i:=(j+1) to moderat.getcount-1 do
		Begin
       if (modlist.Cells[1,j+1]) > (modlist.Cells[1,i+1]) then
                    Begin
          // Все равно 10000 нарушителей не будет никогда
                     modlist.Rows[10000]:=modlist.Rows[j+1];
                     modlist.Rows[j+1]:=modlist.Rows[i+1];
                     modlist.Rows[i+1]:=modlist.Rows[10000];
                    End;
		End;
   End;
mm:=moderat.getcount;
ReSave (moderat, mm);
// modareaclick(sender);
end;

procedure TForm1.N3Click(Sender: TObject);
var	i,j:integer;
tmp,tmp2:string;
t3:TStrings; // так...

begin
  for j:=0 to moderat.getcount-2 do
   Begin
		for i:=(j+1) to moderat.getcount-1 do
		Begin
       if (modlist.Cells[2,j+1]) > (modlist.Cells[2,i+1]) then
                    Begin
          // Все равно 10000 нарушителей не будет никогда
                     modlist.Rows[10000]:=modlist.Rows[j+1];
                     modlist.Rows[j+1]:=modlist.Rows[i+1];
                     modlist.Rows[i+1]:=modlist.Rows[10000];
                    End;
		End;
   End;
 ReSave (moderat,moderat.getcount);
// modareaclick(sender);
end;

procedure TForm1.N4Click(Sender: TObject);
var	i,j:integer;
tmp,tmp2:string;
t3:TStrings; // так...

begin
  for j:=0 to moderat.getcount-2 do
   Begin
		for i:=(j+1) to moderat.getcount-1 do
		Begin
       if (modlist.Cells[3,j+1]) > (modlist.Cells[3,i+1]) then
                    Begin
          // Все равно 10000 нарушителей не будет никогда
                     modlist.Rows[10000]:=modlist.Rows[j+1];
                     modlist.Rows[j+1]:=modlist.Rows[i+1];
                     modlist.Rows[i+1]:=modlist.Rows[10000];
                    End;
		End;
   End;
 ReSave (moderat,moderat.getcount);
// modareaclick(sender);
end;

procedure TForm1.N5Click(Sender: TObject);
var	i,j:integer;
tmp,tmp2:string;
t3:TStrings; // так...

begin
  for j:=0 to moderat.getcount-2 do
   Begin
		for i:=(j+1) to moderat.getcount-1 do
		Begin
       if (modlist.Cells[4,j+1]) > (modlist.Cells[4,i+1]) then
                    Begin
          // Все равно 10000 нарушителей не будет никогда
                     modlist.Rows[10000]:=modlist.Rows[j+1];
                     modlist.Rows[j+1]:=modlist.Rows[i+1];
                     modlist.Rows[i+1]:=modlist.Rows[10000];
                    End;
		End;
   End;
 ReSave (moderat,moderat.getcount);
// modareaclick(sender);
end;

procedure TForm1.N6Click(Sender: TObject);
var	i,j:integer;
tmp,tmp2:string;
t3:TStrings; // так...

begin
  for j:=0 to moderat.getcount-2 do
   Begin
		for i:=(j+1) to moderat.getcount-1 do
		Begin
       if (modlist.Cells[5,j+1]) > (modlist.Cells[5,i+1]) then
                    Begin
          // Все равно 10000 нарушителей не будет никогда
                     modlist.Rows[10000]:=modlist.Rows[j+1];
                     modlist.Rows[j+1]:=modlist.Rows[i+1];
                     modlist.Rows[i+1]:=modlist.Rows[10000];
                    End;
		End;
   End;
 ReSave (moderat,moderat.getcount);
// modareaclick(sender);
end;

procedure TForm1.N7Click(Sender: TObject);
var	i,j:integer;
tmp,tmp2:string;
t3:TStrings; // так...

begin
  for j:=0 to moderat.getcount-2 do
   Begin
		for i:=(j+1) to moderat.getcount-1 do
		Begin
       if (modlist.Cells[6,j+1]) > (modlist.Cells[6,i+1]) then
                    Begin
          // Все равно 10000 нарушителей не будет никогда
                     modlist.Rows[10000]:=modlist.Rows[j+1];
                     modlist.Rows[j+1]:=modlist.Rows[i+1];
                     modlist.Rows[i+1]:=modlist.Rows[10000];
                    End;
		End;
   End;
 ReSave (moderat,moderat.getcount);
// modareaclick(sender);
end;

procedure TForm1.N8Click(Sender: TObject);
var	i,j:integer;
tmp,tmp2:string;
t3:TStrings; // так...

begin
  for j:=0 to moderat.getcount-2 do
   Begin
		for i:=(j+1) to moderat.getcount-1 do
		Begin
       if (modlist.Cells[7,j+1]) > (modlist.Cells[7,i+1]) then
                    Begin
          // Все равно 10000 нарушителей не будет никогда
                     modlist.Rows[10000]:=modlist.Rows[j+1];
                     modlist.Rows[j+1]:=modlist.Rows[i+1];
                     modlist.Rows[i+1]:=modlist.Rows[10000];
                    End;
		End;
   End;
 ReSave (moderat,moderat.getcount);
// modareaclick(sender);
end;

procedure TForm1.N9Click(Sender: TObject);
var	i,j:integer;
tmp,tmp2:string;
t3:TStrings; // так...

begin
  for j:=0 to moderat.getcount-2 do
   Begin
		for i:=(j+1) to moderat.getcount-1 do
		Begin
       if (modlist.Cells[8,j+1]) > (modlist.Cells[8,i+1]) then
                    Begin
          // Все равно 10000 нарушителей не будет никогда
                     modlist.Rows[10000]:=modlist.Rows[j+1];
                     modlist.Rows[j+1]:=modlist.Rows[i+1];
                     modlist.Rows[i+1]:=modlist.Rows[10000];
                    End;
		End;
   End;
 ReSave (moderat,moderat.getcount);
// modareaclick(sender);
end;



end.
