{
 * FILE: main.pas
 *
 * DESCRIPTION: IconListEditor Progress Form unit
 *
 * CREATED BY: alexdnepro 12-2014
 *
}

unit ProgressForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sGauge, ComCtrls, ExtCtrls;

type
  TProgressFrm = class(TForm)
    Panel1: TPanel;
    progr: TsGauge;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ProgressFrm: TProgressFrm;

implementation

{$R *.dfm}

end.
