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
      '  return fmt.Errorf("$1: ${2:%w}", $3${4:err})',
      "}",
      "$0",
    },
    desc = "if error, return formatted wrap",
  },
  {
    prefix = "ifer",
    body = {
      "if err != nil {",
      "  return err",
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
  {
    prefix = "slg",
    body = 'slog.${1|Debug,Info,Warn|}("$2"$3)$0',
    desc = "slog.Facility()",
  },
  {
    prefix = "slgd",
    body = 'slog.Debug("$1"$2)$0',
    desc = "slog.Debug()",
  },
  {
    prefix = "slgi",
    body = 'slog.Info("$1"$2)$0',
    desc = "slog.Info()",
  },
  {
    prefix = "slgw",
    body = 'slog.Warn("$1"$2)$0',
    desc = "slog.Warn()",
  },
  {
    prefix = "slgc",
    body = 'slog.Critical("$1"$2)$0',
    desc = "slog.Critical()",
  },
}
