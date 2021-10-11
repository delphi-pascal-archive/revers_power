unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, XPMan, ExtCtrls, ComCtrls;

type
  PGeoPoint = ^TGeoPoint;
  TGeoPoint = record
    Name: String;
    X: Double;
    Y: Double;
    H: Double;
  end;

  TMainForm = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    SrcFileEdit: TEdit;
    SelFileSB: TSpeedButton;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    BetaEdit: TEdit;
    DeltaEdit: TEdit;
    Button1: TButton;
    XPManifest1: TXPManifest;
    Label4: TLabel;
    CellWidthEdit: TEdit;
    ScrollBox1: TScrollBox;
    StatusBar: TStatusBar;
    Image: TImage;
    OpenDialog: TOpenDialog;
    procedure Calculate(Sender: TObject);
    procedure SelFileSBClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
   procedure DelPoint(Index: Integer);
   procedure ClearPoints;
  public
  	FSrcData: TList;
  end;

var
  MainForm: TMainForm;

implementation

uses Math;

{$R *.dfm}

procedure TMainForm.Calculate(Sender: TObject);
var Beta, Delta, CellWidth: Double;
		F: TextFile;
    i, j, k: Integer;
    S: String;
    GP: PGeoPoint;
    Xmax, Xmin, Ymax, Ymin, Hmax, Hmin: Double;
    Xdelta, Ydelta, Hdelta: Double;
    Xcount, Ycount: Integer;
    ResData: array of array of Single;
    h, d, Summ1, Summ2: Double;
    c: Byte;
    rHmax, rHmin, rHdelta: Integer;
