unit modclass;
interface
uses windows,classes,sysutils, comctrls,graphics;


type	FTNAdr=record
	Adr: string;
	Zone,
	Region,
     Node,
	Point: word;
end;


{$a-}
type TModeratorial=record
     area: string[80]; // Эха с наpушением...
	version:word; //Версия файла
     zone:word; //зона наpушителя
     net:word; //сеть наpушителя
     node:word; //узел наpушителя
     point:word; //поинт наpушителя
     Disturber_Name:string[150]; //имя и фамилия наpушителя
     comment:string[250]; //комментаpий
     moderatorial:word; //символ наказания *,+,!
     dateofbegin:tdatetime; //Дата получения модеpатоpиала
     dateofend:tdatetime; //Дата окончания действия
     reason:string[250]; //Основание (пункт pулесов)
                   // Выбиpается из combobox - ПРИЧИHА,
                   // можно довавлсять вpучную в mod.ini
     Category: integer; // Категоpия наpушителя...
     Offset:integer;    // Смещение и длина
     TextLength:integer;// сохраненного фрагмента письма...
     reserve:integer;  //На будущее
end;

function StrToOem(const AnsiStr: string): string;
function OemToAnsiStr(const OemStr: string): string;
function modword2str(aparam:word):string;
function fmodword2str(aparam:word):string; //Возвращает награду с фиксированной длиной строки (12 символов) для вставки в таблицу
function RPad_(Source: string;const X:Char;Count:Integer):string;
function getaddresswopoint(Addr:string):string;


type TModerator = class(TObject)
private
	modfile:TFileStream;
     filename:string;
     curpos:integer;
	vmod:tmoderatorial;
     msgfile:TFileStream;
     msgfilename:string;
protected
	function Get_Zone(Adr: string; Def: word): word;
	function Get_Net(Adr: string; Def: word): word;
	function Get_Node(Adr: string): word;
	function Get_Point(Adr: string): word;

public
	function AdrCorrect(Adr: string): boolean;
	function StrToFTN(Adr: string): FTNAdr;

published
	constructor create(filename_:string);
	destructor free;
//Функции получения данных

	function getallmod(AParam:String): word;
     function getmodfilename:string;
     function getpos:integer;
	function getcount:integer;
     function getarea:string;
     function getzone:word;
     function getnet:word;
     function getnode:word;
     function getpoint:word;
     function getName:string; //имя и фамилия наpушителя
     function getcomment:string;
     function getmoderatorial:string;
	function getmoderatorialword:word;
     function getdateofbegin:tdatetime;
     function getdateofend:tdatetime;
     function getreason:string;
     function getCategory: integer; // Категоpия наpушителя...
     function getstringaddress:string;
	function getversion: integer; // Версия файла модераториалов
	function getvalid:boolean; //Действует ли награда
	function getoffset:integer;
     function gettextlength:integer;
	procedure gettext(var AParam:TStringlist);
	function getnodeaddress:string;
     //Процедуры установки
	procedure setoffset(AParam:integer);
	procedure settextlength(AParam:integer);
	procedure setpos(AParam:integer);
	procedure setmod(AParam:TModeratorial);
	procedure setarea(AParam:string); // Эха с наpушением...
       	procedure setzone(AParam:word); //зона наpушителя
	procedure setnet(AParam:word); //сеть наpушителя
	procedure setnode(AParam:word); //узел наpушителя
	procedure setpoint(AParam:word); //поинт наpушителя
	procedure setName(AParam:string); //имя и фамилия наpушителя
	procedure setcomment(AParam:string); //комментаpий
//	procedure setmoderatorial(AParam:string); //символ наказания *,+,!
	procedure setmoderatorialword(AParam:word); //символ наказания *,+,!
	procedure setdateofbegin(AParam:tdatetime); //Дата получения модеpатоpиала
	procedure setdateofend(AParam:tdatetime); //Дата окончания действия
	procedure setreason(AParam:string); //Основание (пункт pулесов)
	procedure setCategory(AParam: integer); // Категоpия наpушителя...
	procedure setstringaddress(AParam:string);
