unit UnitHTMLCodeEditor;

interface
uses Classes,SysUtils,Controls,Dialogs,Graphics,Forms,UnitSyntaxMemo;

const

    tokKeyWord          = tokUser;
    tokUnit             = tokUser - 1;
    tokInterface        = tokUser - 2;
    tokImplement        = tokUser - 3;
    tokClass            = tokUser - 4;
    tokBegin            = tokUser - 5;
    tokEnd              = tokUser - 6;
    tokProcedure        = tokUser - 7;
    tokFunction         = tokProcedure;
    tokInit             = tokUser - 8;
    tokFinal            = tokUser - 9;
    tokResult           = tokUser - 100;

 Type
    THTMLCodeEditor=class
    private
       FHTMLKeyWords:TStringList;
       FMemoCode :TMPSyntaxMemo;

       procedure FUserToken(Sender: TObject; Word: string; Pos, Line: Integer; var Token: TToken);
       Procedure FAssignPropMemo(Amemo       : TMPSyntaxMemo;AParent:TWinControl);
       procedure FCreateKeyWord;
    public
      constructor Create(Control: TWinControl;FontSize:Integer=8);
      destructor  Close;
    property  CodeEditor :TMPSyntaxMemo read FMemoCode;
    end;

implementation

//Определение типа токена (Pascal Keywords Analize)
procedure THTMLCodeEditor.FUserToken(Sender: TObject; Word: string; Pos, Line: Integer; var Token: TToken);
var n: Integer;
begin
  if fHTMLKeyWords.Find(LowerCase(Word), n) then
     Token := TToken(fHTMLKeyWords.Objects[n]);
end;
//******************************************************************************
Procedure THTMLCodeEditor.FAssignPropMemo(Amemo : TMPSyntaxMemo;AParent:TWinControl);
begin
  with Amemo do begin
        Parent          := AParent;

        Font.Assign( TForm(AParent.Owner).Font );
        Align           := alClient;
        Color           := clWindow;
        // Options         := [smoReadOnly,smoShowFileNameInTabSheet,
        //                     smoShowFileNameInFormCaption,
        //                     smoAutoGutterWidth];
        { User tokens }
        with SyntaxAttributes do begin
            FontColor[tokKeyWord] := clBlack;
            FontStyle[tokKeyWord] := [fsBold, fsUnderline];
            //********************************************
            FontColor[tokResult]  := clBlue;
            //********************************************
            FontColor[tokBegin]   := $00950095;
            FontStyle[tokBegin]   := [];
            //********************************************
            FontColor[tokEnd]     := $00950095;
            FontStyle[tokEnd]     := [];
            //********************************************
            FontColor[tokClass]     := $000606FF;                          // tokBegin, tokEnd, tokClass,
            FontStyle[tokClass]     := [];
            //********************************************
            //CopyAttrs(tokKeyWord, [tokUnit, tokInterface, tokImplement,   tokProcedure, tokInit, tokFinal]);
            OnUserToken := self.FUserToken;
        end;
    end;
