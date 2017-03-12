unit paintfidotext;

interface
uses windows,classes,sysutils, comctrls,graphics;

function ScanFF(const Source,Search:AnsiString;Start:Integer):Integer;
procedure colorating(sender:TRichEdit; showkludge:boolean);
procedure coloratrib(sender:trichedit);
function GetFileVersion(const FileName: string): string;
var zfmftear,fontwin,zfmfeven,zfmfodd,zfmfcludge,zfmforigin,zfmfwin,zfmfdos:TFont;

implementation
const   begin_bold:shortstring='\b ';
	end_bold:shortstring='\b0 ';
	begin_italic:shortstring='\i ';
	end_italic:shortstring='\i0 ';
	begin_underline:shortstring='\ul ';
	end_underline:shortstring='\ul0 ';
	begin_inverse:shortstring='\cf1 ';
	end_inverse:shortstring='\cf0 ';

function ScanC(const Source:AnsiString;X:Char;Start:Integer):Integer;

  {Forward scan from Start looking for next matching char. (X). This
   and the complementary ScanB (backwards scan) are optimized routines
   providing the fastest possible case sensitive scan for a single char..

   Returns: Position where/if found; otherwise, 0}

  asm
    Push  EDI
    Push  ESI
    Push  EBX

    Or    EAX,EAX       //invalid pointer ?
    Jz    @Done
    Mov   EDI,EAX
    Xor   EAX,EAX

    Mov   EBX,[EDI-4]   //string length
    Cmp   ECX,EBX       //start beyond end ?
    Ja    @Done         //yes, then abort
    Dec   ECX           //zero based start
    Js    @Done
    Mov   EAX,EDX       //get search character
    Mov   ESI,EDI       //save start offset
    Add   EDI,ECX
    Sub   EBX,ECX
    Mov   ECX,EBX
    And   ECX,3
    Jz    @Skip

    Cld
    repnz scasb         //scan odd bytes first
    Jz    @OK
@Skip:
    Mov   ECX,EBX
    Shr   ECX,2
    Jz    @Bail

    Mov   AH,AL         //use EBX as mask register
    Mov   BX,AX
    Shl   EBX,16
    Mov   BX,AX
@Top:
    Mov   EAX,[EDI]
    Add   EDI,4
    Xor   EAX,EBX

    Lea   EDX,[EAX-$01010101]       //subtract 1 from each byte
    Not   EAX                       //invert all bytes
    And   EDX,EAX                   //and these two
    And   EDX,$80808080             //test all sign bits
    Jnz   @GotIt

    Dec   ECX
    Jnz   @Top
@Bail:
    Xor   EAX,EAX
    Jmp   @Done
@GotIt:
    Test  EDX,$8080               //test first two bytes
    Jz    @L1
    Sub   EDI,2
    Shl   EDX,16
@L1:
    Shl   EDX,9
@OK:
    Sbb   EDI,ESI
    Mov   EAX,EDI

@Done:
    Pop   EBX
    Pop   ESI
    Pop   EDI
end;

function ScanFF(const Source,Search:AnsiString;Start:Integer):Integer;

  {Fast Forward scan from specified Start looking for Search key.
   Case insensitive and wildcards NOT supported.

   Returns:  position where/if found; otherwise, 0}

  asm

    Push  EBX              //save the important stuff
    Push  ESI
    Push  EDI
    Push  EBP

    Or    EAX,EAX          //zero source ?
    Jz    @NotFound
    Or    EDX,EDX          //zero search ?
    Jz    @NotFound
    Jecxz @NotFound        //zero start ?

    Mov   EDI,EAX          //source address
    Mov   EBP,EAX          //save it in EBP
    Mov   ESI,EDX          //search address

    Dec   ECX              //zero based start position
    Js    @NotFound
    Mov   EDX,[EDI-4]      //source length
    Or    EDX,EDX
    Jz    @NotFound        //abort on null string
    Sub   EDX,ECX          //consider only remaining of source
    Jbe   @NotFound        //abort if source is too short
    Add   EDI,ECX          //start at the given offset

    Mov   ECX,[ESI-4]      //search length
    Jecxz @NotFound        //abort on null string
    Sub   EDX,ECX          //no need to examine any trailing
    Jb    @NotFound        //abort if source is too short
    Inc   EDX
    XChg  EDX,ECX
    Cld
@Next:
    Mov   AL,[ESI]
    repnz scasb
    Jnz   @NotFound

    Mov   EBX,EDX          //use EBX as temporary offset
    Dec   EDI