//	procedure setvalid(AParam:boolean); //Установить валидность наказания True - действует
	procedure addtext(AParam:TStringList);
     procedure addmod;
     procedure deletemod(AParam:integer);
	procedure renume;

end;


implementation

function getaddresswopoint(Addr:string):string;
Begin
	result:=addr;
     if pos('.',addr)<1 then exit;
     result:=copy(addr,1,pos('.',addr)-1);
End;


function modword2str(aparam:word):string;
begin
	case aparam of
	     0:result:='[ ]';
	     1:result:='[*]';
     	2:result:='[*][*]';
	     3:result:='[+]';
     	4:result:='[+][*]';
	     5:result:='[+][*][*]';
     	6:result:='[+][+]';
	     7:result:='[+][+][*]';
     	8:result:='[+][+][*][*]';
	     9:result:='[!]';
          else result:='Больше [!]';
     end;
end;

function fmodword2str(aparam:word):string;
begin
	case aparam of
	     0:result:='[ ]      ';
	     1:result:='[*]      ';
     	2:result:='[*][*]      ';
	     3:result:='[+]      ';
     	4:result:='[+][*]      ';
	     5:result:='[+][*][*]   ';
     	6:result:='[+][+]      ';
	     7:result:='[+][+][*]   ';
     	8:result:='[+][+][*][*]';
	     9:result:='[!]      ';
       else result:='Больше[!]   ';
     end;
end;


function OemToAnsiStr(const OemStr: string): string;
begin
	SetLength(Result, Length(OemStr));
	if Length(Result) > 0 then
	 OemToCharBuff(PChar(OemStr), PChar(Result), Length(Result));
end;


function StrToOem(const AnsiStr: string): string;
begin
	SetLength(Result, Length(AnsiStr));
	if Length(Result) > 0 then
      CharToOemBuff(PChar(AnsiStr), PChar(Result), Length(Result));
end;


const curver:word=1;


function tmoderator.getallmod(AParam:String): word;
var	cou1,cou,t:integer;
	adr:ftnadr;
begin
	cou1:=getpos;
     if AdrCorrect(AParam) then adr:=StrToFTN(AParam);
	t:=0;
	for cou:=0 to getcount-1 do
     Begin
          setpos(cou);
		if ((adr.Zone=getzone) and (adr.Region=getnet) and (adr.Node=getnode) and getvalid) then t:=t+getmoderatorialword;
     End;
	setpos(cou1);
	result:=t;
end;



function tmoderator.Get_Zone(Adr: string; Def: word): word;
begin
if Pos(':',Adr)>0 then result:=StrToInt(Copy(Adr,1,Pos(':',Adr)-1))
  else result:=Def;
end;

function tmoderator.Get_Net(Adr: string; Def: word): word;
begin
if Pos(':',Adr)>0 then Delete(Adr,1,Pos(':',Adr));
if Pos('/',Adr)>0 then result:=StrToInt(Copy(Adr,1,Pos('/',Adr)-1))
  else result:=Def;
end;

function tmoderator.Get_Node(Adr: string): word;
begin
if Pos('/',Adr)>0 then Delete(Adr,1,Pos('/',Adr));
if Pos('.',Adr)>0 then result:=StrToInt(Copy(Adr,1,Pos('.',Adr)-1))
  else result:=StrToInt(Adr);
end;

function tmoderator.Get_Point(Adr: string): word;
begin
if Pos('.',Adr)>0 then result:=StrToInt(Copy(Adr,Pos('.',Adr)+1,Length(Adr)
-Pos('.',Adr)))
  else result:=0;
end;

// Изменил Илья 23.03.2003
// Если был адрес вида 2:5015/113.
// с точкой на конце, то функция возвращала, что адрес
// корректный...
function tmoderator.AdrCorrect(Adr: string): boolean;
  var k: byte;
