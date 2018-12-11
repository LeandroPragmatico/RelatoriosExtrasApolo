unit uDm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.IniFiles, frxClass, frxDBSet;

type
  Tdm = class(TDataModule)
    conn: TFDConnection;
    qrVenda: TFDQuery;
    frxVendas: TfrxReport;
    frxDBVendas: TfrxDBDataset;
    qrEmpresa: TFDQuery;
    qrPeriodo: TFDQuery;
    frxDBEmpresa: TfrxDBDataset;
    frxDBPeriodo: TfrxDBDataset;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure Tdm.DataModuleCreate(Sender: TObject);
var
  configuracaoIni : Tinifile;
begin
//leitura de arq conf
configuracaoIni := TIniFile.Create('C:\Apolo\SERVER\Configuracao.ini');

 conn.Params.Clear;

//parametros
conn.DriverName:= 'FB';
conn.Params.DriverID:='FB';
conn.Params.Database:= configuracaoIni.ReadString('Banco de Dados','999-001','C:\Apolo\BD\base.fdb');
conn.Params.Add('Server='+configuracaoIni.ReadString('Banco de Dados','999-002','LOCALHOST'));
conn.Params.Password:= 'masterkey';
//conn.Params['Port']:= 3050;
conn.Params.UserName:= 'SYSDBA';

conn.Connected:= True;

//qrEmpresa.Connection := conn;
//qrEmpresa.Active:=True;

configuracaoIni.Free;
end;
end.
