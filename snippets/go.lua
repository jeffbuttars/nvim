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
    prefix = "dbgc",
    body = '${1:inst.}logger.DebugContext(ctx, "$2"$3)$0',
    desc = "<isnt>.logger.DebugContext(ctx)",
  },
  {
    prefix = "log",
    body = '${1:inst.}logger.${2|Debug,Info,Warn,Critical|}("$3"$4)$0',
    desc = "<isnt>.logger.Debug()",
  },
  {
    prefix = "logc",
    body = '${1:inst.}logger.${2|DebugContext,InfoContext,WarnContext,CrticalContext|}(ctx, "$3"$4)$0',
    desc = "<isnt>.logger.<facility>Context(ctx)",
  },
  {
    prefix = "slg",
    body = 'slog.${1|Debug,Info,Warn,Critical|}("$2"$3)$0',
    desc = "slog.Facility()",
  },
  {
    prefix = "slgc",
    body = 'slog.${1|DebugContext,InfoContext,WarnContext,CrticalContext|}(ctx, "$2"$3)$0',
    desc = "slog.FacilityContext(ctx)",
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
}