begin
	//Проверяем возможные ошибки ввода исх. данных
	if (not TryStrToFloat(BetaEdit.Text, Beta)) or(StrToFloat(BetaEdit.Text) < 0.3) then
  	raise Exception.Create('Показатель степени (Бета) введен неверно!');
  if not TryStrToFloat(DeltaEdit.Text, Delta) then
  	raise Exception.Create('Коэф. сглаживания (дельта) введен неверно!');
  if (not TryStrToFloat(CellWidthEdit.Text, CellWidth)) or(StrToFloat(CellWidthEdit.Text) <= 0) then
  	raise Exception.Create('Размер ячейки введен неверно!');
  if not FileExists(SrcFileEdit.Text) then
  	raise Exception.Create('Исходный файл "' + SrcFileEdit.Text + '" не найден!');

   //Загрузка исходных данных
   ClearPoints;
   AssignFile(F, SrcFileEdit.Text);
   Reset(F);
   i := 0;
   while not Eof(F) do begin
   	Inc(i);
    Readln(F, S);
    if i = 1 then continue;
    New(GP);
    //Name
    j := pos(#9, S);
    GP^.Name := copy(S, 1, j - 1);
    S := copy(S, j + 1, Length(S) - j);
    //X
    j := pos(#9, S);
    GP^.X := StrToFloat(copy(S, 1, j - 1));
    S := copy(S, j + 1, Length(S) - j);
    //Y
    j := pos(#9, S);
    GP^.Y := StrToFloat(copy(S, 1, j - 1));
    S := copy(S, j + 1, Length(S) - j);
    //H
    GP^.H := StrToFloat(Trim(S));
    FSrcData.Add(GP);
    //Состояние загрузки...
    StatusBar.Panels[0].Text := 'Загрузка исх. данных, строка ' + IntToStr(i);
    Application.ProcessMessages;
   end;
   CloseFile(F);
   if FSrcData.Count = 0 then
   	raise Exception.Create('Файл с исходными данными пуст!');

   //Вычисление регулярной сетки
   //1. Находим макс и мин
   Xmax := PGeoPoint(FSrcData[0])^.X;
   Xmin := PGeoPoint(FSrcData[0])^.X;
   Ymax := PGeoPoint(FSrcData[0])^.Y;
   Ymin := PGeoPoint(FSrcData[0])^.Y;
   Hmax := PGeoPoint(FSrcData[0])^.H;
   Hmin := PGeoPoint(FSrcData[0])^.H;
   for i := 1 to FSrcData.Count - 1 do begin
   	if Xmax < PGeoPoint(FSrcData[i])^.X then Xmax := PGeoPoint(FSrcData[i])^.X;
    if Xmin > PGeoPoint(FSrcData[i])^.X then Xmin := PGeoPoint(FSrcData[i])^.X;
   	if Ymax < PGeoPoint(FSrcData[i])^.Y then Ymax := PGeoPoint(FSrcData[i])^.Y;
    if Ymin > PGeoPoint(FSrcData[i])^.Y then Ymin := PGeoPoint(FSrcData[i])^.Y;
   	if Hmax < PGeoPoint(FSrcData[i])^.H then Hmax := PGeoPoint(FSrcData[i])^.H;
    if Hmin > PGeoPoint(FSrcData[i])^.H then Hmin := PGeoPoint(FSrcData[i])^.H;
    StatusBar.Panels[0].Text := 'Находим макс. и мин., точка ' + IntToStr(i);
    Application.ProcessMessages;
   end;
   Xdelta := Xmax - Xmin;
   Ydelta := Ymax - Ymin;
   Hdelta := Hmax - Hmin;
   Xcount := Round(Int(Xdelta / CellWidth));
   Ycount := Round(Int(Ydelta / CellWidth));
   //2. Используем метод обратных расстояний
   SetLength(ResData, Xcount);
   for i := 0 to XCount - 1 do SetLength(ResData[i], Ycount);
   for i := 0 to Xcount - 1 do for j := 0 to YCount - 1 do begin
    	StatusBar.Panels[0].Text := 'Рассчитываем узлы регулярной сетки (размер ' + IntToStr(Xcount) +
      	'x' + IntToStr(Ycount) + '): Х=' + IntToStr(i) +	', Y=' + IntToStr(j);
    	Application.ProcessMessages;
   		Summ1 := 0;
      Summ2 := 0;
   		for k := 0 to FSrcData.Count - 1 do begin
      	d := 	sqr((i * CellWidth + Xmin) - PGeoPoint(FSrcData[k])^.X) +
        			sqr((j * CellWidth + Ymin) - PGeoPoint(FSrcData[k])^.Y);
        h := sqrt(d + sqr(Delta));
        Summ1 := Summ1 + PGeoPoint(FSrcData[k])^.H / Power(h, Beta);
        Summ2 := Summ2 + 1 / Power(h, Beta);
      end;
      ResData[i][j] := Summ1 / Summ2;
   end;
   //3.Вывод на экран регулярную сетку
   rHmax := Round(ResData[0][0]);
   rHmin := Round(ResData[0][0]);
   for i := 0 to Xcount - 1 do for j := 0 to YCount - 1 do begin
   		if rHmax < Round(ResData[i][j]) then rHmax := Round(ResData[i][j]);
      if rHmin > Round(ResData[i][j]) then rHmin := Round(ResData[i][j]);
   end;
   rHdelta := rHmax - rHmin;
   Image.Picture.Bitmap.Width := Xcount;
   Image.Picture.Bitmap.Height := Ycount;
   for i := 0 to Xcount - 1 do for j := 0 to YCount - 1 do
    begin
     c := Round(Int( (ResData[i][j] - rHmin) * 256 / rHdelta ) );
     Image.Picture.Bitmap.Canvas.Pixels[Xcount - i + 1, j] := RGB(c, c, c);
     StatusBar.Panels[0].Text := 'Выводим на экран регулярную сетку...';
     Application.ProcessMessages;
    end;
   //4. Выводим на экран исходные точки
   for i := 0 to FSrcData.Count - 1 do
    begin
     Image.Picture.Bitmap.Canvas.Pixels[Xcount + 1 - Round(Int((PGeoPoint(FSrcData[i])^.X - Xmin) / CellWidth)),
     Round(Int((PGeoPoint(FSrcData[i])^.Y - Ymin) / CellWidth))] := RGB(0, 0, 255);
     StatusBar.Panels[0].Text := 'Выводим на экран исходные точки...';
     Application.ProcessMessages;
    end;

   StatusBar.Panels[0].Text := 'Расчет окончен';
end;

procedure TMainForm.SelFileSBClick(Sender: TObject);
begin
	if not OpenDialog.Execute then exit;
   SrcFileEdit.Text := OpenDialog.FileName;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
	FSrcData := TList.Create;
end;

procedure TMainForm.DelPoint(Index: Integer);
begin
	Dispose(PGeoPoint(FSrcData[Index]));
  FSrcData.Delete(Index);
end;

procedure TMainForm.ClearPoints;
begin
	while FSrcData.Count > 0 do DelPoint(0);
end;

end.