end;
//******************************************************************************
procedure THTMLCodeEditor.FCreateKeyWord;
begin
    FHTMLKeyWords := TStringList.Create;
    with fHTMLKeyWords do begin
        Sorted := True;
        AddObject('and', TObject(tokKeyWord));              //  Boolean and or bitwise and of two arguments
        AddObject('array', TObject(tokKeyWord));            //  A data type holding indexable collections of data
        AddObject('as', TObject(tokKeyWord));               //  Used for casting object references
        AddObject('begin', TObject(tokBegin));              //  Keyword that starts a statement block
        AddObject('case', TObject(tokBegin));               //  A mechanism for acting upon different values of an Ordinal
        AddObject('const', TObject(tokKeyWord));            //  Starts the definition of fixed data values
        AddObject('constructor', TObject(tokProcedure));    //  Defines the method used to create an object from a class
        AddObject('destructor', TObject(tokProcedure));     //  Defines the method used to destroy an object
        AddObject('do', TObject(tokKeyWord));               //  Defines the start of some controlled action
        AddObject('downto', TObject(tokKeyWord));           //  Prefixes an decremental for loop target value
        AddObject('else', TObject(tokKeyWord));             //  Starts false section of if, case and try statements
        AddObject('end', TObject(tokEnd));                  //  Keyword that terminates statement blocks
        AddObject('except', TObject(tokKeyWord));           //  Starts the error trapping clause of a Try statement
        AddObject('file', TObject(tokKeyWord));             //  Defines a typed or untyped file
        AddObject('finalization', TObject(tokFinal));
        AddObject('finally', TObject(tokKeyWord));          //  Starts the unconditional code section of a Try statement
        AddObject('for', TObject(tokKeyWord));              //  Starts a loop that executes a finite number of times
        AddObject('function', TObject(tokFunction));        //  Defines a subroutine that returns a value
        AddObject('goto', TObject(tokKeyWord));             //  Forces a jump to a label, regardless of nesting
        AddObject('if', TObject(tokKeyWord));               //  Starts a conditional expression to determine what to do next
        AddObject('implementation', TObject(tokImplement)); //  Starts the implementation (code) section of a Unit
        AddObject('in', TObject(tokKeyWord));               //  Used to test if a value is a member of a set
        AddObject('inherited', TObject(tokKeyWord));        //  Used to call the parent class constructor or destructor method
        AddObject('initialization', TObject(tokInit));
        AddObject('interface', TObject(tokInterface));      //  Used for Unit external definitions, and as a Class skeleton
        AddObject('is', TObject(tokKeyWord));               //  Tests whether an object is a certain class or ascendant
        AddObject('mod', TObject(tokKeyWord));              //  Performs integer division, returning the remainder
        AddObject('nil', TObject(tokKeyWord));              //  Nil constant
        AddObject('not', TObject(tokKeyWord));              //  Boolean Not or bitwise not of one arguments
        AddObject('of', TObject(tokKeyWord));               //  Linking keyword used in many places
        AddObject('on', TObject(tokKeyWord));               //  Defines exception handling in a Try Except clause
        AddObject('or', TObject(tokKeyWord));               //  Boolean or or bitwise or of two arguments
        AddObject('packed', TObject(tokKeyWord));           //  Compacts complex data types into minimal storage
        AddObject('private', TObject(tokKeyWord));          //
        AddObject('procedure', TObject(tokProcedure));      //  Defines a subroutine that does not return a value
        AddObject('program', TObject(tokKeyWord));          //  Defines the start of an application
        AddObject('property', TObject(tokKeyWord));         //  Defines controlled access to class fields
        AddObject('protected', TObject(tokKeyWord));        //
        AddObject('public', TObject(tokKeyWord));           //
        AddObject('published', TObject(tokKeyWord));        //
        AddObject('raise', TObject(tokKeyWord));            //  Raise an exception
        AddObject('record', TObject(tokKeyWord));           //  A structured data type - holding fields of data
        AddObject('repeat', TObject(tokKeyWord));           //  Repeat statements until a ternmination condition is met
        AddObject('resourcestring', TObject(tokKeyWord));   //  Resource string set
        AddObject('result', TObject(tokResult));            //  Function result word
        AddObject('set', TObject(tokKeyWord));              //  Defines a set of up to 255 distinct values
        AddObject('shl', TObject(tokKeyWord));              //  Shift an integer value left by a number of bits
        AddObject('shr', TObject(tokKeyWord));              //  Shift an integer value right by a number of bits
        AddObject('string', TObject(tokKeyWord));           //  String type
        AddObject('then', TObject(tokKeyWord));             //  Part of an if statement - starts the true clause
        AddObject('threadvar', TObject(tokKeyWord));        //  Defines variables that are given separate instances per thread
        AddObject('to', TObject(tokKeyWord));               //  Prefixes an incremental for loop target value
        AddObject('try', TObject(tokBegin));                //  Starts code that has error trapping
