{
 * FILE: main.pas
 *
 * DESCRIPTION: IconListEditor Main unit
 *
 * CREATED BY: alexdnepro 12-2014
 *
}
unit main;

interface

uses
  Windows, ImagingTypes, imaging, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ieview, imageenview, ieopensavedlg, ImgList, inifiles, hyiedefs, hyieutils,
  acAlphaImageList, Mask, sMaskEdit, sCustomComboEdit, Buttons,imageenio,
  sSpeedButton, ExtCtrls, sEdit, ImagingComponents, ImagingClasses, ClipBrd,
  Menus, acPathDialog, sSkinManager, sSkinProvider, sToolEdit;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    sSpeedButton1: TsSpeedButton;
    sSpeedButton2: TsSpeedButton;
    sSpeedButton3: TsSpeedButton;
    FindBut: TButton;
    sAlphaImageList1: TsAlphaImageList;
    op: TOpenImageEnDialog;
    im: TImageEnView;
    FindEdit: TsEdit;
    IconNameEdit: TsEdit;
    AddIconBut: TButton;
    Timer1: TTimer;
    Ramka: TCheckBox;
    OpenBut: TsSpeedButton;
    SaveBut: TsSpeedButton;
    ImageListPopup: TPopupMenu;
    CopyToClip: TMenuItem;
    SaveAs: TMenuItem;
    SaveDlg: TSaveImageEnDialog;
    SplitImageBut: TsSpeedButton;
    GlueImagesBut: TsSpeedButton;
    SelPath: TsPathDialog;
    JpgSel: TRadioButton;
    BmpSel: TRadioButton;
    JpegQuality: TsEdit;
    sSkinManager1: TsSkinManager;
    PNGSel: TRadioButton;
    sSkinProvider1: TsSkinProvider;
    file1: TsFilenameEdit;
    file2: TsFilenameEdit;
    procedure file1BeforeDialog(Sender: TObject; var Name: string;
      var Action: Boolean);
    procedure OpenButClick(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure sSpeedButton2Click(Sender: TObject);
    procedure sSpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imDblClick(Sender: TObject);
    procedure imDrawBackBuffer(Sender: TObject);
    procedure imMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FindButClick(Sender: TObject);
    procedure IconNameEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AddIconButClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure imClick(Sender: TObject);
    procedure CopyToClipClick(Sender: TObject);
    procedure SaveAsClick(Sender: TObject);
    procedure SaveButClick(Sender: TObject);
    procedure SplitImageButClick(Sender: TObject);
    procedure imZoomIn(Sender: TObject; var NewZoom: Double);
    procedure imZoomOut(Sender: TObject; var NewZoom: Double);
    procedure GlueImagesButClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GridPos ( view: TImageEnView; col, row: integer ): TPoint;
    procedure SelectIm;
    procedure RefreshSizes;
    procedure LoadImage(im: TImageEnView; fn: string);
  end;

var
  MainForm: TMainForm;
  w,h,rows,cols:integer;
  ImageWidth: integer;
  ImageHeight: integer;
  imgselc,imgselr:integer;
  load:boolean = false;
  lst: TStringList;
  CurSel: integer = -1;
  LastAddName: string;

implementation

uses ProgressForm, GlueParam;

{$R *.dfm}

function StringToWideString(const s: AnsiString; codePage: Word): WideString;
var
  l: integer;
begin
  if s = '' then
    Result := ''
  else
  begin
    l := MultiByteToWideChar(codePage, MB_PRECOMPOSED, PAnsiChar(@s[1]), - 1, nil, 0);
    SetLength(Result, l - 1);
    if l > 1 then
      MultiByteToWideChar(CodePage, MB_PRECOMPOSED, PAnsiChar(@s[1]),
        - 1, PWideChar(@Result[1]), l - 1);
  end;
end;

function WideStringToString(const ws: WideString; codePage: Word): AnsiString;
var
  l: integer;
begin
  if ws = '' then
    Result := ''
  else
  begin
    l := WideCharToMultiByte(codePage,
      WC_COMPOSITECHECK or WC_DISCARDNS or WC_SEPCHARS or WC_DEFAULTCHAR,
      @ws[1], - 1, nil, 0, nil, nil);
    SetLength(Result, l - 1);
    if l > 1 then
      WideCharToMultiByte(codePage,
        WC_COMPOSITECHECK or WC_DISCARDNS or WC_SEPCHARS or WC_DEFAULTCHAR,
        @ws[1], - 1, @Result[1], l - 1, nil, nil);
  end;
end;

procedure TMainForm.FindButClick(Sender: TObject);
  var
    a:integer;
    s: string;
begin
  if FindEdit.Text='' then Exit;
  s := widelowercase(FindEdit.Text);
  for a := 4 to lst.Count-1 do
  if s = widelowercase(lst[a]) then
  begin
    imgselr:=trunc((a-4)/cols);
    imgselc:=a-4-imgselr*cols;
    im.ViewX:=imgselc*w;
    im.ViewY:=imgselr*h;
    SelectIm;
    im.SelectionOptions := [iesoMarkOuter, iesoAnimated];
    im.Refresh;
    exit;
  end;
end;

procedure TMainForm.AddIconButClick(Sender: TObject);
  var
    TmpIM: TImageEnView;
    a, x, y: integer;
    f, o: integer;
begin
  op.Options := [ofExtensionDifferent, ofFileMustExist, ofAllowMultiSelect];
  if (not load) or (not op.Execute) then exit;
  try
    im.LockPaint;
    TmpIm := TImageEnView.Create(MainForm);
    for a := 0 to op.Files.Count - 1 do
    begin
      LastAddName := changefileext(widelowercase(extractfilename(op.Files[a])), '.dds');
      lst.Add(LastAddName);
      y := trunc((lst.Count-5)/cols);
      x := lst.Count-5-y*cols;
      x := x * w;
      y := y * h;
      f := trunc((lst.Count - 4) / cols);
      o := (lst.Count - 4) - (f * cols);
      if o > 0 then inc(f);
      if rows < f then
      begin
        lst[2] := inttostr(rows + 1);
        RefreshSizes;
      end;
      if y >= im.IEBitmap.Height  then
      begin
        im.Background := 0;
        im.Proc.ImageResize(im.IEBitmap.Width, im.IEBitmap.Height * 2);
      end;
      if not Ramka.Checked then
      begin
        LoadImage(TmpIm, op.Files[a]);
        TmpIm.IEBitmap.RenderToCanvasWithAlpha(im.IEBitmap.Canvas, x, y, w, h, 0, 0, TmpIm.Bitmap.Width, TmpIm.Bitmap.Height, 255, rfBicubic);
        TmpIm.IEBitmap.AlphaChannel.RenderToCanvasWithAlpha(im.IEBitmap.AlphaChannel.Canvas, x, y, w, h, 0, 0, TmpIm.Bitmap.Width, TmpIm.Bitmap.Height, 255, rfBicubic);
      end else
      begin
        TmpIm.IO.LoadFromResource(Application.ExeName, 'Bitmap', 'BlankIcon', ioBMP);
        TmpIm.IEBitmap.RenderToCanvasWithAlpha(im.IEBitmap.Canvas, x, y, w, h, 0, 0, TmpIm.Bitmap.Width, TmpIm.Bitmap.Height, 255, rfNone);
        TmpIm.IEBitmap.AlphaChannel.RenderToCanvasWithAlpha(im.IEBitmap.AlphaChannel.Canvas, x, y, w, h, 0, 0, TmpIm.Bitmap.Width, TmpIm.Bitmap.Height, 255, rfNone);
        LoadImage(TmpIm, op.Files[a]);
        TmpIm.IEBitmap.RenderToCanvasWithAlpha(im.IEBitmap.Canvas, x+2, y+2, w-4, h-4, 0, 0, TmpIm.Bitmap.Width, TmpIm.Bitmap.Height, 255, rfBicubic);
      end;
    end;
    Timer1.Enabled := true;
  finally
    TmpIm.Free;
    im.UnLockPaint;
  end;
end;

procedure TMainForm.OpenButClick(Sender: TObject);
begin
  if (file1.FileName = '') or (file2.FileName = '') then
  begin
    ShowMessage('Select both files');
  end;
  if not fileexists(file1.Filename) then
  begin
    ShowMessage(file1.Filename+' not found');
    Exit;
  end;
  if not fileexists(file2.Filename) then
  begin
    ShowMessage(file2.Filename+' not found');
    Exit;
  end;
  try
    OpenBut.Enabled := False;
    LoadImage(im, file1.FileName);
    im.ViewX := 0;
    im.ViewY := 0;
    lst.LoadFromFile(file2.FileName, TEncoding.GetEncoding(936));
    RefreshSizes;
    imgselc:=-1;imgselr:=-1;
    CurSel := -1;
    load := true;
    SaveBut.Enabled := True;
    SplitImageBut.Enabled := True;
  finally
    OpenBut.Enabled := True;
  end;
end;

procedure TMainForm.CopyToClipClick(Sender: TObject);
  var
    tt:TBitmap;
begin
  try
    tt:=TBitmap.Create;
    tt.Width:=w;
    tt.Height:=h;
    im.CopySelectionToBitmap(tt);
    Clipboard.Assign(tt);
    //ShowMessage('Done');
  finally
    tt.Free;
  end;
end;

procedure TMainForm.file1BeforeDialog(Sender: TObject; var Name: string;
  var Action: Boolean);
begin
  action:=false;
  op.Options := [ofFileMustExist];
  if op.Execute then file1.FileName:=op.FileName;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  OnActivate := nil;
  file1.ShowButton := false;
  file1.ShowButton := true;
  file2.ShowButton := false;
  file2.ShowButton := true;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
  var
    IniFile: TMemIniFile;
begin
  IniFile := TMemIniFile.Create(extractfiledir(application.ExeName)+'\IconFinder.ini', TEncoding.UTF8);
  IniFile.WriteString('Options','PicFile',file1.FileName);
  IniFile.WriteString('Options','TextFile',file2.FileName);
  IniFile.UpdateFile;
  IniFile.Free;
  lst.Free;
end;

procedure TMainForm.FormCreate(Sender: TObject);
  var
    IniFile:TMemIniFile;
begin
  lst := TStringList.Create;
  IniFile := TMemIniFile.Create(extractfiledir(application.ExeName)+'\IconFinder.ini', TEncoding.UTF8);
  file1.FileName := IniFile.ReadString('Options','PicFile','');
  file2.FileName := IniFile.ReadString('Options','TextFile','');
  IniFile.Free;
  SelPath.Path := ExtractFileDir(Application.ExeName);
end;

function TMainForm.GridPos(view: TImageEnView; col, row: integer): TPoint;
begin
  ImageWidth := im.IEBitmap.Width;
  ImageHeight := im.IEBitmap.Height;
  // Column position
  if col = cols then
    Result.X := Im.XBmp2Scr (ImageWidth)
  else
    Result.X := Im.XBmp2Scr (Round ( w * col ));
  // Row position
  if Row = Rows then
    Result.Y := Im.yBmp2Scr (ImageHeight)
  else
    Result.Y := Im.yBmp2Scr (Round ( h * row ));
end;

procedure TMainForm.IconNameEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if CurSel < 0 then exit;
  lst[CurSel] := IconNameEdit.Text;
  FindEdit.Text := IconNameEdit.Text;
end;

procedure TMainForm.imClick(Sender: TObject);
begin
  im.SelectionOptions := [iesoAnimated];
end;

procedure TMainForm.imDblClick(Sender: TObject);
begin
  im.Zoom:=100;
end;

procedure TMainForm.imDrawBackBuffer(Sender: TObject);
var
  i: integer;
  pt: TPoint;

begin
  if not load then exit;
  if (imgselc>-1) and (imgselr>-1) then
  begin
    with Im.BackBuffer.Canvas do
    begin
  //    showmessage(floattostr(im.Zoom));
      Pen.Color := clWhite;
      Pen.Width := 1;
      Pen.Mode := pmCopy;
      brush.Style:=bsClear;
      pt := GridPos ( Im, imgselc, imgselr );
      Rectangle(pt.X,pt.Y,trunc(pt.X+w*im.zoomx/100),trunc(pt.Y+h*im.zoomy/100));
      Pen.Color := clRed;
      Rectangle(pt.X+1,pt.Y+1,trunc(pt.X+w*im.zoomx/100)-1,trunc(pt.Y+h*im.zoomy/100)-1);
      Pen.Color := clWhite;
      Rectangle(pt.X+2,pt.Y+2,trunc(pt.X+w*im.zoomx/100)-2,trunc(pt.Y+h*im.zoomy/100)-2);
      Pen.Color := clRed;
      Rectangle(pt.X+3,pt.Y+3,trunc(pt.X+w*im.zoomx/100)-3,trunc(pt.Y+h*im.zoomy/100)-3);
    end;
  end;
end;

procedure TMainForm.imMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  XP, YP, BX, BY,n: integer;
begin
  if not load then exit;
  BX := Im.XScr2Bmp ( X );
  BY := Im.YScr2Bmp ( Y );
  if (bx>0) and (by>0) and (bx<im.Bitmap.Width) and (by<im.Bitmap.Height) then
  begin
    XP := Trunc ( BX / w );
    YP := Trunc ( BY / h );
    n := yp*cols+xp+4;
    if (n < lst.Count) and (n>=0) then
    begin
      FindEdit.Text := lst[n];
      IconNameEdit.Text := lst[n];
      CurSel := n;
      imgselc:=xp;
      imgselr:=yp;
      SelectIm;
      CopyToClip.Enabled := True;
      SaveAs.Enabled := true;
      im.Refresh;
    end;
  end;
end;

procedure TMainForm.imZoomIn(Sender: TObject; var NewZoom: Double);
begin
  NewZoom := 100;
  im.ViewY := im.ViewY + h;
end;

procedure TMainForm.imZoomOut(Sender: TObject; var NewZoom: Double);
begin
  NewZoom := 100;
  im.ViewY := im.ViewY - h;
end;

procedure TMainForm.LoadImage(im: TImageEnView; fn: string);
  var
    TmpIm: ImagingClasses.TSingleImage;
    m: TMemoryStream;
begin
  if lowercase(extractfileext(fn)) = '.dds' then
  begin
    try
      m := TMemoryStream.Create;
      try
        TmpIm := TSingleImage.Create;
        TmpIm.LoadFromFile(fn);
        TmpIm.SaveToStream('png', m);
      finally
        TmpIm.Free;
      end;
      m.Position := 0;
      im.IO.LoadFromStream(m);
    finally
      m.Free;
    end;
  end else im.IO.LoadFromFile(fn);
end;

procedure TMainForm.RefreshSizes;
begin
  w := strtoint(lst[0]); h := strtoint(lst[1]);
  rows := strtoint(lst[2]); cols := strtoint(lst[3]);
  label1.Caption:='Width: '+lst[0]+chr(13)+chr(10)+' Height: '+lst[1]+chr(13)+chr(10)
  +' Rows: '+lst[2]+chr(13)+chr(10)+' Cols: '+lst[3]+ #13+#10+'Size: '+inttostr(im.IEBitmap.Width)+'x'+inttostr(im.IEBitmap.Height);
end;

procedure TMainForm.SaveAsClick(Sender: TObject);
  var
    T: TImageEnView;
begin
  if not SaveDlg.Execute then exit;
  try
    T := TImageEnView.Create(self);
    im.CopySelectionToIEBitmap(T.IEBitmap);
    T.IO.SaveToFile(SaveDlg.FileName);
  finally
    T.Free;
  end;
end;

procedure TMainForm.SaveButClick(Sender: TObject);
  var
    m: TMemoryStream;
    TmpIm: ImagingClasses.TSingleImage;
begin
  if not load then exit;
  try
    SaveBut.Enabled := False;
    if fileexists(file1.FileName+'.bak') then DeleteFile(file1.FileName+'.bak');
    RenameFile(file1.FileName, file1.FileName+'.bak');
    if lowercase(extractfileext(file1.FileName)) = '.dds' then
    begin
      try
        m := TMemoryStream.Create;
        TmpIm := TSingleImage.Create;
        im.IO.SaveToStreamPNG(m);
        m.Position := 0;
        TmpIm.LoadFromStream(m);
        TmpIm.Format := ifDXT5;
        TmpIm.SaveToFile(file1.FileName);
      finally
        m.Free;
        TmpIm.Free;
      end;
    end else im.IO.SaveToFile(file1.FileName);
    if fileexists(file2.FileName+'.bak') then DeleteFile(file2.FileName+'.bak');
    RenameFile(file2.FileName, file2.FileName+'.bak');
    lst.SaveToFile(file2.FileName, TEncoding.GetEncoding(936));
    ShowMessage('Done');
  finally
    SaveBut.Enabled := True;
  end;
end;

procedure TMainForm.SelectIm;
  var
    pt:TPoint;
begin
  pt := GridPos ( Im, imgselc, imgselr );
  //im.Select(pt.X,pt.Y,round(pt.X+w*im.zoomx/100),round(pt.Y+h*im.zoomy/100));
  im.Select(imgselc*w, imgselr*h, imgselc*w+w, imgselr*h+h);
end;

procedure TMainForm.SplitImageButClick(Sender: TObject);
  var
    a: integer;
    fn, ext: string;
    T: TImageEnView;
begin
  try
    SplitImageBut.Enabled := False;
    T := TImageEnView.Create(self);
    im.LockPaint;
    if not SelPath.Execute then exit;
    T.IO.Params.JPEG_Quality := strtoint(JpegQuality.Text);
    T.Width := w;
    T.Height := h;
    T.IO.Params.BitsPerSample := 8;
    T.IO.Params.SamplesPerPixel := 4;
    try
      ProgressFrm := TProgressFrm.Create(self);
      ProgressFrm.progr.MinValue := 4;
      ProgressFrm.progr.MaxValue := lst.Count - 1;
      ProgressFrm.progr.Progress := 4;
      ProgressFrm.Show;
      for a := 4 to lst.Count - 1 do
      begin
        if BmpSel.Checked then
          ext := '.bmp' else
        if PngSel.Checked then
          ext := '.png' else
        if JpgSel.Checked then
          ext := '.jpg';
        fn := SelPath.Path + '\' + changefileext(lst[a], ext);
        imgselr := trunc((a-4)/cols);
        imgselc := a-4-imgselr*cols;
        SelectIm;
        T.Clear;
        im.CopySelectionToIEBitmap(T.IEBitmap);
        T.IO.SaveToFile(fn);
        ProgressFrm.progr.Progress := a;
      end;
      ProgressFrm.Close;
    finally
      ProgressFrm.Free;
    end;
  finally
    SplitImageBut.Enabled := true;
    T.Free;
    im.UnLockPaint;
  end;
end;

procedure TMainForm.sSpeedButton1Click(Sender: TObject);
begin
  if not load then exit;
  im.Zoom:=im.Zoom*0.75;
end;

procedure TMainForm.sSpeedButton2Click(Sender: TObject);
begin
  if not load then exit;
  im.Zoom:=im.Zoom/0.75;
end;

procedure TMainForm.sSpeedButton3Click(Sender: TObject);
begin
  if not load then exit;
  im.Zoom:=100;
end;

procedure TMainForm.GlueImagesButClick(Sender: TObject);
  var
    filelist: TStringList;
    a, o, f, x, y: integer;
    tr: TRgb;
    TmpIM: TImageEnView;
    s: string;

  procedure ScanDir(StartDir: String);
    var SearchRec : TSearchRec;
  begin
    StartDir := IncludeTrailingPathDelimiter(StartDir);
    if FindFirst(StartDir + '*', faAnyFile, SearchRec) = 0 then
    begin
      repeat
        if (SearchRec.Attr and faDirectory) <> faDirectory then
        begin
          s := widelowercase(extractfileext(SearchRec.Name));
          if (s = '.bmp') or
             (s = '.jpg') or
             (s = '.png') then
             begin
                if (widelowercase(searchrec.name) = 'unknown'+s) or (widelowercase(SearchRec.Name) = '0_0'+s) then
                  filelist.Insert(0, StartDir + SearchRec.Name) else
                  filelist.Add(StartDir + SearchRec.Name);
             end;
        end else
            if (SearchRec.Name <> '..') and (SearchRec.Name <> '.') then
              ScanDir(StartDir + SearchRec.Name + '\');
      until FindNext(SearchRec) <> 0;
      FindClose(SearchRec);
    end;
  end;

begin
  try
    GlueParamForm := TGlueParamForm.Create(Self);
    if GlueParamForm.ShowModal <> mrOk then exit;
    Application.ProcessMessages;
    try
      GlueImagesBut.Enabled := False;
      FileList := TStringList.Create;
      im.LockPaint;
      ScanDir(GlueParamForm.IconDir.Text);
      if FileList.Count < 1 then
      begin
        ShowMessage('Icons relevant formats not found');
        exit;
      end;
      load := false;
      lst.Clear;
      cols := GlueParamForm.CEd.Value;
      f := trunc(filelist.Count / cols);
      o := FileList.Count - (f * cols);
      if o > 0 then inc(f);
      rows := f;
      w := cols * GlueParamForm.WEd.Value;
      h := w div 2;
      while (h < rows * GlueParamForm.HEd.Value) do
        h := h * 2;
      lst.Add(GlueParamForm.WEd.Text);  // Width
      lst.Add(GlueParamForm.HEd.Text);  // Height
      lst.Add(inttostr(rows));          // Rows
      lst.Add(GlueParamForm.CEd.Text);  // Cols
      im.IEBitmap.FreeImage(true);
      im.Clear;
      im.EnableAlphaChannel := True;
      im.IEBitmap.Allocate(w, h);
      im.Select(0,0,0,0);
      tr.r := GlueParamForm.RCol.Value;
      tr.g := GlueParamForm.GCol.Value;
      tr.b := GlueParamForm.BCol.Value;
      im.IO.Params.BitsPerSample := 8;
      im.IO.Params.SamplesPerPixel := 4;
      if not GlueParamForm.FillCheck.Checked then
      begin
        im.AlphaChannel.Fill(0);
      end else
      begin
        im.Refresh;
        //im.Select(0,0,im.IEBitmap.Width,im.IEBitmap.Height);
        im.Proc.Fill(tr);
        //im.Select(0,0,0,0);
        im.AlphaChannel.Fill(255);
      end;
      RefreshSizes;
      try
        TmpIm := TImageEnView.Create(self);
        ProgressFrm := TProgressFrm.Create(self);
        ProgressFrm.progr.MinValue := 0;
        ProgressFrm.progr.MaxValue := FileList.Count - 1;
        ProgressFrm.progr.Progress := 0;
        ProgressFrm.Show;
        for a := 0 to FileList.Count - 1 do
        begin
          lst.Add(changefileext(widelowercase(extractfilename(FileList[a])), '.dds'));
          TmpIm.IO.LoadFromFile(FileList[a]);
          y := trunc((a)/cols);
          x := a-y*cols;
          x := x * w;
          y := y * h;
          //TmpIm.IEBitmap.RenderToTIEBitmapEx(im.IEBitmap, x, y, w, h, 0, 0, TmpIm.Bitmap.Width, TmpIm.Bitmap.Height, 255, rfBicubic );
          TmpIm.IEBitmap.RenderToCanvasWithAlpha(im.IEBitmap.Canvas, x, y, w, h, 0, 0, TmpIm.Bitmap.Width, TmpIm.Bitmap.Height, 255, rfBicubic);
          //TmpIm.IEBitmap.AlphaChannel.RenderToTIEBitmapEx(im.IEBitmap.AlphaChannel, x, y, w, h, 0, 0, TmpIm.Bitmap.Width, TmpIm.Bitmap.Height, 255, rfBicubic );
          if not GlueParamForm.FillCheck.Checked then TmpIm.IEBitmap.AlphaChannel.RenderToCanvasWithAlpha(im.IEBitmap.AlphaChannel.Canvas, x, y, w, h, 0, 0, TmpIm.Bitmap.Width, TmpIm.Bitmap.Height, 255, rfBicubic);
          ProgressFrm.progr.Progress := a;
        end;
        RefreshSizes;
        load := true;
        SaveBut.Enabled := true;
        SplitImageBut.Enabled := True;
      finally
        GlueImagesBut.Enabled := True;
        TmpIm.Free;
        ProgressFrm.Free;
      end;
    finally
      FileList.Free;
      im.UnLockPaint;
    end;
  finally
    GlueParamForm.Free;
  end;
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  FindEdit.Text := LastAddName;
  FindButClick(FindBut);
end;

end.
