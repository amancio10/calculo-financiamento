unit U_Principal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Math, Windows, ShellAPI;

type

  { TFrm_Principal }

  TFrm_Principal = class(TForm)
    BtnCalcular: TButton;
    BtnLipar: TButton;
    EditNumMeses: TEdit;
    EditTaxaJuros: TEdit;
    EditValorBem: TEdit;
    GroupBox1: TGroupBox;
    Image1: TImage;
    Label1: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    LbMontante: TLabel;
    LbTotalJuros: TLabel;
    LbValorParcela: TLabel;
    procedure BtnCalcularClick(Sender: TObject);
    procedure BtnLiparClick(Sender: TObject);
    procedure EditTaxaJurosKeyPress(Sender: TObject; var Key: char);
    procedure EditValorBemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditValorBemKeyPress(Sender: TObject; var Key: char);
    //procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure Label3Click(Sender: TObject);
    procedure Label3MouseEnter(Sender: TObject);
    procedure Label3MouseLeave(Sender: TObject);
  private

  public

  end;

var
  Frm_Principal: TFrm_Principal;

implementation

{$R *.lfm}

{ TFrm_Principal }

procedure TFrm_Principal.BtnCalcularClick(Sender: TObject);
var
  valor_bem, taxa_juros, valor_parcela, total_juros, montante: Double;
  num_meses: Integer;
begin
 if (EditValorBem.Text <> '') and (EditTaxaJuros.Text <> '') and (EditNumMeses.Text <> '') then
  begin
  // Obter os dados do usuário
  valor_bem := StrToFloat(EditValorBem.Text);
  taxa_juros := StrToFloat(EditTaxaJuros.Text) / 100;
  num_meses := StrToInt(EditNumMeses.Text);

  // Calcular o valor da parcela
  valor_parcela := (taxa_juros * valor_bem) / (1 - Power(1 + taxa_juros, -num_meses));

  // Calcular o total de juros
  total_juros := (valor_parcela * num_meses) - valor_bem;

  // Calcular o montante
  montante := valor_bem + total_juros;

  // Exibir os resultados
  LbValorParcela.Caption := FormatFloat('#,##0.00', valor_parcela);
  LbTotalJuros.Caption   := FormatFloat('#,##0.00', total_juros);
  LbMontante.Caption     := FormatFloat('#,##0.00', montante);
end
  else
  ShowMessage('Porfavor, preencha todos os campos!');
 end;

procedure TFrm_Principal.BtnLiparClick(Sender: TObject);
begin
  EditNumMeses.Clear;
  EditValorBem.Clear;
  EditTaxaJuros.Text := '2';

  LbMontante.Caption     := 'R$ 00.00';
  LbTotalJuros.Caption   := 'R$ 00.00';
  LbValorParcela.Caption := 'R$ 00.00';

  EditValorBem.SetFocus;
end;

procedure TFrm_Principal.EditTaxaJurosKeyPress(Sender: TObject; var Key: char);
begin
   if not CharInSet(Key, ['0'..'9', #8]) then
    Key := #0;
end;

procedure TFrm_Principal.EditValorBemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_RETURN then
  begin
    SelectNext(ActiveControl, True, True);
    Key := 0;
  end;
end;

procedure TFrm_Principal.EditValorBemKeyPress(Sender: TObject; var Key: char);
begin
  if not CharInSet(Key, ['0'..'9', ',', #8]) then
    Key := #0;
end;



procedure TFrm_Principal.FormKeyPress(Sender: TObject; var Key: char);
begin
  if (Key = #13) then
  begin
    BtnCalcular.Click;
    Key := #0;
  end;
end;

procedure TFrm_Principal.Label3Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'www.linkedin.com/in/amancio-santos', nil, nil, SW_SHOWNORMAL);
end;

procedure TFrm_Principal.Label3MouseEnter(Sender: TObject);
begin
  Label3.Font.Style := Label1.Font.Style + [fsUnderline];
  Label3.Font.Color := clHighlight;
end;

procedure TFrm_Principal.Label3MouseLeave(Sender: TObject);
begin
  Label3.Font.Style := Label1.Font.Style - [fsUnderline];
  Label3.Font.Color := clDefault;
end;

end.

