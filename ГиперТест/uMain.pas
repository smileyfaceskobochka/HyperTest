unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, ComCtrls, Buttons, OleCtrls, XPMan,
  FileCtrl, CheckLst, Grids, ActnList,StrUtils;

type
  TQuest=record
     n:word;
     typ:word;
     colq:word;
     fq:string;
     answ:string;
     cor:string;
     pic:string;
     ves:integer;
     tema:integer;
     enab:word;
  end;

   TcShape = class(TShape)
   protected
         procedure Paint; override;
   end;

  TAnswer = record
     n:word;
     answ:string;
     is_done:boolean;
  end;

  TTheme = packed record
    PointsTotal: real;
    PointsForTheme: real;
    Name: string;
  end;

  TResultRec = record
    PointsMax: Integer;
    PointsGained: Real;
    Mark: string;
    TestTime: TTime;
  end;

  PTQuest=^TQuest;
  PTAnswer=^TAnswer;

  TfMain = class(TForm)
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    N3: TMenuItem;
    Bevel2: TBevel;
    rg: TRadioGroup;
    Memo: TMemo;
    BitBtn2: TBitBtn;
    OD: TOpenDialog;
    XPManifest1: TXPManifest;
    gb: TGroupBox;
    clb: TCheckListBox;
    gbe: TGroupBox;
    Edit1: TEdit;
    Label2: TLabel;
    sg: TStringGrid;
    Label3: TLabel;
    BitBtn4: TBitBtn;
    Timer1: TTimer;
    Label4: TLabel;
    N1: TMenuItem;
    Sh1: TShape;
    Sh2: TShape;
    BitBtn1: TBitBtn;
    gblb: TGroupBox;
    lb1: TListBox;
    lb2: TListBox;
    lb3: TListBox;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    ActionList1: TActionList;
    Action1: TAction;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure sgClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure sgDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure N1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure sgMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sgKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    list:tlist;
    lista:tlist;
    list_temp:tlist;
    listo:tlist;
    tekq:word;
    corq:word;
    path:string;
    tp:PTQuest;
    time:TDateTime;
    IsComplete:boolean;
    total_time:TDateTime;
    col_given:word;
    oc_3,oc_4,oc_5:word;
    show_type:word;

    ThemesList: array of TTheme;

    procedure LoadTP(x:word);
    function AllAnsw:boolean;
    procedure ch(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
    procedure DelDynam;
    function GetWord(st:string;n:word;chet:boolean):string;
    Procedure SortQ;
    procedure SortA;
    function posit(sub,s:string):boolean;
    procedure GetResult;
    procedure GridClick;
  end;

var
  fMain: TfMain;
  f:text;
  ff:file;
  sh:array of TCShape;
  l:array of TLabel;


implementation

{$R *.dfm}

uses uOpen, uPict, uHelp, uResult;

function  TFMain.posit;
var i:word;
begin
    i:=1;
    while ((sub<>copy(s,i,2))and(i<length(s))) do inc(i,2);
    if sub=copy(s,i,2) then result:=true
                       else result:=false;
end;

procedure TFMain.SortQ;
var i:integer;
    r1,r2:integer;
begin
    randomize;
    for i:=1 to list.Count do begin
      r1:=random(list.Count);
      r2:=random(list.Count);
      list.Exchange(r1,r2);
    end;
end;

function mpos(sub,s:string):integer;
var i:integer;
begin
    for i:=1 to length(s)-length(sub)+1 do
        if copy(s,i,length(sub))=sub then
           if (i=1)or(s[i-1]=';') then begin
               result:=i;
               break;
           end
           else result:=0
        else result:=0;
end;

procedure TFMain.SortA;
var i,j,k,n,r1,r2:integer;
    s:string;
    sa:string;
    sl,sl2,sl3,sl4:TStringList;
begin
   randomize;

   for j:=0 to list.Count-1 do begin
       tp:=list.Items[j];

       case tp^.typ of

           1:begin
                s:=tp^.answ;
                sl:=TStringList.Create;
                sl.Clear;

                for i:=1 to tp^.colq do begin
                      sl.Add(copy(s,1,pos(';',s)));
                      delete(s,1,pos(';',s));
                end;

                for i:=1 to tp^.colq do begin
                       r1:=random(tp^.colq);
                       r2:=random(tp^.colq);

                    if r1<>r2 then begin
                       if (mpos((inttostr(r1+1)+';'),tp^.cor)>0)and(mpos((inttostr(r2+1)+';'),tp^.cor)=0)
                         then begin
                            delete(tp^.cor,mpos(inttostr(r1+1)+';',tp^.cor),length(inttostr(r1+1))+1);
                            tp^.cor:=tp^.cor+inttostr(r2+1)+';'
                         end
                       else if (mpos((inttostr(r2+1)+';'),tp^.cor)>0)and(mpos((inttostr(r1+1)+';'),tp^.cor)=0)
                         then begin
                            delete(tp^.cor,mpos(inttostr(r2+1)+';',tp^.cor),length(inttostr(r2+1))+1);
                            tp^.cor:=tp^.cor+inttostr(r1+1)+';'

                         end;
                       sl.Exchange(r1,r2);
                    end;
                end;


                s:='';
                for i:=0 to sl.Count-1 do s:=s+sl.Strings[i];
                tp^.answ:=s;

                sl.Free;
             end;
           2:begin
                s:=tp^.answ;
                sl:=TStringList.Create;
                   sl.Clear;
                   for i:=1 to tp^.colq do begin
                      sl.Add(copy(s,1,pos(';',s)));
                      delete(s,1,pos(';',s));
                   end;

                   for i:=1 to tp^.colq do begin
                       r1:=random(tp^.colq);
                       r2:=random(tp^.colq);

                       if pos(inttostr(r1+1)+':',tp^.cor)>0
                          then begin
                                 k:=pos(inttostr(r1+1)+':',tp^.cor);
                                 n:=pos(inttostr(r2+1)+':',tp^.cor);

                                 delete(tp^.cor,k,1);
                                 insert(inttostr(r2+1),tp^.cor,k);

                                 delete(tp^.cor,n,1);
                                 insert(inttostr(r1+1),tp^.cor,n);
                          end
                          else if pos(inttostr(r2+1)+':',tp^.cor)>0 then begin
                                 k:=pos(inttostr(r2+1)+':',tp^.cor);
                                 n:=pos(inttostr(r1+1)+':',tp^.cor);

                                 delete(tp^.cor,k,1);
                                 insert(inttostr(r1+1),tp^.cor,k);

                                 delete(tp^.cor,n,1);
                                 insert(inttostr(r2+1),tp^.cor,n);
                          end;

                       sl.Exchange(r1,r2);
                   end;

                   s:='';
                   for i:=0 to sl.Count-1 do
                      s:=s+sl.Strings[i];

                   tp^.answ:=s;
                sl.Free;
             end;
           3:begin
                 // ничего не тасуется
             end;
           4:begin
                s:=tp^.answ;
                sa:=tp^.cor;
                sl:=TStringList.Create;
                sl2:=TStringList.Create;
                sl.Clear;
                sl2.Clear;

                for i:=1 to tp^.colq do begin
                     sl.Add(copy(s,1,pos(';',s)));
                     delete(s,1,pos(';',s));
                     sl2.Add(sa[1]);
                     delete(sa,1,1);
                end;

                for i:=1 to tp^.colq do begin
                       r1:=random(tp^.colq);
                       r2:=random(tp^.colq);

                       if (r1<>r2) then begin
                           sl.Exchange(r1,r2);
                           sl2.Exchange(r1,r2);
                       end;
                end;

                s:='';
                sa:='';
                for i:=0 to sl.Count-1 do begin
                    s:=s+sl.Strings[i];
                    sa:=sa+sl2.Strings[i];
                end;

                tp^.answ:=s;
                tp^.cor:=sa;

                sl.Free;
                sl2.Free;
             end;
           5:begin
                s:=tp^.answ;
                sa:=tp^.cor;
                sl:=TStringList.Create;
                sl2:=TStringList.Create;
                sl3:=TStringList.Create;
                sl4:=TStringList.Create;
                sl.Clear;
                sl2.Clear;
                sl3.Clear;
                sl4.Clear;

                for i:=1 to tp^.colq do begin
                     sl.Add(copy(s,1,pos(';',s)));
                     delete(s,1,pos(';',s));
                     sl2.Add(copy(s,1,pos(';',s)));
                     delete(s,1,pos(';',s));

                     sl3.Add(sa[1]);
                     delete(sa,1,1);
                     sl4.Add(sa[1]);
                     delete(sa,1,1);
                end;

                for i:=1 to tp^.colq do begin
                       r1:=random(tp^.colq);
                       r2:=random(tp^.colq);

                       sl.Exchange(r1,r2);
                       sl4.Exchange(r1,r2);

                   {    r1:=random(tp^.colq);
                       r2:=random(tp^.colq);
                                                     ???????????????????
                       sl4.Exchange(r1,r2);
                       sl2.Exchange(r1,r2);      }
                end;

                s:='';
                sa:='';
                for i:=0 to sl.Count-1 do begin
                    s:=s+sl.Strings[i];
                    s:=s+sl2.Strings[i];

                    sa:=sa+sl3.Strings[i];
                    sa:=sa+sl4.Strings[i];
                end;

                tp^.answ:=s;
                tp^.cor:=sa;

                sl.Free;
                sl2.Free;
                sl3.Free;
                sl4.Free;
             end;
       end;

   end;
end;

procedure TfMain.DelDynam;
var i:word;
begin
  if length(sh)>0 then begin
     for i:=0 to length(sh)-1 do begin
         sh[i].Free;
         l[i].Free;
     end;
     setlength(sh,0);
     setlength(l,0);
  end;
end;

procedure TfMain.ch;
begin
  with sender as TCShape do
    begin
      Tag:=Tag+1;
      if tag > tp^.colq then tag:=1;
      Repaint;
    end;
end;

function TfMain.AllAnsw;
var i:word;
    pa:PTAnswer;
begin
    i:=0;
    result:=true;
    repeat
        pa:=lista.Items[i];
        if pa^.is_done=false then result:=false;
        inc(i);
    until (pa^.is_done=false) or (i=lista.Count);
end;

function TfMain.GetWord;
var i:word;
begin
     // четный первый 23
     if chet then n:=2*n-1
             else n:=n*2;

     for i:=1 to n-1 do delete(st,1,pos(';',st));        

     delete(st,pos(';',st),length(st));
     result:=st;
end;


procedure TfMain.LoadTP(x:word);
var i:word;
    s:string;
    sa:string;
    pa:PTAnswer;
begin
    memo.Clear;
    tp:=list.Items[x-1];
    label2.Caption:='Вопрос '+inttostr(x)+' из '+inttostr(list.Count);
    pa:=lista.Items[x-1];
    fHelp.Hide;

    if tp^.pic<>'no' then begin
                            if FileExists(path+'images\'+tp^.pic) then begin
                              fPict.Hide;
                              fPict.pic:=Tbitmap.Create;
                              fPict.Pic.LoadFromFile(path+'images\'+tp^.pic);
                              fPict.Show;
                              bitbtn1.Visible:=true;
                            end
                            else showmessage('Не удалось найти файл с изображением!');
                          end
                     else begin
                        bitbtn1.Visible:=false;
                        fPict.Hide;
                     end;

    case tp.typ of
      2:begin
            DelDynam;

            gb.Visible:=false;
            gbe.Visible:=false;
            gblb.Visible:=false;
            rg.Visible:=true;
            bitbtn6.Visible:=false;
            rg.Items.Clear;
            s:=tp.answ;
            for i:=1 to tp.colq do begin
                  rg.Items.Add(copy(s,1,pos(';',s)-1));
                  delete(s,1,pos(';',s));
            end;

            if pa^.is_done then rg.ItemIndex:=strtoint(pa^.answ)-1
                           else rg.ItemIndex:=0;

        end;
      1:begin
            DelDynam;

            gb.Visible:=true;
            gbe.Visible:=false;
            rg.Visible:=false;
            bitbtn6.Visible:=false;
            gblb.Visible:=false;
            clb.Items.Clear;
            s:=tp.answ;
            for i:=1 to tp.colq do begin
                clb.Items.Add(copy(s,1,pos(';',s)-1));
                delete(s,1,pos(';',s));
            end;

            if pa^.is_done then begin
               s:=pa^.answ;
               if s<>'' then
                  repeat
                     clb.Checked[strtoint(copy(s,1,(pos(';',s))-1))-1]:=true;
                     delete(s,1,pos(';',s));
                  until s='';
            end;
        end;
      3:begin
            DelDynam;

            gb.Visible:=false;
            gbe.Visible:=true;
            gblb.Visible:=false;
            rg.Visible:=false;
            bitbtn6.Visible:=false;

            if tp^.colq=1 then bitbtn6.Visible:=true;

            if pa^.is_done then edit1.Text:=pa^.answ
                           else edit1.Text:='';
        end;
      4:begin
            gb.Visible:=false;
            gbe.Visible:=false;
            rg.Visible:=false;
            gblb.Visible:=false;
            bitbtn6.Visible:=false;
            clb.Items.Clear;

            DelDynam;

            setlength(sh,tp^.colq);
            setlength(l,tp^.colq);

            s:=tp.answ;
            if pa^.is_done then sa:=pa^.answ;

            for i:=0 to tp^.colq-1 do begin
              sh[i]:=TCShape.Create(self);
              sh[i].Parent:=self;
              sh[i].Left:=50;
              sh[i].Top:=40*i+200;
              sh[i].Width:=35;
              sh[i].Height:=35;
              sh[i].Shape:=stCircle;
              sh[i].OnMouseDown:=ch;
              sh[i].Pen.Width:=2;
              sh[i].Canvas.Font.Name:='Verdana';
              sh[i].Canvas.Font.Size:=14;
              sh[i].Canvas.Font.Style:=sh[i].Canvas.Font.Style+[fsBold];
              sh[i].Canvas.Font.Color:=clRed;

              if pa^.is_done then begin
                                      sh[i].Tag:=strtoint(sa[1]);
                                      delete(sa,1,1);
                                  end
              else sh[i].Tag:=i+1;

              sh[i].Repaint;

              l[i]:=TLabel.Create(self);

              l[i].Caption:=copy(s,1,pos(';',s)-1);
              delete(s,1,pos(';',s));

              l[i].Parent:=self;
              l[i].Left:=100;
              l[i].Top:=40*i+212;
          end;
        end;
      5:begin
            gb.Visible:=false;
            gbe.Visible:=false;
            rg.Visible:=false;
            bitbtn6.Visible:=false;
            DelDynam;
            gblb.Visible:=true;
            lb1.Clear;
            lb2.Clear;
            lb3.Clear;


            if pa^.is_done
            then begin
                sa:=pa^.answ;
                s:=tp.answ;
                for i:=1 to tp^.colq do begin
                    lb3.Items.Add(sa[1]+'. '+GetWord(s,strtoint(sa[1]),true)+' <-> '+sa[2]+'. '+GetWord(s,strtoint(sa[2]),false));
                    delete(sa,1,2);
                end;
            end
            else begin
                s:=tp.answ;
                for i:=1 to tp^.colq do begin
                    lb1.Items.Add(inttostr(i)+'. '+copy(s,1,pos(';',s)-1));
                    delete(s,1,pos(';',s));
                    lb2.Items.Add(inttostr(i)+'. '+copy(s,1,pos(';',s)-1));
                    delete(s,1,pos(';',s));
                end;
            end;

            lb1.ItemIndex:=0;
            lb2.ItemIndex:=0;
            lb3.ItemIndex:=0;
      end;

    end;
    memo.Clear;
    memo.Lines.Add(tp.fq);
end;

procedure TCShape.Paint;
begin
  inherited Paint;
  Canvas.TextOut(11,5,inttostr(Tag));
end;

procedure TfMain.GetResult;
var col_vp,col_np,col_pr,col_nep:word;
    s,oc:string;
    s1:string;
    sum_cor,proc:integer;
    sum_given:real;
    tek_ves:real;
    i,j:word;
    pa:PTAnswer;
    pt:PTQuest;
    resultRec: TResultRec;
begin
   BitBtn4.Enabled:=false;
   timer1.Enabled:=false;
   fPict.Hide;

   sum_cor:=0;
   sum_given:=0.0;

   for j:=0 to list.Count-1 do begin
        pt:=list.Items[j];
        pa:=lista.Items[j];

        with ThemesList[pt^.tema-1] do begin
          PointsTotal := PointsTotal+pt^.ves;
        end;

        case pt^.typ of
          1:begin
              sum_cor:=sum_cor+pt^.ves;

              if pa^.is_done then begin
                s:=pt^.cor;
                s1:=pa^.answ;

           //     showmessage('Правильные: '+s+#10#13+'Ответы введены'+s1);

                col_vp:=0;
                col_np:=0;
                col_pr:=0;
                col_nep:=0;

                for i:=1 to length(s) do if s[i]=';' then inc(col_pr);

                col_nep:=pt^.colq-col_pr;

         //       showmessage('Количество правильных ответов: '+inttostr(COL_PR)+'Количество неправильных: '+inttostr(col_nep));

                repeat
                   if pos(copy(s,1,pos(';',s)),s1)>0 then begin
                       inc(col_vp);
                       delete(s1,pos(copy(s,1,pos(';',s)),s1),length(copy(s,1,pos(';',s))));    //!!!!
                   end;
              //     else inc(col_np);
                   delete(s,1,pos(';',s));
                until (s='');

                for i:=1 to length(s1) do if s1[i]=';' then inc(col_np);

                if col_nep<>0 then tek_ves:=(pt^.ves/col_pr)*col_vp - (pt^.ves/col_nep)*col_np
                              else tek_ves:=(pt^.ves/col_pr)*col_vp;

                if tek_ves<0 then tek_ves:=0.0;

                with ThemesList[pt^.tema-1] do begin
                   PointsForTheme := PointsForTheme+tek_ves;
                end;

                sum_given:=sum_given+tek_ves;
              end;
            end;
          2:begin
               sum_cor:=sum_cor+pt^.ves;
               if pa^.is_done then begin
        //        showmessage(pa^.answ+':'+#13#10+pt^.cor);
                   i:=pos(pa^.answ+':',pt^.cor)+2;
                   s:='';
                   while pt^.cor[i]<>';' do begin
                       s:=s+pt^.cor[i];
                       inc(i);
                   end;

                   with ThemesList[pt^.tema-1] do
                     PointsForTheme := PointsForTheme+pt^.ves*strtoint(s)/100;

                   sum_given:=sum_given+pt^.ves*strtoint(s)/100;
               end;
            end;
          3:begin
             sum_cor:=sum_cor+pt^.ves;
             if pa^.is_done then begin
               s:=pt^.answ;

             for i:=1 to length(s) do
                if (ord(s[i])>191)and(ord(s[i])<224) then s[i]:=chr(ord(s[i])+32);

            lowercase(s);

               repeat
                 if pa^.answ=copy(s,1,pos(';',s)-1) then break;
                 delete(s,1,pos(';',s));
               until (s='');
               if s<>'' then begin
                 sum_given:=sum_given+pt^.ves;
                 with ThemesList[pt^.tema-1] do
                   PointsForTheme := PointsForTheme+pt^.ves;
               end;
               end;
            end;

          4:begin
               sum_cor:=sum_cor+pt^.ves;
               if pa^.is_done then begin
                  col_vp:=0;
                  s:=pt^.cor;

                  s1:=pa^.answ;

                  for i:=1 to length(s) do
                      if s[i]=s1[i] then inc(col_vp);

                with ThemesList[pt^.tema-1] do
                   PointsForTheme := PointsForTheme+(pt^.ves/pt^.colq)*col_vp;

                  sum_given:=sum_given+(pt^.ves/pt^.colq)*col_vp;
               end;
            end;
          5:begin
               sum_cor:=sum_cor+pt^.ves;
               if pa^.is_done then begin
                  s:=pt^.cor;
                  s1:=pa^.answ;
                  col_vp:=0;

                  for i:=1 to pt^.colq do begin
                       if posit(copy(s1,1,2),s) then inc(col_vp);
                       delete(s1,1,2);
                  end;

                with ThemesList[pt^.tema-1] do
                   PointsForTheme := PointsForTheme+(pt^.ves/pt^.colq)*col_vp;

                  sum_given:=sum_given+(pt^.ves/pt^.colq)*col_vp;
               end;
            end;
        end;
   end;
   
   proc:=round(sum_given*100/sum_cor);
   if proc<oc_3 then oc:='Неудовлетворительно'
   else if proc<oc_4 then oc:='Удовлетворительно'
        else if proc<oc_5 then oc:='Хорошо'
             else oc:='Отлично';

{   repeat
      messagedlg('Из '+inttostr(sum_cor)+' возможных баллов получено '+floattostrf(sum_given,ffFixed,10,5)+#13#10+'Процент правильных ответов: '+inttostr(proc) +'%'+#10#13+'Оценка: '+oc+#10#13+'Время выполнения теста: '+timetostr(total_time-time),mtInformation,[mbOk],0)
   until messagedlg('Вы действительно хотите закрыть окно с результатами?',mtConfirmation,[mbOK,mbCancel],0)=mrOk;
}

  with resultRec do begin
    PointsMax := sum_cor;
    PointsGained := sum_given;
    TestTime := total_time-time;
    Mark := oc;
  end;
  
  fmResults.SetThemes(ThemesList);
  fmResults.SetStatistic(resultRec);
  fmResults.ShowModal;
end;

procedure TfMain.BitBtn2Click(Sender: TObject);
begin
if (AllAnsw)or(IsComplete)
  then GetResult
  else if messagedlg('Вы действительно хотите прервать тест и получить результат?',mtConfirmation,[mbOk,mbCancel],0)=mrOk
     then begin
        IsComplete:=true;
        GetResult;
     end;
end;

procedure TfMain.FormCreate(Sender: TObject);
var HTaskbar: HWND;
OldVal: LongInt;
begin
     list:=tlist.Create;
     lista:=tlist.Create;
     bitbtn2.Enabled:=false;
     new(tp);
     randomize;
//----------------------------
try

  // Find handle of TASKBAR
  HTaskBar := FindWindow('Shell_TrayWnd', nil);
  // Turn SYSTEM KEYS off, Only Win 95/98/ME
  SystemParametersInfo(97, Word(True), @OldVal, 0);
  // Disable the taskbar
  EnableWindow(HTaskBar, False);
  // Hide the taskbar
  ShowWindow(HTaskbar, SW_HIDE);
 finally
  with fMain do
  begin
  BorderStyle:=bsNone;
  FormStyle:=fsStayOnTop;
  Left:=0;
  Top:=0;
  Height:=Screen.Height;
  Width:=Screen.Width;
  end;
 end;  
end;

procedure TfMain.FormClose(Sender: TObject; var Action: TCloseAction);
var HTaskbar: HWND;
 OldVal: LongInt;
begin
  list.Free;
  lista.Free;
  dispose(tp);
//------------------------------
  fmain.FormStyle:=fsNormal;
//Find handle of TASKBAR
 HTaskBar := FindWindow('Shell_TrayWnd', nil);
 //Turn SYSTEM KEYS Back ON, Only Win 95/98/ME  
 SystemParametersInfo(97, Word(False), @OldVal, 0);
 //Enable the taskbar  
 EnableWindow(HTaskBar, True); 
 //Show the taskbar  
 ShowWindow(HTaskbar, SW_SHOW);
end;

procedure CriptFile(fn:string;d:boolean);
var fb:file;
    s:string;
    x:word;
    i:longint;
begin
   assignfile(fb,fn);
   reset(fb,1);
   s:='';
      while not eof(fb) do begin
          blockread(fb,x,1);
          if d then s:=s+chr(x+1)
               else s:=s+chr(x-1);
      end;
   closefile(fb);
   rewrite(fb,1);
      for i:=1 to length(s) do begin
           x:=ord(s[i]);
           blockwrite(fb,x,1);
      end;
   closefile(fb);
end;

procedure TfMain.N3Click(Sender: TObject);
var pz:PTQuest;
    pa:PTAnswer;
    s,st,tem:string;
    i,col:integer;
    x:word;
    tn,tc:integer;
    stream: TFileStream;
    lst: TStringList;
    theme: TTheme;
begin
     fOpenTest.fl.Directory:=ExtractFilePath(application.ExeName)+'tests\';

     if (fOpenTest.ShowModal=mrOK)and(fOpenTest.fl.FileName<>'') then begin

     tem:='';

// расшифровка файла

   stream := TFileStream.Create(fOpenTest.fl.FileName,fmOpenRead);
   SetLength(s,stream.size);
   stream.Read(s[1],stream.Size);

   for i:=1 to Length(s) do
      s[i] := char(ord(s[i])-1);

   lst := TStringList.Create;
   lst.Text := s;

   oc_3 := StrToInt(lst[0]);
   oc_4 := StrToInt(lst[1]);
   oc_5 := StrToInt(lst[2]);
   time := StrToTime(lst[3]);
   total_time := time;
   path := lst[4];
   show_type := StrToInt(lst[5]);

   for i:=6 to lst.Count-1 do
     tem:=tem+lst[i];

   SetLength(s,0);
   lst.free;
   stream.Free;

       st:=path;
       delete(st,length(st),1);
       s:='';
       while st[length(st)]<>'\' do begin
           s:=st[length(st)]+s;
           delete(st,length(st),1);
       end;

   if FileExists(path+s)=false then begin
     showmessage('Не правильно указан путь к базе');
     exit;
   end;


//Загрузка тем из файла тем 
   stream := TFileStream.Create(path+'\tema',fmOpenRead);
   SetLength(st,stream.size);
   stream.Read(st[1],stream.Size);
   stream.Free;

   for i:=1 to Length(st) do
      st[i] := char(ord(st[i])-1);

   st := AnsiReplaceStr(st,'¤',#13#10);
   lst := TStringList.Create;
   lst.Text := st;

   SetLength(ThemesList,Strtoint(lst[0]));
   for i:= 0 to High(ThemesList) do with ThemesList[i] do begin
     Name := lst[i*2+1];
     PointsForTheme := 0.0;
     PointsTotal := 0.0;
   end;

   SetLength(st,0);
   lst.Free;

   //Загрузка вопросов
       if FileExists(path+s)=false then begin
           showmessage('Не правильно указан путь к базе');
           exit;
       end;

    stream := TFileStream.Create(path+s,fmOpenRead);
    SetLength(s,stream.size);
    stream.Read(s[1],stream.Size);
    stream.Free;

    for i:=1 to Length(s) do
      s[i] := chr(ord(s[i])-1);

       list.Clear;
       lista.Clear;

       listo:=Tlist.Create;

       repeat
           new(pz);
           // номер
           pz^.n:=strtoint( copy(s,1,pos('¤',s)-1) );
           delete(s,1,pos('¤',s));
           
           //тип
           pz^.typ:=strtoint(s[1]);
           delete(s,1,pos('¤',s));

           //кол-во вариантов ответа
           pz^.colq:=strtoint(copy(s,1,pos('¤',s)-1));
           delete(s,1,pos('¤',s));

           //формулировка
           pz^.fq:=copy(s,1,pos('¤',s)-1);
           delete(s,1,pos('¤',s));

           //фарианты ответов
           pz^.answ:=copy(s,1,pos('¤',s)-1);
           delete(s,1,pos('¤',s));

           // имя картинки (если нет, то "no")
           pz^.pic:=copy(s,1,pos('¤',s)-1);
           delete(s,1,pos('¤',s));

           // правильные ответы
           pz^.cor:=copy(s,1,pos('¤',s)-1);
           delete(s,1,pos('¤',s));

           //вес
           pz^.ves:=strtoint(copy(s,1,pos('¤',s)-1));
           delete(s,1,pos('¤',s));

           //тема
           pz^.tema:=strtoint(copy(s,1,pos('¤',s)-1));
           delete(s,1,pos('¤',s));

           //доступность
           pz^.enab:=strtoint(copy(s,1,pos('¤',s)-1));
           delete(s,1,pos('¤',s));
           
           listo.Add(pz);

       until (s='');
       SetLength(s,0);

      list_temp:=TList.Create;

      repeat
         list_temp.Clear;
         tn:=strtoint(copy(tem,1,pos(':',tem)-1));

         delete(tem,1,pos(':',tem));
         tc:=strtoint(copy(tem,1,pos(';',tem)-1));
         delete(tem,1,pos(';',tem));

         for i:=0 to listo.Count-1 do
            if (PTQuest(listo.Items[i])^.tema=tn)and(PTQuest(listo.Items[i])^.enab=0)
               then list_temp.Add(listo.Items[i]);

         col:=list_temp.Count-tc;
         for i:=1 to col do
            list_temp.Delete(random(list_temp.count));

         for i:=1 to list_temp.Count do
            list.Add(list_temp.Items[i-1]);

      until tem='';


      listo.Free;
      list_temp.Free;

      for i:=1 to list.count do begin
          sg.Cells[i-1,0]:=inttostr(i);
          new(pa);
          pa^.is_done:=false;
          pa^.n:=i;
          lista.Add(pa);
       end;

       SortQ;  // сортировка списка вопросов
       SortA;

       tekq:=1;


       BitBtn2.Enabled:=true;
       sg.Enabled:=true;
       sg.ColCount:=list.Count;
       sg.Col:=0;

       loadTP(1);

       IsComplete:=false;

       bitbtn4.Enabled:=true;

       timer1.Enabled:=true;
       label4.Caption:='Время:';
       label4.Visible:=true;

       fMain.Caption:='Экзаменатор v1.0 - '+ExtractFileName(fOpenTest.fl.FileName);
       statusbar1.SimpleText:='Тест: '+ExtractFileName(fOpenTest.fl.FileName);

       if show_type=3 then sg.Enabled:=false;
    end;
end;

procedure TfMain.N5Click(Sender: TObject);
begin
   application.Terminate;
end;

procedure TfMain.FormShow(Sender: TObject);
begin
    bitbtn4.Left:=(gblb.Width div 2)-50;
    bitbtn1.Left:=bitbtn4.Left+bitbtn4.Width+10;
    bitbtn6.Left:=bitbtn4.Left-bitbtn6.Width-10;

    edit1.Left:=(gblb.Width div 2)-150;
    edit1.Top:=gblb.Top+(gblb.Height div 2)-150;

    lb1.Left:=(gblb.Width div 2)-473 {div 31};
    bitbtn3.Left:=lb1.Left+415;
    lb2.Left:=lb1.Left+546;
    lb3.Left:=lb1.Left+144;
    bitbtn5.Left:=lb1.Left+368;

    IsComplete:=false;
end;

procedure TfMain.Timer1Timer(Sender: TObject);
begin
   time:=time-strtotime('0:00:01');
   label4.Caption:='Время: '+timetostr(time);
   if timetostr(time)='0:00:00'
      then begin
          messagedlg('Время теста закончилось!',mtInformation,[mbOK],0);
          Timer1.Enabled:=false;
          IsComplete:=true;
          GetResult;
      end;
end;

procedure TfMain.sgClick(Sender: TObject);
begin
// пока ничего

end;

function DelSpace(s:string):string;
begin
   if length(s)>0 then
       while (length(s)<>0)and(s[1]=' ') do delete(s,1,1);
   if length(s)>0 then
       while (length(s)<>0)and(s[length(s)]=' ') do delete(s,length(s),1);
   result:=s;
end;

procedure TfMain.BitBtn4Click(Sender: TObject);
var pa:PTAnswer;
    i:word;
    dig:string;
begin
    pa:=lista.Items[tekq-1];
    fPict.Hide;

    case tp.typ of

       1:begin
             pa^.answ:='';
             for i:=1 to tp.colq do
                if clb.Checked[i-1] then pa^.answ:=pa^.answ+inttostr(i)+';';
         end;
       2:begin
           pa^.answ:=inttostr(rg.itemindex+1);
         end;
       3:begin
           dig:=edit1.Text;
           for i:=1 to length(dig) do
              if (ord(dig[i])>191)and(ord(dig[i])<224) then dig[i]:=chr(ord(dig[i])+32);

           lowercase(dig);
           pa^.answ:=dig;

           // тут надо проверять не пустая ли строка!!!!!
           pa^.answ:=DelSpace(pa^.answ);
         end;
       4:begin
            dig:='123456789';
            dig:=copy(dig,1,tp.colq);

            for i:=1 to tp.colq do
                if pos(inttostr(sh[i-1].tag),dig)>0 then delete(dig,pos(inttostr(sh[i-1].tag),dig),1);

            if dig<>'' then begin
                messagedlg('Последовательность некорректна! Присутствуют повторы!',mtWarning,[mbOK],0);
                exit;
            end;

            pa^.answ:='';

            for i:=1 to tp.colq do
                pa^.answ:=pa^.answ+inttostr(sh[i-1].Tag);
         end;
       5: begin
            if lb3.Count=tp.colq then begin
                 pa^.answ:='';
                 for i:=0 to tp.colq-1 do begin
                       dig:=lb3.Items.Strings[i];
                       pa^.answ:=pa^.answ + dig[1]+dig[pos('<->',dig)+4];
                 end;

            end
            else begin
                 messagedlg('Установлены не все соответствия!',mtWarning,[mbOk],0);
                 exit;
            end;
            
          end;
    end;
    pa^.is_done:=true;

    if AllAnsw then begin
        messagedlg('Получены ответы на все вопросы!'+#10#13+'Чтобы проверить тест и получить оценку нажмите кнопку Результат'+#10#13+'Для редактирования ответов необходимо перейти к нужному вопросу и внести изменения!',mtInformation,[mbOk],0);
        BitBtn2.Enabled:=true;
        exit;
    end;

   // if tekq<>list.Count then begin
    while (tekq<>list.Count)and(PTAnswer(lista.Items[tekq-1])^.is_done=true) do inc(tekq);

    if  not(PTAnswer(lista.Items[tekq-1])^.is_done) then begin
        sg.Col:=tekq-1;
        loadTP(tekq);
    end
    else begin
        tekq:=1;
        while (PTAnswer(lista.Items[tekq-1])^.is_done=true) do inc(tekq);
        sg.Col:=tekq-1;
        loadTP(tekq);
    end;


end;

procedure TfMain.sgDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var pa:PTAnswer;
begin
 if list.Count>0 then begin
  pa:=lista.Items[acol];

  if pa^.is_done then
    with  sg.Canvas do begin
       Brush.Color:=$39AE39;
       Font.Color:=clWhite;
       FillRect(Rect);
       TextOut(Rect.Right-8-TextWidth(TStringGrid(Sender).cells[acol,arow]),Rect.Top+2,TStringGrid(Sender).cells[acol,arow])
    end;
 end;
end;

procedure TfMain.N1Click(Sender: TObject);
begin
  SetLength(ThemesList,0);
   close;
end;

procedure TfMain.BitBtn1Click(Sender: TObject);
begin
if FileExists(path+'images\'+tp^.pic) then begin
    fPict.pic:=Tbitmap.Create;
    fPict.Pic.LoadFromFile(path+'images\'+tp^.pic);
    fPict.Show;
end
else showmessage('Не удалось найти файл с изображением!');
end;

procedure TfMain.BitBtn3Click(Sender: TObject);
begin
  if (lb1.ItemIndex=-1)or(lb2.ItemIndex=-1) then showmessage('Не выбраны элементы для установления соответствия!')
  else begin
     lb3.Items.Add(lb1.Items.Strings[lb1.itemindex]+' <-> '+lb2.Items.Strings[lb2.itemindex]);
     lb1.Items.Delete(lb1.itemindex);
     lb2.Items.Delete(lb2.itemindex);
     if lb1.Items.Count>0 then lb1.ItemIndex:=0;
     if lb2.Items.Count>0 then lb2.ItemIndex:=0;     
  end;

end;

procedure TfMain.BitBtn5Click(Sender: TObject);
var s:string;
begin
   if lb3.ItemIndex=-1 then showmessage('Не выбран вариант для разбиения!')
   else begin
      s:=lb3.Items.Strings[lb3.itemindex];
      lb1.Items.Add(copy(s,1,pos('<->',s)-2));
      delete(s,1,pos('<->',s)+3);
      lb2.Items.Add(s);
      lb3.Items.Delete(lb3.ItemIndex);
   end;
end;

procedure TfMain.BitBtn6Click(Sender: TObject);
begin
   if FileExists(path+'\images\help_f.bmp')=true then begin
       fHelp.path:=path+'\images\';
       fHelp.Show;
   end
   else showmessage('Не найден файл подсказки!');
end;


procedure TfMain.GridClick;
begin
 case show_type of
      0:begin
              tekq:=strtoint(sg.cells[sg.Col,0]);
              loadTP(tekq);
        end;
      1:begin
              if not(PTAnswer(lista.Items[strtoint(sg.cells[sg.Col,0])-1])^.is_done) then begin
                   tekq:=strtoint(sg.cells[sg.Col,0]);
                   loadTP(tekq);
              end
              else sg.Col:=tekq-1;
        end;
      2:begin
              if (PTAnswer(lista.Items[strtoint(sg.cells[sg.Col,0])-1])^.is_done) then begin
                   tekq:=strtoint(sg.cells[sg.Col,0]);
                   loadTP(tekq);
              end
              else begin
                    if (PTAnswer(lista.Items[tekq-1])^.is_done)and(not(AllAnsw)) then
                      BitBtn4Click(Self);
                      // showmessage('Чтобы перейти к следующему неотвеченному вопросу нажмите OK!');
                    sg.Col:=tekq-1;
              end;
        end;
      3:begin
              sg.Col:=tekq-1;
        end;
  end;
end;

procedure TfMain.sgMouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
      GridClick;
end;

procedure TfMain.sgKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      GridClick;
end;

end.
