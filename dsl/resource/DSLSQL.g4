/*
    针对交互查询模块的元数据提供自定义SQL语法解析
*/

grammar DSLSQL;

@header{
    package com.hex.bigdata.udsp.dsl.parser;
}

AS: A S;
SELECT: S E L E C T;
FROM: F R O M;
MAX: M A X;
SUM: S U M;
AVG: A V G;
MIN: M I N;
COUNT: C O U N T;
DISTINCT: D I S T I N C T;
WHERE: W H E R E;
GROUP: G R O U P;
BY: B Y;
ORDER: O R D E R;
NOT: N O T;
IS:  I S;
BETWEEN: B E T W E E N;
AND:  A N D;
IN:   I N;
NULL : N U L L;
OR: O R;
ASC: A S C;
DESC: D E S C;
LIMIT: L I M I T;
OFFSET: O F F S E T;
LIKE: L I K E;
DESCRIBE: D E S C R I B E;
SHOW: S H O W;
SERVICES: S E R V I C E S;
ON: O N;
JOIN: J O I N;
LEFT: L E F T;
RIGHT: R I G H T;
INNER: I N N E R;
CLEAN: C L E A N;
CACHES: C A C H E S;
TEST: T E S T;
CONNECTION: C O N N E C T I O N;

fragment A: [aA];
fragment B: [bB];
fragment C: [cC];
fragment D: [dD];
fragment E: [eE];
fragment F: [fF];
fragment G: [gG];
fragment H: [hH];
fragment I: [iI];
fragment J: [jJ];
fragment K: [kK];
fragment L: [lL];
fragment M: [mM];
fragment N: [nN];
fragment O: [oO];
fragment P: [pP];
fragment Q: [qQ];
fragment R: [rR];
fragment S: [sS];
fragment T: [tT];
fragment U: [uU];
fragment V: [vV];
fragment W: [wW];
fragment X: [xX];
fragment Y: [yY];
fragment Z: [zZ];
fragment HEX_DIGIT: [0-9A-F];
fragment DEC_DIGIT: [0-9];
fragment LETTER: [a-zA-Z];

ID: ('A'..'Z' | 'a'..'z') ('A'..'Z' | 'a'..'z' | '_' | '0'..'9')*;
TEXT_STRING: ( '\'' ( ('\\' '\\') | ('\'' '\'') | ('\\' '\'') | ~('\'') )* '\'');
DECIMAL_LITERAL: DEC_DIGIT+;

statement
    : selectStatement
    | describeServiceStatement
    | showServicesStatement
    | cleanCachesStatement
    | showCachesStatement
    | testConnectionStatement
    ;

testConnectionStatement
    : TEST CONNECTION
    ;

showCachesStatement
    : SHOW CACHES serviceName?
    ;

cleanCachesStatement
    : CLEAN CACHES serviceName?
    ;

showServicesStatement
    : SHOW SERVICES (LIKE textLiteral)?
    ;

describeServiceStatement
    : DESCRIBE serviceName
    ;

selectStatement
    : SELECT selectElements FROM subSelectStatement (joinCaluse)? (whereClause)? (groupByCaluse)? (orderByClause)? (limitClause)?
    ;

joinCaluse
    : joinElement (joinElement)*
    ;

joinElement
    : joinStatement subSelectStatement onStatement
    ;

joinStatement
    : joinOperator JOIN
    ;

joinOperator
    : LEFT
    | RIGHT
    | INNER
    ;

onStatement
    : ON logicExpressions
    ;

subSelectStatement
    : serviceName (AS? uid)?
    | '(' selectStatement ')' AS? uid
    ;

selectElements
    : star (',' star)*
    | selectElement (',' selectElement)*
    ;

star
    : (uid '.')? '*'
    ;

whereClause
    : WHERE logicExpressions
    ;

logicExpressions
     : logicExpression (logicalOperator logicExpression)*
     ;

logicExpression
    : logicExpressionCal comparisonOperator logicExpressionCal
    | fullColumnName BETWEEN value AND value
    | fullColumnName NOT? IN '(' value (',' value)*  ')'
    | fullColumnName IS NOT? NULL
    | '(' logicExpressions ')'
    ;

logicExpressionCal
    : fullColumnName
    | arithmeticCall
    | functionCall
    | value
    ;

groupByCaluse
    : GROUP BY groupByItem (',' groupByItem)*
    ;

orderByClause
    : ORDER BY orderByExpression (',' orderByExpression)*
    ;

limitClause
    : LIMIT (
        (offset=decimalLiteral ',')? limit=decimalLiteral
        | limit=decimalLiteral OFFSET offset=decimalLiteral
    )
    ;

orderByExpression
    : fullColumnName order=(ASC | DESC)?
    ;

groupByItem
    : fullColumnName
    ;

logicalOperator
    : AND
    | OR
    ;

comparisonOperator
    : '='
    | '>'
    | '<'
    | '<' '='
    | '>' '='
    | '!' '='
    | '<' '>'
    | NOT? LIKE
    ;

value
    : textLiteral
    | decimalLiteral
    ;

decimalLiteral
    : DECIMAL_LITERAL
    ;

textLiteral
    : TEXT_STRING
    ;

selectElement
    : selectElementCal (AS? uid)?
    ;

selectElementCal
    : fullColumnName
    | arithmeticCall
    | functionCall
    | value
    ;

fullColumnName
    : (uid '.')? columnName
    ;

arithmeticCall
    : stringAndNumber (arithmetic stringAndNumber)+
    | '(' arithmeticCall ')'
    ;

stringAndNumber
    : fullColumnName
    | decimalLiteral
    | '(' arithmeticCall ')'
    ;

arithmetic
    : '+'
    | '-'
    | '*'
    | '/'
    ;

functionCall
    : aggregateFunction
    | otherFunction
    ;

aggregateFunction
    : (AVG | MAX | MIN | SUM) '(' stringAndNumber ')'
    | COUNT '(' (starArg='*' |  functionArg?) ')'
    | COUNT '(' aggregator=DISTINCT functionArgs ')'
    ;

functionArg
    :  stringAndNumber
    ;

functionArgs
    : stringAndNumber (',' stringAndNumber)*
    ;

otherFunction
    : otherFunctionName '(' otherFunctionArgs ')'
    ;

otherFunctionArgs
    : selectElementCal (',' selectElementCal)*
    ;

otherFunctionName: ID;

serviceName: tmpName=ID;

columnName: ID;

uid: aliasName=ID;

WS : [ \t\r\n]+ -> skip ; // skip spaces, tabs, newlines
