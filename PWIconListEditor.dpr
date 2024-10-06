{
 * FILE: main.pas
 *
 * DESCRIPTION: IconListEditor
 *
 * CREATED BY: alexdnepro 12-2014
 *
}

program PWIconListEditor;

{$R 'res.res' 'res.rc'}

uses
  Forms,
  main in 'main.pas' {MainForm},
  ProgressForm in 'ProgressForm.pas' {ProgressFrm},
  GlueParam in 'GlueParam.pas' {GlueParamForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
