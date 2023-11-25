unit Unit2holm;
{
 создает файлы иконки, base64 bmp
  my.ico
  10.html

               10.ht
  }
interface

uses   Clipbrd ,   math,   ShlObj,  FileCtrl,    shellapi,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, ComCtrls;


  {
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus;

  }
type
  TForm1 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    Image2: TImage;
    Image3: TImage;
    Label1: TLabel;
    MainMenu1: TMainMenu;
    here1: TMenuItem;
    OpenDialog1: TOpenDialog;
    OpenDialog2: TOpenDialog;
    dir1: TMenuItem;
    StatusBar1: TStatusBar;
    base641: TMenuItem;
    ico1: TMenuItem;
    gif1: TMenuItem;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button1Click(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure here1Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image2Click(Sender: TObject);
    procedure file1Click(Sender: TObject);
    procedure dir1Click(Sender: TObject);
    procedure ico1Click(Sender: TObject);
    procedure gif1Click(Sender: TObject);
    procedure png1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure vw;
    procedure mask;
    procedure bmp1;
    procedure htm(x: string);
     //Speed up by Renate Schaaf, Armido, Gary Williams...
    function MakeThumbNail(src, dest: tBitmap): boolean;

 procedure mouseD(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
procedure mouseU(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
procedure mouseM(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);

procedure closs(Sender: TObject; var Action: TCloseAction);
procedure very; // перенос картинки из буфера на поле
procedure much; // второй

 procedure keysy(Sender: TObject; var Key: Word;
  Shift: TShiftState);

  procedure ico2base64();
  end;

//const likeWhite=rgb(0,0,0);
const ccc: array[0..6]of tcolor=($ee82ee,clblack,clyellow,clred,claqua,16777210,clwhite);  //  olive
var
  Form1: TForm1;
  a: array[0..15,0..15] of tcolor;
  nameiydttydkkutd: string;
  dawn: boolean;
  xo:integer=-2;yo: integer=-2;
  mok: integer=6;   // цвет карандаша
  lst: tstringlist;

  make10html: boolean=false;
  make12html: boolean=false;

//********************
   dc: HDC;   // скрин экрана
  vbig,v2: tbitmap;  //скин экрана в пам€ти / вырезанна€ область скрина
  im, im2: timage;  // скрин и рамка выбранной области
  t1,t2: tpoint;  // границы выбранной области
  dawn2: boolean=false; // выбор области скрина
  fm: tform; // форма выбоора области
  b440: tbitmap;
//****************
  boom: integer=0;// курсор граней области

type grox=record
  x,y: integer;
  s: string[200];//='';  //    C:/Users/and/Desktop/pisa/
  end;
var
  ikka: grox=(x:100;y:100;s:'C:/Users/and/Desktop/pisa/');
  int6: file of grox;
  myico: string='';//'my.ico';
 //************ гиф переменые
    b3b: byte = $3b; // код конца файла gif
   blockap: string = #$21#$ff#$0b#$4e#$45#$54#$53#$43#$41#$50#$45#$32+
        #$2e#$30#$03#$01#$00#$00#$00; // блок приложений
   blockm: string = #$21#$f9#$04   //блок управлени€
       +#$04                    // пред изображение
       +#$07#$00                // задержка
       +#$01#$00;               // прозррачн цвет
   ncadr: word=1;
   dear: string='';
      ahatin: array[byte, byte, byte] of boolean;
      c256: array [byte] of tcolor;
      sus: string='';
      cyc:tcolor;
      ca: array [0..3] of byte absolute cyc;

   //***************************
   b900: tbitmap;
   charx, chary: integer; // размер знакоместа
   dr2023: boolean=true;
implementation

{$R *.dfm}

{
function dexists(x: string): boolean; // существование директории
var s: tsearchrec;
begin
result:=FindFirst(x,faDirectory,s)=0;
FindClose(s);
//mkdir(s)// создание директории
end;
}

function getlist2(src,msk: string; x: tstringlist): word; // список файлов по маске
var i: integer;
    sr: TSearchRec;
    FileAttrs: Integer;
    zz: tstringlist;


    procedure addy;
    begin
      inc(i);
      zz.add(sr.Name);
    end;
begin
  zz:=tstringlist.create;
  FileAttrs:=0
     +faHidden   // скрытый
     +faSysFile  // системный
     +faVolumeID //
     +faArchive  // архивный
     +faAnyFile; // любой

  i:=0;
  if FindFirst((src+msk), FileAttrs, sr)=0 then   //
    if (sr.Attr and FileAttrs)=sr.Attr then
      begin
        addy;
        while FindNext(sr)=0 do
          if (sr.Attr and FileAttrs)=sr.Attr then
            addy;
        FindClose(sr);
      end;
  result:=i;
  zz.Sort;
  x.assign(zz);
  zz.free;
end;



procedure TForm1.vw;
var i,j,k: integer; c: tcolor;
begin
with image1.canvas do
  begin
    brush.color:=clwhite;
    rectangle(cliprect);
    for i:=0 to 15 do
      for j:=0 to 15 do
         if a[i,j]<>clwhite then
           begin
             brush.Color:=a[i,j];//
             rectangle(rect((i)*16,(15-j)*16,(i+1)*16,(15-j+1)*16));
           end
           else
           begin
              moveto((i)*16,(15-j)*16);
             lineto((i)*16+15,(15-j)*16+15);
           end;
  end;
end;


function EncodeBase64(const inStr: string): string;

  function Encode_Byte(b: Byte): char;
  const
    Base64Code: string[64] =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
  begin
    Result := Base64Code[(b and $3F)+1];
  end;

var
  i: Integer;
begin
  i := 1;
  Result := '';
  while i <=Length(InStr) do
  begin
    Result := Result + Encode_Byte(Byte(inStr[i]) shr 2);
    Result := Result + Encode_Byte((Byte(inStr[i]) shl 4) or (Byte(inStr[i+1]) shr 4));
    if i+1 <=Length(inStr) then
      Result := Result + Encode_Byte((Byte(inStr[i+1]) shl 2) or (Byte(inStr[i+2]) shr 6))
    else
      Result := Result + '=';
    if i+2 <=Length(inStr) then
      Result := Result + Encode_Byte(Byte(inStr[i+2]))
    else
      Result := Result + '=';
    Inc(i, 3);
  end;
end;

// Base64 decoding
function DecodeBase64(const CinLine: string): string;
const
  RESULT_ERROR = -2;
  b64:string= 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
var
  inLineIndex: Integer;
  c: Char;
  x: SmallInt;
  c4: Word;
  StoredC4: array[0..3] of byte;
  InLineLength: Integer;
begin
  Result := '';
  inLineIndex := 1;
  c4 := 0;
  InLineLength := Length(CinLine);

  while inLineIndex <=InLineLength do
  begin
    while (inLineIndex <=InLineLength) and (c4 < 4) do
    begin
      c := CinLine[inLineIndex];
      case c of
        '+'     : x := 62;
        '/'     : x := 63;
        '0'..'9': x := Ord(c) - (Ord('0')-52);
        '='     : x := -1;
        'A'..'Z': x := Ord(c) - Ord('A');
        'a'..'z': x := Ord(c) - (Ord('a')-26);
      else
        x := RESULT_ERROR;
      end;
      if x <> RESULT_ERROR then
      begin
        StoredC4[c4] := x;
        Inc(c4);
      end;
      Inc(inLineIndex);
    end;

    if c4 = 4 then
    begin
      c4 := 0;
      Result := Result + Char(((StoredC4[0] shl 2)and $ff) or (StoredC4[1] shr 4));
      if StoredC4[2] = -1 then Exit;
      Result := Result + Char(((StoredC4[1] shl 4)and $ff) or (StoredC4[2] shr 2));
      if StoredC4[3] = -1 then Exit;
      Result := Result + Char(((StoredC4[2] shl 6)and $ff) or (StoredC4[3]));
    end;
  end;
end;


procedure TForm1.bmp1;
var i,j,k: integer; b: tbitmap;
  d: file of char;  c: char;  s: string;
  m: tstringlist;
begin
  //if not make10html then exit;  необходимо дл€ очистки фона
  b:=tbitmap.create();
  b.Width:=16;
  b.Height:=b.Width;
  for i:=0 to 15 do
    for j:=0 to 15 do
      begin
        b.Canvas.pixels[i,j]:=a[i,15-j];  //
      end;
  b.SaveToFile(extractfilepath(paramstr(0))+'my.bmp');//b.SaveToFile('my.bmp');
  b.Free;
  s:='';
  assignfile(d,extractfilepath(paramstr(0))+'my.bmp');//(d,'my.bmp');
  reset(d);
  while not eof(d) do
    begin
       read(d,c);
       s:=s+c;
    end;
  closefile(d);
  m:=tstringlist.Create();
  m.Add(
    '<div style="display: flex; justify-content:flex-start">'+
    '<img  src="data:image/bmp;base64,'+
    EncodeBase64(s)+
    '" width=160 height=160>'+                       //
    '<div style="padding: 0 222px 0 22px; word-break: break-all">'+
    'src="data:image/bmp;base64,'+EncodeBase64(s)+'</div>'+
    '</div>'
    );
  if make10html then m.savetofile('10.html');
  m.free;
end;



procedure TForm1.htm(x: string);
var i,j,k: integer; b: tbitmap;
  d: file of char;  c: char;  s: string;
  m: tstringlist;
begin
  if not make12html then exit;

  showmessage('uiyuiy');
  b:=tbitmap.create();
  b.Width:=12;
  b.Height:=b.Width;
  for i:=0 to 12 do
    for j:=0 to 12 do
      begin
        b.Canvas.pixels[i,j]:=a[i,12-j];  //
      end;
  //b.SaveToFile('my.bmp');
  b.Free;
  s:='';
  assignfile(d,x);
  reset(d);
  while not eof(d) do
    begin
       read(d,c);
       s:=s+c;
    end;
  closefile(d);
  m:=tstringlist.Create();
  m.LoadFromFile('12.html');
  m.Add(
    '<div style="display: flex; justify-content:flex-start">'+
    '<img  src="data:image/bmp;base64,'+
    EncodeBase64(s)+
    '" width=160 height=160>'+                       //
    '<div style="padding: 0 222px 0 22px; word-break: break-all">'+
    'src="data:image/bmp;base64,'+EncodeBase64(s)+'"</div>'+
    '</div><hr>'
    );
  m.savetofile('12.html');
  m.free;
end;

procedure TForm1.mask;
const cc: array[boolean] of string=('#00#00#00#00','#00#01#ff#ff');
var i,j,k: integer; c: tcolor; w: word;  s1,s2,s3,s4: string; b: byte;  io: ticon;
  f: file of byte;
  sss: string;
begin
  s4:='#FF#FF#00'+
  '#00#FF#FF#00#00#FF#FF#00#00#FF#FF#00#00#FF#FF#00'+
  '#00#FF#FF#00#00#FF#FF#00#00#FF#FF#00#00#FF#FF#00'+
  '#00#FF#FF#00#00#FF#FF#00#00#FF#FF#00#00#FF#FF#00'+
  '#00#FF#FF#00#00#FF#FF#00#00#00#00#00#00';
  s4:='';   s3:='';
  for i:=0 to 15 do
    begin
    w:=0;
    for j:=0 to 15 do
      if a[j,i]=clwhite then
        begin
          w:=w or (1 shl j);
        end
        else
        begin
          w:=w and ($ffff xor (1 shl j));
        end;
      s4:=s4+'#'+inttohex(lo(w),2)+'#'+inttohex(hi(w),2)+'#00#00';

      w:=w xor $ffff;
      for j:=0 to 7 do
      if (lo(w) and (1 shl j))=0 then s3:=s3+cc[false] else s3:=s3+format('#%s#%s#%s#ff',
      [inttohex(getBvalue(a[j,i]),2),inttohex(getGvalue(a[j,i]),2),inttohex(getRvalue(a[j,i]),2)]);

      for j:=0 to 7 do
      if (hi(w) and (1 shl j))=0 then s3:=s3+cc[false] else s3:=s3+format('#%s#%s#%s#ff',
      [inttohex(getBvalue(a[8+j,i]),2),inttohex(getGvalue(a[8+j,i]),2),inttohex(getRvalue(a[8+j,i]),2)]);
    end;
  //*********************

  s1:='#00#00#01#00#01#00#10#10#00#00#01#00#20#00#68#04#00'+
  '#00#16#00#00#00';
  s2:='#28#00#00#00#10#00#00#00#20#00#00'+
  '#00#01#00#20#00#00#00#00#00#00#00#00#00#00#00#00'+
  '#00#00#00#00#00#00#00#00#00#00#00#00#00';

 //assignfile(f,'my.ico');
  assignfile(f,extractfilepath(paramstr(0))+'my.ico');
  //extractfilepath(paramstr(0))+
  //assignfile(f,myico);//aessignfile(f,'my.ico');

  rewrite(f);
  for i:=0 to length(s1) div 3-1 do begin b:=strtoint('$'+s1[1+i*3+1]+s1[1+i*3+2]); write(f,b); end;
  for i:=0 to length(s2) div 3-1 do begin b:=strtoint('$'+s2[1+i*3+1]+s2[1+i*3+2]); write(f,b); end;

  for i:=0 to length(s3) div 3-1 do begin b:=strtoint('$'+s3[1+i*3+1]+s3[1+i*3+2]); write(f,b); end;
  for i:=0 to length(s4) div 3-1 do begin b:=strtoint('$'+s4[1+i*3+1]+s4[1+i*3+2]); write(f,b); end;
  closefile(f);
  CopyFile(pchar(extractfilepath(paramstr(0))+'my.ico'),pchar(myico),false);   //  pchar(sss)
  //////////////////// now copy    ikka.s+
//getlist2(src,msk: string; x: tstringlist): word; // список файлов по маске
 //;
 //showmessage(format('%d',[getlist2(ikka.s,'*.ico',lst)]));
  i:= 1+getlist2(ikka.s,'*.ico',lst) ;
 repeat
  sss:=''+ikka.s+format('my%d.ico',[i]);//'my1.ico';
  inc(i);
 until not fileexists(sss);
  //показал им€ создаваемого ф
  statusbar1.Panels[1].Text:=ExtractFileName(sss);
  // отдел€ю ситуацию с редактированием от захвата
  if myico='' then CopyFile(pchar(extractfilepath(paramstr(0))+'my.ico'),pchar(sss),false);
   //CopyFile(pchar(myico),pchar(sss),false);
end;



procedure tform1.very;
var v,b: tbitmap;
    i,j,k: integer;

    jb: boolean; // успех операции
    bxxx: tbitmap;
begin
  jb:=true;
  b:=tbitmap.Create();
  b.Width:=16; b.Height:=16;
  k:=min(v2.Width,v2.Height);
  //case k of
  case v2.Width of
    1..16:
    //with b.Canvas do StretchDraw(cliprect, v2);
    b900.canvas.Draw(450-v2.Width div 2,328-v2.height,v2);
    //b440.canvas.Draw(220-v2.Width div 2,164-v2.height,v2);
    {17..440:
    //b440.canvas.Draw(220-v2.Width div 2,164-v2.height div 2,v2);
    b900.canvas.Draw(450-v2.Width div 2,328-v2.height div 2,v2);
    }
    17..99999:
    //jb:=MakeThumbNail(v2,b);
    //if  then begin      end;
    begin
        bxxx:=tbitmap.create;
        {
        bxxx.width:=v2.Width;
        bxxx.height:=round(v2.Width*328/440);    }
        bxxx.width:=900;//440;
        bxxx.height:=round(900*v2.height/v2.width);//bxxx.height:=round(440*v2.height/v2.width);
        //showmessage('kp');
        with bxxx.Canvas do StretchDraw(cliprect, v2);
        //b440.canvas.Draw(220-bxxx.Width div 2,164-bxxx.height div 2,bxxx);
        b900.canvas.Draw(450-bxxx.Width div 2,328-bxxx.height div 2,bxxx);
        bxxx.Free;
    end;
  end;//case
  if jb then
    begin
        for i:=0 to 15 do
          for j:=0 to 15 do
            a[i,j]:= b.canvas.pixels[i,15-j];
        vw;
    end;
  b.Free;
  //b440.savetofile('gty.bmp');
  b900.savetofile('gty.bmp');
  //***************
  dr2023:=false;
  v2.Width:=1;
  v2.Height:=1;
  with fm do
    begin
      width:=950;
      height:=650;
    end;
  with im do
    begin
      width:=900;
      height:=656;//600
    end;


  //with im.Canvas do StretchDraw(rect(0,0,900,600), b440); //
  with im.Canvas do StretchDraw(rect(0,0,900,656), b900); //  656
  //fm.Invalidate;

end;




procedure tform1.much;     // второй тур---знакоместо
var v: tbitmap;
    i,j,k: integer;

    jb: boolean; // успех операции
    bxxx: tbitmap;
begin
  charx:=v2.Width;
  chary:=v2.height;
  //b440.savetofile('gty.bmp');
end;


function dexists(x: string): boolean; //
var s100: tsearchrec;
begin
  if x='' then exit;
  if (x[length(x)]='/')or(x[length(x)]='\')then x[length(x)]:=' ';
  x:=trim(x);
  result:=FindFirst(x,faDirectory,s100)=0;
  FindClose(s100);
  //mkdir(s)//
end;


procedure filer;
var i,j,k: integer;
    b: byte;
    fo: file of byte;
    fi: file of byte;
    s: string;

    procedure rare(x:string);
    var i,j,k: integer;
    begin
      for i:=1 to length(x) do
        begin
          b:=ord(x[i]);
          write(fo,b);
        end;
    end;
begin
assignfile(fo,'out.html');
rewrite(fo);
assignfile(fi,'teal-1.html');
reset(fi);
while not eof(fi) do
  begin
    read(fi,b);
    write(fo,b);
  end;
closefile(fi);

  {
 s:=#$6c#$65#$74#$20#$68#$68#$3d;
 rare(s);
 //s:=#$35#$38;
 s:=inttostr(chary);

 rare(s);
 s:=#$3b#$2f#$2f#$2f#$20#$d0#$b2#$d1#$8b#$d1#$81#$d0#$be#$d1#$82#$d0#$b0#$20#$d0#$b7#$d0#$bd#$d0#$b0#$d0#$ba#$d0#$be#$d0#$bc#$d0#$b5#$d1#$81#$d1#$82#$d0#$b0#$0d#$0a#$6c#$65#$74#$20#$77#$77#$3d;
 rare(s);
 //s:=#$32#$37#$2e#$35;
 s:=inttostr(charx);
 rare(s);
 s:=#$3b#$2f#$2f#$2f#$20#$d1#$88#$d0#$b8#$d1#$80#$d0#$b8#$d0#$bd#$d0#$b0#$20#$d0#$b7#$d0#$bd#$d0#$b0#$d0#$ba#$d0#$be#$d0#$bc#$d0#$b5#$d1#$81#$d1#$82#$d0#$b0#$0d#$0a;
 rare(s);
    }

s:=#$6c#$65#$74#$20#$77#$77#$3d;
 rare(s);
 s:=inttostr(charx);
 rare(s);
//#$32#$37#$2e#$35
s:=#$3b#$2f#$2f#$2f#$20#$d1#$88#$d0#$b8#$d1#$80#$d0#$b8#$d0#$bd#$d0#$b0#$20#$d0#$b7#$d0#$bd#$d0#$b0#$d0#$ba#$d0#$be#$d0#$bc#$d0#$b5#$d1#$81#$d1#$82#$d0#$b0#$0d#$0a#$6c#$65#$74#$20#$68#$68#$3d;
 rare(s);
 s:=inttostr(chary);
 rare(s);
//#$35#$38
s:=#$3b#$2f#$2f#$2f#$20#$d0#$b2#$d1#$8b#$d1#$81#$d0#$be#$d1#$82#$d0#$b0#$20#$d0#$b7#$d0#$bd#$d0#$b0#$d0#$ba#$d0#$be#$d0#$bc#$d0#$b5#$d1#$81#$d1#$82#$d0#$b0#$0d#$0a;
 rare(s);
 
 {
let hh=58;//35;    /// ?????? ??????????
let ww=27.5;//50;//24;  /// ?????? ??????????
}

assignfile(fi,'teal-2.html');
reset(fi);
while not eof(fi) do
  begin
    read(fi,b);
    write(fo,b);
  end;
closefile(fi);

closefile(fo);

end;


procedure TForm1.FormCreate(Sender: TObject);
var f: file of byte;
    n: integer;
    s: string;
    b: byte;
    i,j,k: integer;
    r: real;
    bmv: tbitmap; hh: tbitmap;
    ff: file of byte;
    vz: tbitmap;
begin    //StringReplace(d,'=',' ',[rfReplaceAll,rfIgnoreCase])


{
if  dexists('K:\!\projAll\zzzz\pisa\') then showmessage('exists');
if  dexists('K:/!/projAll/zzzz/pisa/') then showmessage('exists');    }
{if  dexists('K:\!\projAll\zzzz\pisa') then showmessage('exists');
if  dexists('K:/!/projAll/zzzz/pisa') then showmessage('exists');
 }
   
if fileexists('int6.ini') then
  begin
    assignfile(int6,'int6.ini');
    reset(int6);
    if not eof(int6) then read(int6,ikka);
    closefile(int6);
  end;

if not dexists(ikka.s) then
  begin
 // showmessage('exists');
  if not dexists(extractfilepath(paramstr(0))+'pisa') then
    begin
      mkdir(extractfilepath(paramstr(0))+'pisa');
      ikka.s:=extractfilepath(paramstr(0))+'pisa\';
    end
    else
    begin
      ikka.s:=extractfilepath(paramstr(0))+'pisa\';
    end;
  end;
statusbar1.Panels[0].Text:=ikka.s;
{s:=ikka.s;
if dexists(s) then
  begin
    ikka.s:=extractfilepath(paramstr(0));
  end;
  }
//showmessage(inttostr(integer(rgb(250,255,255))));


  if Clipboard.HasFormat(CF_BITMAP) then   // в буфере именно картинка
    begin
        vz:=tbitmap.Create();
        vz.LoadFromClipboardFormat(CF_BITMAP, ClipBoard.GetAsHandle(CF_BITMAP), 0);
        vz.Free;
    end;
  //***************************
   fm:=tform.Create(self);
   with fm do
     begin
      width:=1008;
      height:=560;
      top:=(Screen.height-height)div 2;
      left:=(Screen.Width-width)div 2;
      borderstyle:= bsSizeable;
      windowstate:=wsnormal;
      color:=clyellow;
      onkeydown:=keysy;
      onclose:=closs;
     end;
    im:=timage.create(form1);
    with im do
      begin
        im.Height:=Screen.Height;
        im.Width:=Screen.Width;
        top:=0;
        left:=0;                           

        onmousedown:=moused;
        onmouseup:=mouseu;
        onmousemove:=mousem;
        parent:=fm;//form1;//
      end;

    v2:=TBitmap.Create;
    vbig:=TBitmap.Create;
    vbig.Height:=Screen.Height;
    vbig.Width:=Screen.Width;
    DC:=GetDC(0);
    bitblt(vbig.Canvas.Handle, 0, 0, Screen.Width, Screen.Height,DC, 0, 0, SRCCOPY);
    ReleaseDC(0, DC);
    im.canvas.Draw(0,0,vbig);

  getlist2('','*.bmp',lst);
  for i:=0 to lst.Count-1 do
    htm(lst[i]);
  //************
  if (paramstr(1)>'') then
    begin
      bmv:=tbitmap.Create();
     bmv.LoadFromFile(paramstr(1));
      while true do
        begin
          if bmv.width>16 then
            begin
              hh:=tbitmap.Create();
              hh.Assign(bmv);
              bmv.Width:=16;
              bmv.Height:=bmv.Width;
              if not MakeThumbNail(hh, bmv) then break;
            end;
          for i:=0 to 15 do//bmv.Height-1 do
            for j:=0 to 15 do//bmv.Width-1 do
              begin
                a[i,15-j]:=bmv.canvas.pixels[i,j];
              end;
          break;
        end;
      bmv.Free;
    end
    else
    for i:=0 to 15 do
      for j:=0 to 15 do a[i,j]:=clwhite;
  r:=image3.height / 7;
  with image3.Canvas do
    begin
      brush.Color:=clblue;
      rectangle(cliprect);
      for j:=0 to high(ccc) do
        begin
        brush.Color:=ccc[j];
        rectangle(rect(0,round(r*j),50,round(r*(j+1))));
        end;
       moveto(0,256-38); lineto(50,256);
    end;
  nameiydttydkkutd:='4.ico';
  //****************
  with image1 do
    begin
      width:=256;
      height:=256;
    end;

  //********
  n:=0; s:='';
  fm.ShowModal;
   //************************
  if (v2.width+v2.Height)>0 then
     very; // перенос изображени€ области на поле
   //************************
  fm.ShowModal;
  if (v2.width+v2.Height)>0 then
     much; // перенос изображени€ области на поле
  //*****************************
  filer;

  vw;

  //ShellExecute(Application.Handle, 'open', 'http://google.ru',nil,nil,SW_SHOWNORMAL);

  //ShellExecute(Application.Handle, 'open', 'file:///C:/Users/Andrew/Desktop/%D0%B1%D0%BB%D0%B5%D0%BD%D0%B4%D0%B5%D1%803%D0%B4.html',nil,nil,SW_SHOWNORMAL);


  //ShellExecute(Application.Handle, 'open', 'file:///C:/Users/Andrew/Documents/GitHub/d7_icoxolmes2/out.html',nil,nil,SW_SHOWNORMAL);
   //file:///C:/Users/Andrew/Documents/GitHub/d7_icoxolmes2/out.html

 //showmessage(  StringReplace(extractfilepath(paramstr(0))+'out.html','\','/',[rfReplaceAll]));
ShellExecute(Application.Handle, 'open',
 pchar('file:///'+StringReplace(extractfilepath(paramstr(0))+'out.html',
 '\','/',[rfReplaceAll])),nil,nil,SW_SHOWNORMAL);

 //showmessage(  extractfilepath(paramstr(0))+'out.html');
//showmessage(  extractfilepath(paramstr(0)));
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  xo:=x; yo:=y;
  dawn:=true;
  a[x div 16,15-y div 16]:=ccc[mok];//clred;
  vw;
end;

procedure TForm1.Button1Click(Sender: TObject);
var io: ticon;
begin
  mask;
  bmp1;
  io:=ticon.Create();
  io.LoadFromFile(extractfilepath(paramstr(0))+'my.ico');
  //io.LoadFromFile('my.ico');   // io.LoadFromFile(myico);//
  //extractfilepath(paramstr(0))+'my.ico');

  with image2.Canvas do
    begin
      pen.Color:=clwhite;
      brush.Color:=clwhite;
      rectangle(cliprect);
    end;
  image2.Canvas.Draw(0,0,io);
  io.Free;
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if not dawn then exit;
  if (xo=x)and(yo=y) then exit;
  if  not ((x div 16)in [0..15]) then exit;
  if  not ((y div 16)in [0..15]) then exit;

  a[x div 16,15-y div 16]:=ccc[mok];//clred;
  xo:=x; yo:=y;
  vw;
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  dawn:=false;
end;

procedure TForm1.Image3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var i: integer;
begin
  i:=y div (image3.height div 7);
  label1.caption:=inttostr(i);
  if i in [0..6] then mok:=i;
end;

procedure TForm1.here1Click(Sender: TObject);
begin
  showmessage(paramstr(0));
end;

 //Speed up by Renate Schaaf, Armido, Gary Williams...
function tform1.MakeThumbNail(src, dest: tBitmap): boolean;
 const
  FThumbSize = 17;
 type
   PRGB24 = ^TRGB24;
   TRGB24 = packed record
     B: Byte;
     G: Byte;
     R: Byte;
   end;
 var
   x, y, ix, iy: integer;
   x1, x2, x3: integer;

   xscale, yscale: single;
   iRed, iGrn, iBlu, iRatio: Longword;
   p, c1, c2, c3, c4, c5: tRGB24;
   pt, pt1: pRGB24;
   iSrc, iDst, s1: integer;
   i, j, r, g, b, tmpY: integer;

   RowDest, RowSource, RowSourceStart: integer;
   w, h: integer;
   dxmin, dymin: integer;
   ny1, ny2, ny3: integer;
   dx, dy: integer;
   lutX, lutY: array of integer;

 begin
   result:=false;
   if src.PixelFormat <> pf24bit then src.PixelFormat := pf24bit;
   if dest.PixelFormat <> pf24bit then dest.PixelFormat := pf24bit;
   w := Dest.Width;
   h := Dest.Height;

   if (src.Width <= FThumbSize) and (src.Height <= FThumbSize) then
   begin
     dest.Assign(src);
     exit;
   end;

   iDst := (w * 24 + 31) and not 31;
   iDst := iDst div 8; //BytesPerScanline
  iSrc := (Src.Width * 24 + 31) and not 31;
   iSrc := iSrc div 8;

   xscale := 1 / (w / src.Width);
   yscale := 1 / (h / src.Height);

   // X lookup table 
  SetLength(lutX, w);
   x1 := 0;
   x2 := trunc(xscale);
   for x := 0 to w - 1 do
   begin
     lutX[x] := x2 - x1;
     x1 := x2;
     x2 := trunc((x + 2) * xscale);
   end;

   // Y lookup table 
  SetLength(lutY, h);
   x1 := 0;
   x2 := trunc(yscale);
   for x := 0 to h - 1 do
   begin
     lutY[x] := x2 - x1;
     x1 := x2;
     x2 := trunc((x + 2) * yscale);
   end;

   dec(w);
   dec(h);
   RowDest := integer(Dest.Scanline[0]);
   RowSourceStart := integer(Src.Scanline[0]);
   RowSource := RowSourceStart;
   for y := 0 to h do
   begin
     dy := lutY[y];
     x1 := 0;
     x3 := 0;
     for x := 0 to w do
     begin
       dx:= lutX[x];
       iRed:= 0;
       iGrn:= 0;
       iBlu:= 0;
       RowSource := RowSourceStart;
       for iy := 1 to dy do
       begin
         pt := PRGB24(RowSource + x1);
         for ix := 1 to dx do
         begin
           iRed := iRed + pt.R;
           iGrn := iGrn + pt.G;
           iBlu := iBlu + pt.B;
           inc(pt);
         end;
         RowSource := RowSource - iSrc;
       end;
       iRatio := 65535 div (dx * dy);
       pt1 := PRGB24(RowDest + x3);
       pt1.R := (iRed * iRatio) shr 16;
       pt1.G := (iGrn * iRatio) shr 16;
       pt1.B := (iBlu * iRatio) shr 16;
       x1 := x1 + 3 * dx;
       inc(x3,3);
     end;
     RowDest := RowDest - iDst;
     RowSourceStart := RowSource;
   end;

   if dest.Height < 3 then exit;

   // Sharpening... 
  s1 := integer(dest.ScanLine[0]);
   iDst := integer(dest.ScanLine[1]) - s1;
   ny1 := Integer(s1);
   ny2 := ny1 + iDst;
   ny3 := ny2 + iDst;
   for y := 1 to dest.Height - 2 do
   begin
     for x := 0 to dest.Width - 3 do
     begin
       x1 := x * 3;
       x2 := x1 + 3;
       x3 := x1 + 6;

       c1 := pRGB24(ny1 + x1)^;
       c2 := pRGB24(ny1 + x3)^;
       c3 := pRGB24(ny2 + x2)^;
       c4 := pRGB24(ny3 + x1)^;
       c5 := pRGB24(ny3 + x3)^;

       r := (c1.R + c2.R + (c3.R * -12) + c4.R + c5.R) div -8;
       g := (c1.G + c2.G + (c3.G * -12) + c4.G + c5.G) div -8;
       b := (c1.B + c2.B + (c3.B * -12) + c4.B + c5.B) div -8;

       if r < 0 then r := 0 else if r > 255 then r := 255;
       if g < 0 then g := 0 else if g > 255 then g := 255;
       if b < 0 then b := 0 else if b > 255 then b := 255;

       pt1 := pRGB24(ny2 + x2);
       pt1.R := r;
       pt1.G := g;
       pt1.B := b;
     end;
     inc(ny1, iDst);
     inc(ny2, iDst);
     inc(ny3, iDst);
   end;
 result:=true;
 end;


procedure TForm1.N11Click(Sender: TObject);
var b: byte; i,j,k: integer; f: file of byte; d: file of char;  c: char;  s: string;
  m: tstringlist;
begin
  if not (opendialog1.Execute) then exit;
  s:='';
  assignfile(d,opendialog1.FileName);
  reset(d);
  while not eof(d) do
    begin
       read(d,c);
       s:=s+c;
    end;
  closefile(d);
  m:=tstringlist.Create();
  m.Add(
    '<img  src="data:image/bmp;base64,'+
    EncodeBase64(s)+
    '">'
    );
  m.savetofile('10.html');
  m.free;
end;


procedure TForm1.closs(Sender: TObject; var Action: TCloseAction);
begin
  //v2.SaveToFile('ooo.bmp');
  image1.Canvas.Draw(0,0,v2);
  ikka.x:=t2.X-t1.x;
  ikka.y:=t2.Y-t1.y;
  if (ikka.x>0) then
    begin
      assignfile(int6,'int6.ini');
      rewrite(int6);

      while pos('\\',ikka.s)>0 do StringReplace(ikka.s,'\\','\',[rfReplaceAll,rfIgnoreCase]);

      write(int6,ikka);
      closefile(int6);
    end;
end;

procedure TForm1.mouseD(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  dawn2:=true;
  t1:=point(x,y);
end;

procedure TForm1.mouseM(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
t1:=t1;
end;

procedure TForm1.mouseU(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  dawn2:=false;
  t2:=point(x,y);
//************
  v2.Width:=abs(t1.X-t2.x);
  v2.Height:=abs(t1.Y-t2.y);
  //*****************
  if v2.Width+v2.Height =0 then
    begin
      v2.Width:=ikka.x;
      v2.Height:=ikka.y;
      t1:=point(x,y);
      t2:=point(x+v2.Width,y+v2.Height);

    end;

  BitBlt(v2.Canvas.handle,0,0, v2.Width,v2.height, vbig.canvas.handle,min(t1.X,t2.x),min(t1.Y,t2.y),SRCCOPY);
  with im.Canvas do
    begin
      if dr2023 then
        im.canvas.Draw(0,0,vbig)
        else
        //StretchDraw(rect(0,0,900,600), b440);
        StretchDraw(rect(0,0,900,656), b900);
      pen.Width:=2;
      pen.Color:=clred;
      brush.Style:=bsclear;
      rectangle(t1.X,t1.y,t2.X,t2.y);
      rectangle(t1.X,t1.y,t1.X+v2.Width,t1.y+v2.Height);
    end;
  fm.Caption:=format('%d   %d',[v2.Width,v2.Height]);
end;

procedure TForm1.Panel1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var io: ticon;
begin
  mask;
  bmp1;
  io:=ticon.Create();
  io.LoadFromFile('my.ico'); // io.LoadFromFile(myico); //  
  with image2.Canvas do
    begin
      pen.Color:=clwhite;
      brush.Color:=clwhite;
      rectangle(cliprect);
    end;
  image2.Canvas.Draw(0,0,io);
  io.Free;
end;

procedure TForm1.keysy(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
if key=VK_RETURN then fm.close;   // сильный ход
if key=VK_NUMPAD0 then boom:=(boom+1)mod 5;
if boom=1 then boom:=2;
if boom=0 then begin
  if key=VK_up then begin dec(t1.Y); dec(t2.y); end;
  if key=VK_down then begin inc(t1.Y); inc(t2.y); end;
  if key=VK_left then begin dec(t1.x); dec(t2.x); end;
  if key=VK_right then begin inc(t1.x); inc(t2.x); end;

end;

if fm.Visible and (boom=0) then
begin
  if key=VK_numpad1 then begin t2:=point(t1.X+35,t1.y+47) end;
  if key=VK_numpad2 then begin t2:=point(t1.X+48,t1.y+48) end;

  if key=VK_numpad3 then begin t2:=point(t1.X+256,t1.y+256) end;
  if key=VK_numpad4 then begin t2:=point(t1.X+128,t1.y+128) end;
  if key=VK_numpad5 then begin t2:=point(t1.X+26,t1.y+26) end;
  fm.Caption:=format('%d   %d',[t2.X-t1.x,t2.Y-t1.y]);
end;

if boom=1 then begin    //top
  if key=VK_up then begin dec(t1.Y); end;
  if key=VK_down then begin inc(t1.Y); end;
end;

if boom=3 then begin    //bottom
  if key=VK_up then begin dec(t2.Y); end;
  if key=VK_down then begin inc(t2.Y); end;
end;

if boom=4 then begin // left
  if key=VK_left then begin dec(t1.x); end;
  if key=VK_right then begin inc(t1.x); end;
end;

if boom=2 then begin // right
  if key=VK_left then begin dec(t2.x); end;
  if key=VK_right then begin inc(t2.x); end;
end;

//************
  v2.Height:=abs(t1.Y-t2.y);
  v2.Width:=abs(t1.X-t2.x);

  BitBlt(v2.Canvas.handle,0,0, v2.Width,v2.height, vbig.canvas.handle,min(t1.X,t2.x),min(t1.Y,t2.y),SRCCOPY);
  with im.Canvas do
    begin
        if dr2023 then
           im.canvas.Draw(0,0,vbig)
            else
            //StretchDraw(cliprect, b440);
            //StretchDraw(rect(0,0,900,600), b440);
            StretchDraw(rect(0,0,900,656), b900);
      pen.Width:=2;
      pen.Color:=clred;
      brush.Style:=bsclear;
      rectangle(t1.X,t1.y,t2.X,t2.y);
      pen.Color:=clblack;//clfuchsia;//
      case boom of
        1: rectangle(t1.X,t1.y,t2.X,t1.y-1);
        2: rectangle(t2.X+1,t1.y,t2.X,t2.y);
        3: rectangle(t1.X,t2.y,t2.X,t2.y+1);
        4: rectangle(t1.X-1,t1.y,t1.X,t2.y);
      end;
    end;
  fm.Caption:=format('%d   %d',[t2.X-t1.x,t2.Y-t1.y]);
end;


procedure CopyFilesToClipboard(FileList: string); 
var 
  DropFiles: PDropFiles; 
  hGlobal: THandle; 
  iLen: Integer; 
begin 
  iLen := Length(FileList) + 2; 
  FileList := FileList + #0#0; 
  hGlobal := GlobalAlloc(GMEM_SHARE or GMEM_MOVEABLE or GMEM_ZEROINIT,
    SizeOf(TDropFiles) + iLen); 
  if (hGlobal = 0) then raise Exception.Create('Could not allocate memory.'); 
  begin 
    DropFiles := GlobalLock(hGlobal); 
    DropFiles^.pFiles := SizeOf(TDropFiles); 
    Move(FileList[1], (PChar(DropFiles) + SizeOf(TDropFiles))^, iLen); 
    GlobalUnlock(hGlobal);
    Clipboard.SetAsHandle(CF_HDROP, hGlobal);
  end;
end;

procedure TForm1.ico2base64();
var s: string; i,j,k: integer;  m: tstringlist; d: file of char;  c: char;
begin
  s:='';
  assignfile(d,'my.ico');
  reset(d);
  while not eof(d) do
    begin
       read(d,c);
       s:=s+c;
    end;
  closefile(d);
  m:=tstringlist.Create();
  m.Add(
    '<img class="dd" src="data:image/ico;base64,'+
    EncodeBase64(s)+
    '">'
    );
  ClipBoard.AsText := m.Text;
  //m.savetofile('10.html');
  //m.saveto
  m.free;
end;

procedure TForm1.Image2Click(Sender: TObject); // в бо кидаю файл иконки
begin
 CopyFilesToClipboard(extractfilepath(paramstr(0))+'my.ico');
 //************************
 // ico2base64();
end;

procedure TForm1.file1Click(Sender: TObject);
var i:timage;
begin
if not opendialog2.execute then exit;
myico:=opendialog2.filename;
  i:=timage.Create(self);
  i.Picture.LoadFromFile(myico);//('my.ico');
  v2.Width:=16; v2.Height:=16;
  v2.canvas.Draw(0,0,i.Picture.Icon);
  i.Free;
  very;
end;

procedure TForm1.dir1Click(Sender: TObject);
var s: string;
begin
  if SelectDirectory('s', '', s) then
    begin
      if not (s[length(s)] in['\']) then s:=s+'\';
      fillchar(ikka.s[0],200,#0);
      ikka.s:=s;
      assignfile(int6,'int6.ini');
      rewrite(int6);
      showmessage(ikka.s);
      
      write(int6,ikka);
      closefile(int6);
      statusbar1.Panels[0].Text:=s;
    end;
end;

procedure TForm1.ico1Click(Sender: TObject);
begin
  ico2base64();
end;


(*
ima.bmp');
in6
*)

  function numco(b: array of tbitmap):integer;  // колво цветов в рисунке
   label qex;
   var i, j, k, n, m: integer;
   c: tcolor;   ca: array [0..3] of byte absolute c;

   begin

   FillChar(c256[0], SizeOf(c256), 0);

        for i := 0 to 255 do
          for j := 0 to 255 do
            for k := 0 to 255 do
              ahatin[i, j, k]:=true;
        n := 0;
        for m := 0 to high(b) do
          for i := 0 to b[m].width - 1 do
            for j := 0 to b[m].height - 1 do begin
              c := b[m].canvas.pixels[i, j];
              if ahatin[ca[0], ca[1], ca[2]] then begin
                if n > 255 then goto qex;
                c256[n]:=c;
                inc(n);
                ahatin[ca[0], ca[1], ca[2]]:=false;
              end;
            end;
        qex:
        result := n;
         //
 //showmessage(inttostr(n));
  // result:=8
   end;


  procedure gifka();
type abyte = array of byte;
type izor = packed record
  sgn: byte;
  x, y, w, h: word;
  p1, p2: byte;
end;
type hedor = packed record
  nam: array [0..5] of char;
  w, h: word;
  n, t, c: byte;
end;

var s: string; i,j,k: integer;
bi: tbitmap;
m: tstringlist;
d: file of char;
//c: char;
f: file of byte;
fb: byte;

//**************
    pwpal: byte;
   palx: integer; // цена цвета по ос€м
   kxp, kyp: integer;

   c: tcolor;

   raw, lzw: abyte;  //  array of

   ncol: integer;
   bit: byte;

   izo: izor;
   iz: array [0..10] of byte absolute izo;
   fedor: hedor;
   fe: array [0..12] of byte absolute fedor;
   maxy: tpoint;
//******************
   procedure bunt;
   begin end;

   procedure raw2lzw(src: abyte; out dst: abyte; bitos: word);
   type el=record  // элемент словар€
              x: byte;
              q: word;
            end;
        var i, j, u: integer;
            ading: boolean;  //
            nu, w: word;
            d, h: word;
            e: byte;
            m: array[byte]of byte;
            dc: array [0..$1001] of el;  //словарь
            szbit: word;
            kodclr, kodend: word;
            L: tstringlist;
            nz: longword;
    procedure nutc();
    var i: integer;
    begin
                         setlength(dst, nz + nu + 1);
                         dst[nz]:=nu;
                         for i := 0 to nu - 1 do begin
                           dst[nz + i + 1]:=m[i];
                         end;
                         inc(nz, nu + 1);
                         nu:=0;
    end;
    procedure autcod(x: word);
    var i: byte;
    begin
                      for i := 0 to szbit do begin
                         d := d or (((x shr i) and 1) shl u);
                         inc(u);
                         if u > 7 then begin
                           u := 0;
                           m[nu] := d;
                           d := 0;
                           inc(nu);
                           if nu > 254 then
                              nutc;
                        end;
                      end;
    end;
    //*************
    
    begin
       L := tstringlist.create;
        if bitos = 0 then bitos := 8;
        if bitos < 2 then bitos := 2;
        kodclr := (1 shl bitos);
        kodend := kodclr + 1;


        nz := 0; // длина сжатого кода
        nu := 0;
        h := 0; {size of dictionary}
        d := 0; {one output}
        u := 0; // курсор вставки бита
        szbit := bitos;
        autcod(kodclr);
        w:=src[0];
        for i := 1 to high(src)do begin
          e := src[i];
            ading := true;{no in dic}
            for j := kodend + 1 to kodend + h do
              if (w = dc[j].q) and(e = dc[j].x) then begin
                   ading := false;
                   w := j;
                   break;
                 end;
            if ading then begin
              inc(h);
              dc[kodend + h].q:=w;
              dc[kodend + h].x:=e;
              autcod(w);
              w := e;
              if    (h + kodend = $8)
                  or(h + kodend = $10)
                  or(h + kodend = $20)
                  or(h + kodend = $40)
                  or(h + kodend = $80)
                  or(h + kodend = $100)
                  or(h + kodend = $200)
                  or(h + kodend = $400)
                  or(h + kodend = $800) then
                    inc(szbit);
              if h + kodend + 1 = $1001 then begin
                autcod(kodclr);
                h := 0;
                szbit := bitos;
              end;
            end;
        end;//i
        autcod(w);
        autcod(kodend);
        if u > 0 then begin
          m[nu] := d;
          inc(nu);
        end;
        if nu > 0 then nutc;
        setlength(dst, length(dst) + 1);
        dst[high(dst)] := 0;// подблок нулейвой длины
        L.free;
   end;
   procedure savegif(x: string; rule: byte);
        var i, j: integer;
            p: abyte;
            bb: byte;
            trsp: byte;
            delay: word;
            f: file of byte;

    procedure addimg(x: word);
    var i: integer;
    begin
            trsp := 0;
           // прозрачный цвек вместо белого ха-ха
           //showmessage(inttostr(ncol));
           for i:=0 to ncol-1 do
             if c256[i]=$ffffff then
               begin
                 trsp:=1;
                 blockm[7] := chr(i);
               end;
                blockm[4] := chr($04 + trsp);//21 f9 04 {05} 7b 00 01 00
                delay:=123;
            blockm[5] := chr(lo(delay));
            blockm[6] := chr(hi(delay));



            for i := 1 to length(blockm) do
            begin
              bb := ord(blockm[i]);
              sus:=sus+chr(bb);//****write(f, bb);
            end;
            //////////////////
            izo.sgn := $2c;
            izo.x := 0;
            izo.y := 0;
            izo.w := 16;
            izo.h := 16;
            izo.p1 := 0;
            izo.p2 := bit;
            //////////////////
            for i := 0 to high(iz) do sus:=sus+chr(iz[i]);//*****write(f, iz[i]);
            for i := 0 to high(lzw) do sus:=sus+chr(lzw[i]);//*********write(f, lzw[i]);
    end;
    begin
    sus:='';
         fedor.nam := 'GIF89a';   // формирую заголовок и п0литру
        fedor.w :=16;//b.width;//bwidth;// maxy.x;//bt.width;    bHeight
        fedor.h :=16;//b.Height;//bHeight;// maxy.y;//bt.height;
        fedor.n := 128 + (pwpal shl 4) + pwpal;
        fedor.t := 0;
        fedor.c := 0;

        setlength(p, 3 * (2 shl pwpal));
        for i := 0 to (2 shl pwpal) - 1 do begin
          cyc := c256[i];
          p[i * 3]:=ca[0];
          p[i * 3 + 1] := ca[1];
          p[i * 3 + 2] := ca[2];
        end;
        // все это дело в строку
        ///assignfile(f, x);
        //rewrite(f);
        for i := 0 to high(fe) do sus:=sus+chr(fe[i]);//*****write(f, fe[i]);
        for i := 0 to high(p) do sus:=sus+chr(p[i]);//*******write(f, p[i]);
        for i := 1 to length(blockap) do
        begin
          bb:=ord(blockap[i]);
          sus:=sus+chr(bb);//*******write(f, bb);
        end;

        rule:=1;
        case rule of
          1: for j := 0 to ncadr - 1 do addimg(j);/// фотки по списку
          2: for j:=ncadr - 1 downto 0 do addimg(j);  // фотки по списку   //
          3: begin
             for j := 0 to ncadr - 1 do addimg(j);/// фотки по списку
             for j:=ncadr - 1 downto 1 do addimg(j);
             end;
        end;

        sus:=sus+chr(b3b);//write(f, b3b);
        //closefile(f);
    end;
   procedure makepal;
   var i,j,k: integer;
   begin
   ncol:=numco([bi]);     // колво цветов в рисунке
    setlength(raw, 256);//bi.width * bi.height);   ///в сырец
    for i := 0 to 15 do//bi.Height - 1 do
      for j := 0 to 15 do//bi.width - 1 do
        for k := 0 to 255 do
          if c256[k] = bi.canvas.pixels[j, i] then
            begin
              raw[j + i * 16]:=k;//bi.width] := k;
              break;
            end;
            i := 1;
            while (1 shl i) < ncol do inc(i);
            pwpal := i - 1;
            if i < 2 then i := 2;
            bit := i;
            //vw_palet; // показ палитры
            raw2lzw(raw, lzw, bit); // сжатие

   end;

begin
bi:=tbitmap.create();
bi.Width:=16;
bi.Height:=16;
bi.canvas.draw(0,0,form1.Image2.picture.bitmap);
//******************************
makepal;
savegif('.gif', 1);

//******************************
bi.SaveToFile('my.bmp');
freeandnil(bi);
//***********************  gif строкой base64
  m:=tstringlist.Create();
  m.Add(
    '<img class="dd" src="data:image/gif;base64,'+
    EncodeBase64(sus)+
    '">'
    );
  ClipBoard.AsText := m.Text;
  m.free;
//********
 assignfile(f,'my.gif');
 rewrite(f);
 for i:=1 to length(sus) do begin fb:=ord(sus[i]);write(f,fb); end;
 closefile(f);

end;


procedure TForm1.gif1Click(Sender: TObject);
begin
gifka();
end;

procedure TForm1.png1Click(Sender: TObject);
begin
  showmessage('error');
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
close;
end;

initialization
  lst:=TStringList.Create();
  b440:=tbitmap.Create();   b440.Width:=440;  b440.Height:=328;
  with b440.Canvas do begin brush.Color:=clteal;
  fillrect(cliprect) end;
  b900:=tbitmap.Create();   b900.Width:=900;  b900.Height:=656;
  with b900.Canvas do begin brush.Color:=clteal;
  fillrect(cliprect) end;

  
finalization
  b900.free;
  b440.Free;
  lst.Free;

end.
