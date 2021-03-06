unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, frxClass;

type
  TForm1 = class(TForm)
    btnRelacaoFaturamento: TButton;
    dataInicial: TDateTimePicker;
    dataFinal: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnRelacaoFaturamentoClick(Sender: TObject);
    procedure CarregarRelatorio(const pReport: TfrxReport);
    procedure Periodo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses uDm;

procedure TForm1.btnRelacaoFaturamentoClick(Sender: TObject);
begin

with dm.qrVenda do
begin
  close;
  ParamByName('pDataInicial').AsDate := dataInicial.Date;
  ParamByName('pDataFinal').AsDate := dataFinal.Date;
  open;
end;

CarregarRelatorio(dm.frxVendas);

end;

procedure TForm1.CarregarRelatorio(const pReport: TfrxReport);
begin
Periodo;
 pReport.PrepareReport;
// pReport.LoadFromFile()
 pReport.ShowPreparedReport;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
dataInicial.Date := now -30  ;
dataFinal.Date   := now;
end;

procedure TForm1.Periodo;
begin
  dm.qrPeriodo.Open;
  dm.qrPeriodo.Edit;
  dm.qrPeriodo.FieldByName('LINHA2').AsString :=
    'Per�odo: ' +
    (FormatDateTime('dd/mm/yyyy', dataInicial.Date)) + ' a ' +
    (FormatDateTime('dd/mm/yyyy', dataFinal.Date));

end;



end.
