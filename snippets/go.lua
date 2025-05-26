return {
  {
    prefix = "fer",
    body = 'fmt.Errorf("$1: ${2:%w}", $3${4:err})$0',
    desc = "fmt.Errorf()",
  },
  {
    prefix = "ifef",
    body = {
      "if err != nil {",
      '  fmt.Errorf("$1: ${2:%w}", $3${4:err})',
      "}",
      "$0",
    },
    desc = "if error, return formatted wrap",
  },
  {
    prefix = "dbg",
    body = '${1:inst.}logger.Debug("$2"$3)$0',
    desc = "<isnt>.logger.Debug()",
  },
  {
    prefix = "log",
    body = '${1:inst.}logger.${2|Debug,Info,Warn|}("$3"$4)$0',
    desc = "<isnt>.logger.Debug()",
  },
}