@NextOne:
    Dec   EBX              //next offset
    Jz    @Found           //done if zero
    Mov   AL,[EDI+EBX]     //get next character from source
    Mov   AH,[ESI+EBX]     //get next character from search
    Cmp   AL,AH            //match ?
    Jz    @NextOne         //yes, then check next char.
    Inc   EDI              //no, then move to next character in source
    Jmp   @Next            //try again

@NotFound:
    Xor   EAX,EAX          //clear return
    Jmp   @Exit

@Found:
    Sub   EDI,EBP          //calc offset
    Mov   EAX,EDI
    Inc   EAX

@Exit:

    Pop   EBP              //restore the world
    Pop   EDI
    Pop   ESI
    Pop   EBX

end;

function CountF(const Source: Ansistring; X:Char;Index:Integer): Integer;
  {Count occurances of char X. from Index position forward to end of string.}
begin
  Result:=0;
  Index:=ScanC(Source,X,Index);
  while Index>0 do begin
    Inc(Result);
    Inc(Index);
    Index:=ScanC(Source,X,Index);
  end;
end;


procedure colorating(sender:TRichEdit; showkludge:boolean);
var	cou1,lastcr,i1,i2,startbold:integer;
	oemstr:string;
        line:shortstring;
Begin
	if not showkludge then
	begin
		i1:=scanc(sender.text,#1,1);
		while i1>0 do
		Begin
			sender.SelStart:=i1-1;
			sender.SelLength:=scanc(sender.Text,#13,i1)-1;
			sender.SelText:='';
			i1:=scanc(sender.text,#1,1);
		end;
		i1:=scanff(sender.text,'SEEN-BY',1);
		while i1>0 do
		Begin
			sender.SelStart:=i1-1;
			sender.SelLength:=scanc(sender.Text,#13,i1)-1;
			sender.SelText:='';
			i1:=scanff(sender.text,'SEEN-BY',1);
		end;
	end;
	lastcr:=1;
	oemstr:=sender.Text;
	i1:=length(oemstr);
	for cou1:=0 to countf(oemstr,#13,1) do
	Begin
		startbold:=scanc(oemstr,#13,lastcr);
		if startbold>0 then line:=copy(oemstr,lastcr,startbold-lastcr) else line:=copy(oemstr,lastcr,i1-lastcr);
		i2:=lastcr;
		lastcr:=startbold+1;
		line:=uppercase(line);
//		if length(line)<4 then continue;
		if (pos('* ORIGIN',line)>0) and (pos('* ORIGIN',line)<4) then
		Begin
			sender.SelStart := i2;
			sender.sellength:=length(line);
			sender.SelAttributes.color:=ZFMFOrigin.Color;
			sender.SelAttributes.style:=ZFMFOrigin.style;
			sender.SelAttributes.Size:=ZFMFOrigin.Size;
			sender.SelStart:=0;
			sender.sellength:=0;
			continue;
	       end;
	       if ((pos(#1,line)>0) or (pos('SEEN-BY',line)>0)) and showkludge  then
	       Begin
			sender.SelStart := i2;
			sender.sellength:=length(line);
			sender.SelAttributes.color:=ZFMFCludge.Color;
			sender.SelAttributes.style:=ZFMFCludge.style;
			sender.SelAttributes.Size:=ZFMFCludge.Size;
			sender.SelStart:=0;
			sender.sellength:=0;
		       continue;
		       end;

	       if ((pos('---',copy(line,1,4))>0) or (pos('-+-',copy(line,1,4))>0)) and (line[5]<>'-') then
	       Begin
			sender.SelStart := i2;
			sender.sellength:=length(line);
			sender.SelAttributes.color:=ZFMFTear.Color;
			sender.SelAttributes.style:=ZFMFTear.style;
			sender.SelAttributes.Size:=ZFMFTear.Size;
		       continue;
	       end;
		startbold:= countf(copy(line,1,15),'>',1);
		if (not odd(startbold)) and (startbold>1) then
	       Begin
			sender.SelStart := i2;
			sender.sellength:=length(line);
			sender.SelAttributes.color:=ZFMFEven.Color;
			sender.SelAttributes.style:=ZFMFEven.style;
			sender.SelAttributes.Size:=ZFMFEven.Size;
		       continue;
	       end;
		if (odd(startbold)) and (startbold>0) then
	       Begin
			sender.SelStart := i2;
			sender.sellength:=length(line);
			sender.SelAttributes.color:=ZFMFOdd.Color;
			sender.SelAttributes.style:=ZFMFOdd.style;
			sender.SelAttributes.Size:=ZFMFOdd.Size;
		       continue;
	       end;
       end;
       sender.SelStart:=0;
       sender.sellength:=0;
end;



procedure coloratrib(sender:trichedit);
var	cou:longint;
	tmpstr:tstringlist;
	startbold,startitalic,startunderline,startinverse:integer;
	txt:shortstring;
	tempstream:tmemorystream;
	oemstr:string;
Begin
	tempstream:=tmemorystream.create;
	tmpstr:=tstringlist.create;
	sender.selstart:=1;
	sender.sellength:=0;
	sender.SelAttributes.Color:=clRed;
	tempstream.seek(0,0);
	sender.lines.SaveToStream(tempstream);
	tempstream.seek(0,0);
	tmpstr.LoadFromStream(tempstream);
	oemstr:=tmpstr.Text;
	cou:=2;
	startinverse:=0;
	while cou<length(oemstr) do
	Begin
		txt:=copy(oemstr,cou-1,3);
		if txt[2]='#' then
		begin
			if startinverse>0 then
			Begin
				system.delete(oemstr,cou,1);
				system.insert(end_inverse,oemstr,cou);
				system.delete(oemstr,startinverse,1);
				system.insert(begin_inverse,oemstr,startinverse);
				dec(cou,2);
				startinverse:=0;
			end
			else startinverse:=cou;
		end;
		if txt[2]=#13 then startinverse:=0;
		inc(cou);
	end;
//Начало раскраски выделением
	cou:=2;
	startbold:=0;
	while cou<length(oemstr) do
	Begin
		txt:=copy(oemstr,cou-1,3);
		if txt[2]='*' then
		begin
			if not ((txt[3] in ['.',']','[','*']) or (txt[1] in ['.',']','[','*'])) then
			begin
				if startbold>0 then
				Begin
					system.delete(oemstr,cou,1);
					system.insert(end_bold,oemstr,cou);
					system.delete(oemstr,startbold,1);
					system.insert(begin_bold,oemstr,startbold);
					dec(cou,2);
					startbold:=0;
				end
				else startbold:=cou;
			end;
		end;
		if txt[2]=#13 then startbold:=0;
		inc(cou);
	end;
//Начало раскраски курсивом
	cou:=2;
	startitalic:=0;
	while cou<length(oemstr) do
	Begin
		txt:=copy(oemstr,cou-1,3);
		if txt[2]='/' then
		begin
			if ((txt[1]in [' '..'.','_']) or (txt[3]in [' '..'.','_'])) then
			begin
				if startitalic>0 then
				Begin
					system.delete(oemstr,cou,1);
					system.insert(end_italic,oemstr,cou);
					system.delete(oemstr,startitalic,1);
					system.insert(begin_italic,oemstr,startitalic);
					dec(cou,2);
					startitalic:=0;
				end
				else startitalic:=cou;
			end;
		end;
		if txt[2]=#13 then startitalic:=0;
		inc(cou);
	end;
 //Начало раскраски подчеркиванием
	cou:=2;
	startunderline:=0;
	while cou<length(oemstr) do
	Begin
		txt:=copy(oemstr,cou-1,3);
		if txt[2]='_' then
		begin
			if ((txt[3]in [' '..'.','\']) or (txt[1]in [' '..'.','\'])) then
			begin
				if startunderline>0 then
				Begin
					system.delete(oemstr,cou,1);
					system.insert(end_underline,oemstr,cou);
					system.delete(oemstr,startunderline,1);
					system.insert(begin_underline,oemstr,startunderline);
					startunderline:=0;
					dec(cou,2);
				end
				else startunderline:=cou;
			end;
		end;
		if txt[2]=#13 then startunderline:=0;
		inc(cou);
	end;
	tempstream.Seek(0,0);
	tmpstr.text:=oemstr;
	tmpstr.SaveToStream(tempstream);
	tempstream.Seek(0,0);
	sender.lines.LoadFromStream(tempstream);
	tempstream.free;
	tmpstr.free;
end;

function GetFileVersion(const FileName: string): string;
var
  InfoSize, Wnd: DWORD;
  VerBuf: Pointer;
  FI: PVSFixedFileInfo;
  VerSize: DWORD;
begin
    Result := '';
    InfoSize := GetFileVersionInfoSize(PChar(FileName), Wnd);
    if InfoSize <> 0 then
    begin
      GetMem(VerBuf, InfoSize);
      try
        if GetFileVersionInfo(PChar(FileName), Wnd, InfoSize, VerBuf) then
          if VerQueryValue(VerBuf, '\', Pointer(FI), VerSize) then
	      Result := IntToStr(FI.dwFileVersionMS shr 16) + '.' +
						 IntToStr(FI.dwFileVersionMS and $FFFF);// + '.' +
//						 IntToStr(FI.dwFileVersionLS shr 16) + '.' +
//						 IntToStr(FI.dwFileVersionLS and $FFFF);
      finally
		 FreeMem(VerBuf);
      end;
    end;
end;



end.
