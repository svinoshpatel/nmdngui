unit Unitnmdn;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    LabelA: TLabel;
    labelinput: TLabel;
    LabelResult: TLabel;
    LabelB: TLabel;
    LabelEps: TLabel;
    EditA: TEdit;
    LabelKmax: TLabel;
    EditB: TEdit;
    EditEps: TEdit;
    EditKmax: TEdit;
    LabelX: TLabel;
    EditX: TEdit;
    LabelIterations: TLabel;
    EditIterations: TEdit;
    Button1: TButton;
    Button2: TButton;
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

var
  a, b: Real;
  Kmax: Integer;
  m, k: Byte;

// Рівняння
function f(x: Real; k1: Byte): Real;
begin
  case k1 of
  0: f := x*x - 4;
  1: f := 3*x - 4*ln(x) - 5;
  2: f := x*x*x - 6*x*x + 11*x - 6;
  end;
end;

// Похідна
function fp(x, d: Real; k1: Byte): Real;
begin
  fp := (f(x+d, k1) - f(x, k1)) / d;
end;

// Друга похідна
function f2p(x, d: Real; k1: Byte): Real;
begin
  f2p := (f(x+d, k1) + f(x-d, k1)- 2*f(x, k1)) / (d*d);
end;

// Метод ділення навпіл
procedure mdp(a, b, Eps: Real; k1: byte; var L: Integer; var res: Real);
var
  c, Fc: Real;
begin
  while (b - a > Eps) do
  begin
    c := 0.5 * (b - a) + a;
    L := L + 1;
    Fc := f(c, k1);
    if (abs(Fc) < Eps) then
    begin
      res := c;
      exit
    end;
    if f(a, k1) * Fc > 0 then
       a := c
    else
      b := c;
  end;
  res := c;
end;

// Метод Ньютона
procedure mn(a, b, Eps: Real; k1: byte; Kmax: Integer; var L: Integer; var res: Real);
var
  x, Dx, D: Real;
  i: integer;
begin
  Dx := 0.0;
  D := Eps / 100.0;
  x := b;
  if (f(x, k1) * f2p(x, D, k1) < 0) then
     x := a;
  if (f(x, k1) * f2p(x, D, k1) < 0) then
     ShowMessage('Для цього рівняння збіжність ітерацій не гарантована');
  for i := 1 to Kmax do
  begin
    Dx := f(x, k1) / fp(x, D, k1);
    x := x - Dx;
    if (abs(Dx) < Eps) then
    begin
      res := x;
      L := i;
      exit;
    end;
  end;
  ShowMessage('За задану кількість ітерацій кореня не знайдено');
end;

// Розв'язати
procedure TForm1.Button1Click(Sender: TObject);
var
  L: Integer;
  D, Eps, x: Real;
begin
  L := 0;

  if EditA.Text = '' then
  begin
    ShowMessage('Введіть число в EditA');
    Exit;
  end;
  a := StrToFloat(EditA.Text);

   if EditB.Text = '' then
   begin
     ShowMessage('Введіть число в EditB');
     exit;
   end;
   b := StrToFloat(EditB.Text);

   if EditEps.Text = '' then
   begin
     ShowMessage('Введіть число в EditEps');
     exit;
   end;
   Eps := StrToFloat(EditEps.Text);

   if a > b then
   begin
     D := a; a := b; b := D;
     EditA.Text := FloatToStr(a);
     EditB.Text := FloatToStr(b);
   end;

   Case RadioGroup1.ItemIndex of
   0: m := 0;
   1:
     begin
       m := 1;
       D := Eps / 100.0;
       LabelKmax.Visible := True;
       EditKmax.Visible := True;
     end;
   end;

   Case RadioGroup2.ItemIndex of
   0: k := 0;
   1: k := 1;
   2: k := 2;
   end;

   if m = 0 then
   		if f(a, k) * f(b,k) > 0 then
      begin
        ShowMessage('Введіть правильний інтервал [a, b]');
        EditA.Clear;
        EditB.Clear;
        Exit;
      end;

   if abs(f(a, k)) < Eps then
   begin
     EditX.Text := FloatToStr(a);
     EditIterations.Text := IntToStr(L);
     exit;
   end;

   if abs(f(b, k)) < Eps then
   begin
     EditX.Text := FloatToStr(b);
     EditIterations.Text := IntToStr(L);
     Exit;
   end;

   case m of
   0:
     begin;
       mdp(a, b, Eps, k, L, x);
       if CheckBox1.Checked then
         EditX.text := FloatToStrF(x, ffGeneral, 4, 4)
       else
         EditX.text := FloatToStr(x);
       EditIterations.Text := IntToStr(l);
       exit;
   	 end;
   1:
     begin
       Kmax := StrToInt(EditKmax.Text);
       mn(a, b, Eps, k, Kmax, L, x);
       if CheckBox1.Checked then
         EditX.text := FloatToStrF(x, ffGeneral, 4, 4)
       else
         EditX.text := FloatToStr(x);
       EditIterations.Text := IntToStr(L);
     end;
   end;
end;

// Clear
procedure TForm1.Button2Click(Sender: TObject);
begin
  EditA.Clear;
  EditB.clear;
  EditEps.clear;
  EditKmax.clear;
  EditX.clear;
  EditIterations.clear;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
    case RadioGroup1.ItemIndex of
  0:
    begin
      labelKmax.visible := False;
      EditKmax.visible := False;
    end;
  1:
    begin
      labelKmax.visible := True;
      EditKmax.visible := True;
    end;
    end;
end;

end.