begin
 result:=True;
 if Adr='' then result:=False;
 if copy(adr,1,1)='0' then exit;
 if Pos(':',Adr)>1 then
	begin
    for k:=1 to (Pos(':',Adr)-1) do
     if not (Adr[k] in ['0'..'9']) then result:=False;
    Delete(Adr,1,Pos(':',Adr));
   end;
 if Pos('/',Adr)>1 then
   begin
	 for k:=1 to (Pos('/',Adr)-1) do
     if not (Adr[k] in ['0'..'9']) then result:=False;
    Delete(Adr,1,Pos('/',Adr));
   end
             else
   Result:=false;
 if Pos('.',Adr)>1 then
   begin
    for k:=1 to (Pos('.',Adr)-1) do
     if not (Adr[k] in ['0'..'9']) then result:=False;
    Delete(Adr,1,Pos('.',Adr));
   end;
 if Length(Adr)>0 then
 for k:=1 to Length(Adr) do
 if not (Adr[k] in ['0'..'9']) then result:=False;

 If Length(adr)=0 then Result:=False;
end;

function tmoderator.StrToFTN(Adr: string): FTNAdr;
var myadr:ftnadr;
begin
if adr='' then exit;
  Result.Zone:=Get_Zone(Adr,MyAdr.Zone);
  Result.Region:=Get_Net(Adr,MyAdr.Region);
  Result.Node:=Get_Node(Adr);
  Result.Point:=Get_Point(Adr);
  Result.Adr:=IntToStr(Result.Zone)+':'+IntToStr(Result.Region)+'/'+IntToStr(Result.Node);
	if Result.Point>0 then Result.Adr:=Result.Adr+'.'+IntToStr(Result.Point);
end;


constructor tmoderator.create(filename_:string);
Begin
	filename:=filename_;
	curpos:=0;
     if fileexists(filename) then
        modfile:=tfilestream.create(filename,fmopenreadwrite+fmShareDenyWrite)
                    else
        modfile:=tfilestream.create(filename,fmcreate);
     msgfilename:=changefileext(filename_,'.mst');
     if fileexists(msgfilename) then
        msgfile:=tfilestream.create(msgfilename,fmopenreadwrite+fmShareDenyWrite)
                    else
        msgfile:=tfilestream.create(msgfilename,fmcreate);

End;

destructor tmoderator.free;
Begin
	modfile.free;
     msgfile.free;
End;

function tmoderator.getcount:integer;
Begin
	result:=modfile.size div sizeof(TModeratorial);
End;

function tmoderator.getmodfilename:string;
Begin
	result:=filename;
End;

function tmoderator.getpos:integer;
Begin
	result:=curpos;
End;


function tmoderator.getvalid:boolean; //Действует ли награда
Begin
	modfile.seek(curpos*sizeof(vmod),0);
     modfile.read(vmod,sizeof(vmod));
	modfile.seek(curpos*sizeof(vmod),0);
	if vmod.dateofend<now() then result:=false else result:=true;
End;

procedure tmoderator.gettext(var AParam:TStringlist);
var	tmpstream:TMemoryStream;

Begin
	modfile.seek((curpos-1)*sizeof(vmod),0);
     modfile.read(vmod,sizeof(vmod));
	modfile.seek((curpos-1)*sizeof(vmod),0);
       	tmpstream:=TMemoryStream.Create;
	try
		try
		     msgfile.seek(vmod.offset,0);
			aparam.text;
	     	tmpstream.CopyFrom(msgfile,vmod.textlength-1);
 			aparam.text;
			tmpstream.seek(0,0);
		     AParam.LoadFromStream(tmpstream);
	     except
			aparam.clear;
          	aparam.Add('Невозможно прочитать текст письма');
	          aparam.Add('Параметры: длина текста='+inttostr(vmod.textlength)+' , смещение='+inttostr(vmod.offset));
			aparam.text:=strtooem(aparam.text);
			exit;
	     end;
     finally
			tmpstream.free;
     end;
End;


procedure tmoderator.renume;
var	posit,cou:integer;
Begin
	posit:=0;
     for cou:=0 to getcount-1 do
	begin
     	modfile.seek(cou*sizeof(vmod),0);
		modfile.Read(vmod,sizeof(vmod));
          vmod.Offset:=posit;
          posit:=posit+vmod.textlength;
     	modfile.seek(cou*sizeof(vmod),0);
		modfile.write(vmod,sizeof(vmod));
	end;

End;