//        AddObject('type', TObject(tokKeyWord));             //  Defines a new category of variable or process
        AddObject('unit', TObject(tokUnit));                //  Defines the start of a unit file - a Delphi module
        AddObject('until', TObject(tokKeyWord));            //  Ends a Repeat control loop
        AddObject('uses', TObject(tokKeyWord));             //  Declares a list of Units to be imported
        AddObject('var', TObject(tokKeyWord));              //  Starts the definition of a section of data variables
        AddObject('while', TObject(tokKeyWord));            //  Repeat statements whilst a continuation condition is met
        AddObject('with', TObject(tokKeyWord));             //  A means of simplifying references to structured variables
        AddObject('xor', TObject(tokKeyWord));              //  Xor bitwise operation

        AddObject('new',TObject(tokBegin));
        AddObject('then',TObject(tokBegin));

        AddObject('body',TObject(tokBegin));
        AddObject('/body',TObject(tokEnd));

        AddObject('div',TObject(tokBegin));
        AddObject('/div',TObject(tokEnd));

        AddObject('tbody',TObject(tokBegin));
        AddObject('/tbody',TObject(tokEnd));
        AddObject('param',TObject(tokEnd));

        AddObject('tr',TObject(tokBegin));
        AddObject('/tr',TObject(tokEnd));

        AddObject('td',TObject(tokBegin));
        AddObject('/td',TObject(tokEnd));

        AddObject('title',TObject(tokBegin));
        AddObject('/title',TObject(tokEnd));

        AddObject('strong',TObject(tokBegin));
        AddObject('/strong',TObject(tokEnd));

        AddObject('object',TObject(tokBegin));
        AddObject('/object',TObject(tokEnd));

        AddObject('span',TObject(tokBegin));
        AddObject('/span',TObject(tokEnd));

        AddObject('EM',TObject(tokBegin));
        AddObject('/EM',TObject(tokEnd));

        AddObject('P',TObject(tokBegin));
        AddObject('/P',TObject(tokEnd));


        AddObject('LI',TObject(tokBegin));
        AddObject('/LI',TObject(tokEnd));

        AddObject('UL',TObject(tokBegin));
        AddObject('/UL',TObject(tokEnd));

        AddObject('script',TObject(tokBegin));
        AddObject('/script',TObject(tokEnd));

        AddObject('iframe',TObject(tokBegin));
        AddObject('/iframe',TObject(tokEnd));

        AddObject('table',TObject(tokBegin));
        AddObject('/table',TObject(tokEnd));

        AddObject('<',TObject(tokBegin));
        AddObject('>',TObject(tokEnd));

        AddObject('embed',TObject(tokBegin));
        AddObject('</',TObject(tokBegin));

        AddObject('BR',TObject(tokBegin));

        AddObject('SUP',TObject(tokBegin));
        AddObject('/SUP',TObject(tokBegin));

        AddObject('SUB',TObject(tokBegin));
        AddObject('/SUB',TObject(tokBegin));

        AddObject('form',TObject(tokBegin));
        AddObject('/form',TObject(tokBegin));

        AddObject('video',TObject(tokBegin));
        AddObject('/video',TObject(tokBegin));

        AddObject('a',TObject(tokBegin));
        AddObject('/a',TObject(tokBegin));

        AddObject('link',TObject(tokBegin));
        AddObject('img',TObject(tokBegin));
        AddObject('input',TObject(tokBegin));

        AddObject('meta',TObject(tokBegin));
        AddObject('/meta',TObject(tokBegin));

        AddObject('head',TObject(tokBegin));
        AddObject('/head',TObject(tokEnd));

        AddObject('html',TObject(tokBegin));
        AddObject('/html',TObject(tokEnd));

        AddObject('!doctype',TObject(tokBegin));

        AddObject('function', TObject(tokClass));         //  Xor bitwise operation
        AddObject('script', TObject(tokClass));         //  Xor bitwise operation

        AddObject('class',TObject(tokClass));
        AddObject('href' ,TObject(tokClass));
        AddObject('onClick',TObject(tokClass));
        AddObject('borderColor',TObject(tokClass));
        AddObject('background',TObject(tokClass));

        AddObject('frame',TObject(tokClass));
        AddObject('width',TObject(tokClass));
        AddObject('border',TObject(tokClass));
        AddObject('volume',TObject(tokClass));
        AddObject('autoplay',TObject(tokClass));
        AddObject('controls',TObject(tokClass));
        AddObject('loop',TObject(tokClass));
        AddObject('mute',TObject(tokClass));

        AddObject('scrolling',TObject(tokClass));
        AddObject('height',TObject(tokClass));
        AddObject('no height',TObject(tokClass));
        AddObject('id',TObject(tokClass));
        AddObject('name',TObject(tokClass));
        AddObject('value',TObject(tokClass));
        AddObject('pluginspage',TObject(tokClass));
        AddObject('codebase',TObject(tokClass));

        AddObject('type',TObject(tokClass));
        AddObject('src',TObject(tokClass));
        AddObject('cellSpacing',TObject(tokClass));
        AddObject('cellPadding',TObject(tokClass));
        //AddObject('stylesheet',TObject(tokClass));
        AddObject('rel',TObject(tokClass));

        AddObject('classid',TObject(tokClass));

        AddObject('quality',TObject(tokClass));
        AddObject('scale',TObject(tokClass));
        AddObject('menu',TObject(tokClass));
        AddObject('play',TObject(tokClass));
        AddObject('align',TObject(tokClass));
        AddObject('content',TObject(tokClass));
        AddObject('style',TObject(tokClass));
        AddObject('dir',TObject(tokClass));
        AddObject('base',TObject(tokClass));

        AddObject('=',TObject(tokClass));
    end;
end;
//******************************************************************************
destructor THTMLCodeEditor.Close;
begin
  self.FHTMLKeyWords.Free;
end;
//******************************************************************************
constructor THTMLCodeEditor.Create( Control: TWinControl; FontSize:Integer=8 );
begin
  FCreateKeyWord;
  FMemoCode := TMPSyntaxMemo.Create(Control);
  FAssignPropMemo(FMemoCode , Control);
  FMemoCode.Options := [];//[smoShowFileNameInTabSheet, smoShowFileNameInFormCaption, smoAutoGutterWidth];
  FMemoCode.Font.Size := FontSize;
end;
//******************************************************************************
end.
 