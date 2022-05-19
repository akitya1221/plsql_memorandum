-- PLSQL備忘録

-- パッケージ仕様部の作成
CREATE OR REPLACE PACKAGE パッケージ名 AS

  -- プロシージャの作成
  PROCEDURE プロシージャ名 (
    引数 IN 型名 -- 型名：NUMBERやVARCHAR2など
  );

  -- ファンクションの作成
  FUNCTION ファンクション名 (
    引数 IN 型名 -- 型名：NUMBERやVARCHAR2など
  ) RETURN 型名;

END パッケージ名;
/*
  ・メモ・
  ・仕様部で作成したプロシージャ、ファンクションは本体部で作成しないとエラーになる。
*/

-- パッケージ本体部の作成
CREATE OR REPLACE PACKAGE BODY  パッケージ名 AS

  -- プロシージャの作成
  PROCEDURE プロシージャ名 (
    引数 IN 型名 -- 型名：NUMBERやVARCHAR2など
  )
  IS -- 宣言部：変数などを宣言
    
  BEGIN -- 処理部：BEGINとENDの間で処理を記載

  EXCEPTION -- 例外部：例外処理を記載

  END プロシージャ名;


  -- ファンクションの作成
  FUNCTION ファンクション名 (
    引数 IN 型名 -- 型名：NUMBERやVARCHAR2など
  ) RETURN 戻り値
  IS -- 宣言部：変数などを宣言

  BEGIN -- 処理部：BEGINとENDの間で処理を記載

  RETURN 戻り値;

  EXCEPTION -- 例外部：例外処理を記載

  END ファンクション名;

END パッケージ名;
/*
  ・メモ・
  ・各処理で使用する引数は仕様部で宣言した型名でなければエラーになる。
  ・宣言部は宣言が無くてもエラーにはならない。
*/


-- パッケージ例
-- 仕様部
CREATE OR REPLACE PACKAGE sample_package AS

  PROCEDURE sample_procedure (
    in_sample_id IN NUMBER
  );

  FUNCTION sample_function (
    in_sample_id IN NUMBER
  ) RETURN VARCHAR2;

END sample_package;

-- 本体部
CREATE OR REPLACE PACKAGE BODY sample_package AS
  
  -- プロシージャ
  PROCEDURE sample_procedure (
    in_sample_id IN NUMBER
  )
  IS
  BEGIN
    DELETE FROM 
      sample_table
    WHERE
      in_sample_id = sample_id;
  END sample_procedure;

  -- ファンクション
  FUNCTION sample_function (
    in_sample_id IN NUMBER
  ) RETURN VARCHAR2
  IS
    -- SELECT文が代入される変数
    l_return_sql VARCHAR2(10000);
  BEGIN
    l_return_sql :=
      'SELECT
        *
      FROM
        sample_table
      WHERE
        in_sample_id = sample_id;'
  RETURN l_return_sql;
  END sample_function;

END sample_package;