procedure tmoderator.addtext(AParam:TStringList);
var	tmpstream:TMemoryStream;
Begin
	tmpstream:=tmemorystream.create;
	tmpstream.seek(0,0);
     aparam.savetostream(tmpstream);
	msgfile.seek(0,sofromend);
	modfile.seek(curpos*sizeof(vmod),0);
     modfile.read(vmod,sizeof(vmod));
     vmod.Offset:=msgfile.Position;
	vmod.TextLength:=tmpstream.size;
	vmod.version:=curver;
	tmpstream.seek(0,0);
	msgfile.copyfrom(tmpstream,tmpstream.size);
     modfile.Seek(curpos*sizeof(vmod),0);
     modfile.Write(vmod,sizeof(vmod));
     tmpstream.free;
End;


function tmoderator.getarea:string;
Begin
	modfile.seek(curpos*sizeof(vmod),0);
     modfile.read(vmod,sizeof(vmod));
	modfile.seek(curpos*sizeof(vmod),0);
	result:=vmod.area;
End;

function tmoderator.getzone:word;
Begin
	modfile.seek(curpos*sizeof(vmod),0);
     modfile.read(vmod,sizeof(vmod));
	modfile.seek(curpos*sizeof(vmod),0);
	result:=vmod.zone;
End;

function tmoderator.getnet:word;
Begin
	modfile.seek(curpos*sizeof(vmod),0);
     modfile.read(vmod,sizeof(vmod));
	modfile.seek(curpos*sizeof(vmod),0);
	result:=vmod.net;
End;

function tmoderator.getnode:word;
Begin
	modfile.seek(curpos*sizeof(vmod),0);
     modfile.read(vmod,sizeof(vmod));
	modfile.seek(curpos*sizeof(vmod),0);
	result:=vmod.node;
End;

function tmoderator.getpoint:word;
Begin
	modfile.seek(curpos*sizeof(vmod),0);
     modfile.read(vmod,sizeof(vmod));
	modfile.seek(curpos*sizeof(vmod),0);
	result:=vmod.point;
End;

function tmoderator.getName:string; //имя и фамилия наpушителя
Begin
	modfile.seek(curpos*sizeof(vmod),0);
     modfile.read(vmod,sizeof(vmod));
	modfile.seek(curpos*sizeof(vmod),0);
	result:=vmod.Disturber_Name;
End;

function tmoderator.getcomment:string;
Begin
	modfile.seek(curpos*sizeof(vmod),0);
     modfile.read(vmod,sizeof(vmod));
	modfile.seek(curpos*sizeof(vmod),0);
	result:=vmod.comment;
End;

function tmoderator.getmoderatorial:string;
Begin
	modfile.seek(curpos*sizeof(vmod),0);
     modfile.read(vmod,sizeof(vmod));
	modfile.seek(curpos*sizeof(vmod),0);
	case vmod.moderatorial of
	     0:result:='[ ]';
	     1:result:='[*]';
     	2:result:='[*][*]';
	     3:result:='[+]';
     	4:result:='[+][*]';
	     5:result:='[+][*][*]';
     	6:result:='[+][+]';
	     7:result:='[+][+][*]';
     	8:result:='[+][+][*][*]';
	     9:result:='[!]';
     end;
End;

function tmoderator.getmoderatorialword:word;
Begin
	modfile.seek(curpos*sizeof(vmod),0);
     modfile.read(vmod,sizeof(vmod));
	modfile.seek(curpos*sizeof(vmod),0);
	result:=vmod.moderatorial;
end;

function tmoderator.getdateofbegin:tdatetime;
Begin
	modfile.seek(curpos*sizeof(vmod),0);
     modfile.read(vmod,sizeof(vmod));
	modfile.seek(curpos*sizeof(vmod),0);
	result:=vmod.dateofbegin;
End;

function tmoderator.getdateofend:tdatetime;
Begin
	modfile.seek(curpos*sizeof(vmod),0);
     modfile.read(vmod,sizeof(vmod));
	modfile.seek(curpos*sizeof(vmod),0);
	result:=vmod.dateofend;
End;

function tmoderator.getreason:string;
Begin
	modfile.seek(curpos*sizeof(vmod),0);
     modfile.read(vmod,sizeof(vmod));
	modfile.seek(curpos*sizeof(vmod),0);
	result:=vmod.reason;
