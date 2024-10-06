{
 * FILE: GlueParam.pas
 *
 * DESCRIPTION: IconListEditor parameters for glue icons
 *
 * CREATED BY: alexdnepro 12-2014
 *
}

unit GlueParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sEdit, sSpinEdit, Mask, sMaskEdit, sCustomComboEdit,
  sToolEdit, Buttons, sBitBtn, sCheckBox;

type
  TGlueParamForm = class(TForm)
    WEd: TsSpinEdit;
    HEd: TsSpinEdit;
    CEd: TsSpinEdit;
    IconDir: TsDirectoryEdit;
    OkBut: TsBitBtn;
    FillCheck: TsCheckBox;
    RCol: TsSpinEdit;
    GCol: TsSpinEdit;
    BCol: TsSpinEdit;
    procedure OkButClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GlueParamForm: TGlueParamForm;

implementation

{$R *.dfm}

procedure TGlueParamForm.OkButClick(Sender: TObject);
begin
  if IconDir.Text = '' then
  begin
    ShowMessage('Укажите папку с иконками');
    exit;
  end;
  if not DirectoryExists(IconDir.Text) then
  begin
    ShowMessage('Папка с иконками не найдена');
    exit;
  end;
  ModalResult := mrOk;
end;

end.