End;


function tmoderator.getCategory: integer; // Категоpия наpушителя...
Begin
	modfile.seek(curpos*sizeof(vmod),0);
     modfile.read(vmod,sizeof(vmod));
	modfile.seek(curpos*sizeof(vmod),0);
	result:=vmod.Category;
End;

function tmoderator.getversion: integer; // Версия файла модераториалов
Begin
	modfile.seek(curpos*sizeof(vmod),0);
     modfile.read(vmod,sizeof(vmod));
	modfile.seek(curpos*sizeof(vmod),0);
	result:=vmod.version;
End;

function tmoderator.getoffset:integer;
Begin
	modfile.seek(curpos*sizeof(vmod),0);
     modfile.read(vmod,sizeof(vmod));
	modfile.seek(curpos*sizeof(vmod),0);
	result:=vmod.offset;
End;

function tmoderator.gettextlength:integer;
Begin
	modfile.seek(curpos*sizeof(vmod),0);
     modfile.read(vmod,sizeof(vmod));
	modfile.seek(curpos*sizeof(vmod),0);
	result:=vmod.textlength;
End;



function tmoderator.getstringaddress:string;
var	s:string;
Begin
	s:=IntToStr(vmod.Zone)+':'+IntToStr(vmod.net)+'/'+IntToStr(vmod.Node);
	if vmod.Point>0 then s:=s+'.'+IntToStr(vmod.Point);
     result:=s;
End;

function tmoderator.getnodeaddress:string;
var	s:string;
Begin
	s:=IntToStr(vmod.Zone)+':'+IntToStr(vmod.net)+'/'+IntToStr(vmod.Node);
     result:=s;
End;


//Процедуры установки
procedure tmoderator.setarea(AParam:string); // Эха с наpушением...
Begin
     modfile.Seek(curpos*sizeof(vmod),0);
     modfile.read(vmod,sizeof(vmod));
     vmod.area:=AParam;
	vmod.version:=curver;
     modfile.Seek(curpos*sizeof(vmod),0);
     modfile.Write(vmod,sizeof(vmod));
End;

procedure tmoderator.setmod(AParam:tmoderatorial); //
Begin
     modfile.Seek(curpos*sizeof(vmod),0);
     modfile.Write(aparam,sizeof(aparam));
End;

procedure tmoderator.setzone(AParam:word); //зона наpушителя
Begin
     modfile.Seek(curpos*sizeof(vmod),0);
     modfile.read(vmod,sizeof(vmod));
     vmod.zone:=AParam;
	vmod.version:=curver;
     modfile.Seek(curpos*sizeof(vmod),0);
     modfile.Write(vmod,sizeof(vmod));
End;

procedure tmoderator.setnet(AParam:word); //сеть наpушителя
Begin
     modfile.Seek(curpos*sizeof(vmod),0);
     modfile.read(vmod,sizeof(vmod));
     vmod.net:=AParam;
	vmod.version:=curver;
     modfile.Seek(curpos*sizeof(vmod),0);
     modfile.Write(vmod,sizeof(vmod));
End;

procedure tmoderator.setnode(AParam:word); //узел наpушителя
Begin
     modfile.Seek(curpos*sizeof(vmod),0);
     modfile.read(vmod,sizeof(vmod));
     vmod.node:=AParam;
	vmod.version:=curver;
     modfile.Seek(curpos*sizeof(vmod),0);
     modfile.Write(vmod,sizeof(vmod));
End;

procedure tmoderator.setpoint(AParam:word); //поинт наpушителя
Begin
     modfile.Seek(curpos*sizeof(vmod),0);
     modfile.read(vmod,sizeof(vmod));
     vmod.point:=AParam;
	vmod.version:=curver;
     modfile.Seek(curpos*sizeof(vmod),0);
     modfile.Write(vmod,sizeof(vmod));
End;

procedure tmoderator.setoffset(AParam:integer);
Begin
     modfile.Seek(curpos*sizeof(vmod),0);
     modfile.read(vmod,sizeof(vmod));
     vmod.offset:=AParam;
	vmod.version:=curver;
     modfile.Seek(curpos*sizeof(vmod),0);
     modfile.Write(vmod,sizeof(vmod));
End;

procedure tmoderator.settextlength(AParam:integer);
Begin
     modfile.Seek(curpos*sizeof(vmod),0);
     modfile.read(vmod,sizeof(vmod));
     vmod.textlength:=AParam;
	vmod.version:=curver;
     modfile.Seek(curpos*sizeof(vmod),0);
     modfile.Write(vmod,sizeof(vmod));
End;




procedure tmoderator.setName(AParam:string); //имя и фамилия наpушителя
Begin
     modfile.Seek(curpos*sizeof(vmod),0);
     modfile.read(vmod,sizeof(vmod));
     vmod.Disturber_Name:=AParam;
	vmod.version:=curver;
     modfile.Seek(curpos*sizeof(vmod),0);
     modfile.Write(vmod,sizeof(vmod));
End;

procedure tmoderator.setcomment(AParam:string); //комментаpий
Begin
     modfile.Seek(curpos*sizeof(vmod),0);
     modfile.read(vmod,sizeof(vmod));
     vmod.comment:=AParam;
	vmod.version:=curver;
     modfile.Seek(curpos*sizeof(vmod),0);
     modfile.Write(vmod,sizeof(vmod));
End;

procedure tmoderator.setmoderatorialword(AParam:word); //символ наказания *,+,!
Begin
     modfile.Seek(curpos*sizeof(vmod),0);
     modfile.read(vmod,sizeof(vmod));
     vmod.moderatorial:=AParam;
	vmod.version:=curver;
     modfile.Seek(curpos*sizeof(vmod),0);
     modfile.Write(vmod,sizeof(vmod));
End;
{
procedure tmoderator.setmoderatorial(AParam:string); //символ наказания *,+,!
Begin
     modfile.Seek(curpos*sizeof(vmod),0);
     modfile.read(vmod,sizeof(vmod));
     vmod.moderatorial:=AParam;
	vmod.version:=curver;
     modfile.Seek(curpos*sizeof(vmod),0);
     modfile.Write(vmod,sizeof(vmod));
End;
}
procedure tmoderator.setdateofbegin(AParam:tdatetime); //Дата получения модеpатоpиала
Begin
     modfile.Seek(curpos*sizeof(vmod),0);
     modfile.read(vmod,sizeof(vmod));
     vmod.dateofbegin:=AParam;
	vmod.version:=curver;
     modfile.Seek(curpos*sizeof(vmod),0);
     modfile.Write(vmod,sizeof(vmod));
End;

procedure tmoderator.setdateofend(AParam:tdatetime); //Дата окончания действия
Begin
     modfile.Seek(curpos*sizeof(vmod),0);
     modfile.read(vmod,sizeof(vmod));
     vmod.dateofend:=AParam;
	vmod.version:=curver;
     modfile.Seek(curpos*sizeof(vmod),0);
     modfile.Write(vmod,sizeof(vmod));
End;

procedure tmoderator.setreason(AParam:string); //Основание (пункт pулесов)
Begin
     modfile.Seek(curpos*sizeof(vmod),0);
     modfile.read(vmod,sizeof(vmod));
     vmod.reason:=AParam;
	vmod.version:=curver;
     modfile.Seek(curpos*sizeof(vmod),0);
     modfile.Write(vmod,sizeof(vmod));
End;

procedure tmoderator.setCategory(AParam: integer); // Категоpия наpушителя...
Begin
     modfile.Seek(curpos*sizeof(vmod),0);
     modfile.read(vmod,sizeof(vmod));
     vmod.category:=AParam;
	vmod.version:=curver;
     modfile.Seek(curpos*sizeof(vmod),0);
     modfile.Write(vmod,sizeof(vmod));
End;

procedure tmoderator.setstringaddress(AParam:string);
var	a:ftnadr;
Begin
     modfile.Seek(curpos*sizeof(vmod),0);
     modfile.read(vmod,sizeof(vmod));
	if not adrcorrect(aparam) then exit;
	a:=StrToFTN(Aparam);
	vmod.zone:=a.Zone;
	vmod.net:=a.Region;
     vmod.node:=a.node;
     vmod.point:=a.point;
	vmod.version:=curver;
     modfile.Seek(curpos*sizeof(vmod),0);
     modfile.Write(vmod,sizeof(vmod));
End;


procedure tmoderator.addmod;
Begin
	modfile.seek(0,sofromend);
     modfile.write(vmod,sizeof(vmod));
     modfile.seek(-sizeof(vmod),sofromend);
     curpos:=modfile.size div sizeof(vmod)-1;
End;

procedure tmoderator.deletemod(AParam:integer);
var	cou:integer;
	modd:tmoderatorial;
  tmpstream:tmemorystream;
Begin

	tmpstream:=tmemorystream.create;
	tmpstream.seek(0,0);
     modfile.Seek(aparam*sizeof(vmod),0);
     modfile.read(vmod,sizeof(vmod));
     msgfile.seek(0,0);
     if aparam>0 then tmpstream.copyfrom(msgfile,vmod.offset);
     if (getcount-1)<>aparam then
	begin
	     msgfile.seek(vmod.offset+vmod.textlength,0);
     	tmpstream.copyfrom(msgfile,msgfile.size-vmod.textlength-vmod.offset);
	end;
	msgfile.free;
     deletefile(msgfilename);
     msgfile:=TFilestream.create(msgfilename,fmcreate);
	tmpstream.seek(0,0);
	msgfile.CopyFrom(tmpstream,tmpstream.size);
	tmpstream.size:=0;
	tmpstream.seek(0,0);
     modfile.seek(0,0);
     curpos:=0;
     for cou:=0 to getcount-1 do
     Begin
		modfile.Read(modd,sizeof(vmod));
       if cou=aparam then continue;
       tmpstream.Write(modd,sizeof(vmod));
     End;
	modfile.size:=0;
	tmpstream.seek(0,0);
     modfile.CopyFrom(tmpstream,tmpstream.size);
	renume;
     curpos:=0;
     tmpstream.free;
End;

procedure tmoderator.setpos(AParam:integer);
Begin
	modfile.seek(aparam*sizeof(vmod),0);
     modfile.read(vmod,sizeof(vmod));
	modfile.seek(aparam*sizeof(vmod),0);
     curpos:=aparam;
End;



procedure FillCnt(var Source:AnsiString;const Index,Cnt:Integer;X:Char);

  {Fill Source with Cnt characters (X fill char.) starting at index location.
   Includes range checking to prevent memory corruption.}

begin
  UniqueString(Source);
  asm
    Push  ESI

    Mov   EAX,Source
    Or    EAX,EAX
    Jz    @Done
    Mov   EDI,[EAX]     //Source address
    Or    EDI,EDI
    Jz    @Done
    Mov   EDX,Index     //start location
    Or    EDX,EDX
    Jz    @Done

    Mov   ECX,[EDI-4]      //source length
    Jecxz @Done      //Abort on null string

    Dec   EDX        //zero based index position
    Sub   ECX,EDX       //remaining length
    Jz    @Done
    Js    @Done      //abort if Index>Length
    Add   EDI,EDX       //start at the given offset

    Mov   EAX,Cnt       //fill count
    Cmp   ECX,EAX       //less than remaining length ?
    Jbe   @L1        //yes, then skip
    Mov   ECX,EAX       //use fill count
@L1:
    Mov   AL,X       //the fill character
    Cld           //make sure we go forward
    Repnz Stosb      //do the fill
@Done:
    Pop   EDI
  end;
end;


procedure FillStr(var Source:AnsiString;const Index:Integer;X:Char);

  {Fill Source starting at Index location using Char X. Includes range
   checking to prevent memory corruption.}

begin
  FillCnt(Source,Index,Length(Source),X);
end;


function RPad_(Source: string;const X:Char;Count:Integer):string;
  {Append characters (X) to right of string as required to increase
   length to Count.}
var
  s:string;
  I:Integer;
begin
   s:=source;
  if Length(Source)<Count then
  begin
    I:=Length(Source)+1;
    SetLength(S,Count);
    FillStr(S,I,X);
  end;
  result:=s;
end;




end.
