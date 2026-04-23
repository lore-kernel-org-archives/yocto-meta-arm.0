Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D599FC035A
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:37:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.561.1776958656650431964
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Apr 2026 08:37:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=jtK1UYwz;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C1601A9A;
	Thu, 23 Apr 2026 08:37:30 -0700 (PDT)
Received: from gyoszi01-yocto.budapest.arm.com (ubul2.budapest.arm.com [10.42.55.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 21A0A3F7B4;
	Thu, 23 Apr 2026 08:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776958655; bh=XKYHuBRjo1yjGwUc2nSRHwDPS4fNvR5GNssAHycc8FU=;
	h=From:To:Cc:Subject:Date:From;
	b=jtK1UYwza9bMMQ6lwM5aINC3sCTrXjdShOrKdax4qYH+DMKW1v2JAmSQyeIRNACxx
	 UKuSt0c8U+cM96rsEwNcsmjaMn+VDiRR4rNmfRL+XMc911FGTHPOyKCQ+2O8RtalWO
	 eaEa28hC2wwcaMLiACVPSNZgj09U1jD3YiCGtLns=
From: Gyorgy Szing <gyorgy.szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <gyorgy.szing@arm.com>
Subject: [PATCH 1/3] scripts/runfvp: check available terminal types
Date: Thu, 23 Apr 2026 17:37:19 +0200
Message-ID: <20260423153721.1275354-1-gyorgy.szing@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 23 Apr 2026 15:37:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7020

Improve usability by detecting which terminal types are available on the
system.

Extend the terminal abstraction to support checking whether a terminal
can be executed, and add basic validation for all terminal types. Update
the documentation to reflect the new behavior.

Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
---
 documentation/runfvp.md      |  5 ++
 meta-arm/lib/fvp/terminal.py | 95 +++++++++++++++++++++++++++++++-----
 scripts/runfvp               |  8 ++-
 3 files changed, 96 insertions(+), 12 deletions(-)

diff --git a/documentation/runfvp.md b/documentation/runfvp.md
index d1331101..aed99971 100644
--- a/documentation/runfvp.md
+++ b/documentation/runfvp.md
@@ -28,6 +28,11 @@ Note that currently meta-arm's `scripts` directory isn=
't in `PATH`, so a full pa
=20
 `runfvp` will automatically start terminals connected to each of the ser=
ial ports that the machine specifies.  This can be controlled by using th=
e `--terminals` option, for example `--terminals=3Dnone` will mean no ter=
minals are started, and `--terminals=3Dtmux` will start the terminals in =
[`tmux`][tmux] sessions.  Alternatively, passing `--console` will connect=
 the serial port directly to the current session, without needing to open=
 further windows.
=20
+The tool attempts to automatically select a suitable terminal type. To s=
ee which terminal type is selected by default in your environment, run `r=
unfvp --help`.
+
+`runfvp` determines availability by checking for required executables in=
 your PATH as well as environment variables specific to each terminal typ=
e. If any of these checks fail, the corresponding terminal type is disabl=
ed.
+The --help output also lists all currently available terminal types.
+
 The default terminal can also be configured by writing a [INI-style][INI=
] configuration file to `~/.config/runfvp.conf`:
=20
 ```
diff --git a/meta-arm/lib/fvp/terminal.py b/meta-arm/lib/fvp/terminal.py
index 280fb349..c0087fa1 100644
--- a/meta-arm/lib/fvp/terminal.py
+++ b/meta-arm/lib/fvp/terminal.py
@@ -3,9 +3,14 @@ import collections
 import pathlib
 import os
=20
+import logging
+import configparser
 from typing import List, Optional
=20
=20
+logger =3D logging.getLogger("Terminal")
+
+
 def get_config_dir() -> pathlib.Path:
     value =3D os.environ.get("XDG_CONFIG_HOME")
     if value and os.path.isabs(value):
@@ -13,47 +18,115 @@ def get_config_dir() -> pathlib.Path:
     else:
         return pathlib.Path.home() / ".config"
=20
+
+def check_executable(*cmd) -> bool:
+    import subprocess
+
+    try:
+        result =3D subprocess.run(
+            cmd,
+            stdout=3Dsubprocess.DEVNULL,
+            stderr=3Dsubprocess.DEVNULL
+        )
+
+        exitcode =3D result.returncode
+
+    except FileNotFoundError:
+        exitcode =3D 127
+
+    return exitcode =3D=3D 0
+
+
+def tmux_is_ready(*, silent: bool =3D False) -> bool:
+    log_print =3D (lambda *_args, **_kwargs: None) if silent else logger=
.error
+
+    if not check_executable("tmux", "-V"):
+        log_print("--terminal tmux requires tmux to be available and run=
nable, but startup failed.")
+        return False
+
+    return True
+
+
+def is_display_available(log_print, terminal_name: str) -> bool:
+    if "DISPLAY" not in os.environ and "WAYLAND_DISPLAY" not in os.envir=
on:
+        log_print(f"--terminal {terminal_name} requires a graphical disp=
lay"
+                  " but nor DISPLAY nor WAYLAND_DISPLAY is set.")
+        return False
+    return True
+
+
+def gterm_is_ready(*, silent: bool =3D False) -> bool:
+    log_print =3D (lambda *_args, **_kwargs: None) if silent else logger=
.error
+
+    if not is_display_available(log_print, "gnome-terminal"):
+        return False
+
+    if not check_executable("gnome-terminal", "--version"):
+        log_print("--terminal gnome-terminal requires gnome-terminal to =
be available and runnable, but startup failed.")
+        return False
+
+    return True
+
+
+def xterm_is_ready(*, silent: bool =3D False) -> bool:
+    log_print =3D (lambda *_args, **_kwargs: None) if silent else logger=
.error
+
+    if not is_display_available(log_print, "xterm"):
+        return False
+
+    if not check_executable("xterm", "-version"):
+        log_print("--terminal xterm requires xterm to be available and r=
unnable, but startup failed.")
+        return False
+
+    return True
+
+
 class Terminals:
-    Terminal =3D collections.namedtuple("Terminal", ["priority", "name",=
 "command"])
+    Terminal =3D collections.namedtuple("Terminal", ["priority", "name",=
 "command", "is_ready"])
=20
     def __init__(self):
         self.terminals =3D []
=20
-    def add_terminal(self, priority, name, command):
-        self.terminals.append(Terminals.Terminal(priority, name, command=
))
+    def always_ready(self, *, silent: bool =3D False) -> bool:
+        return True
+
+    def add_terminal(self, priority, name, command, is_ready=3DNone):
+        if is_ready is None:
+            is_ready =3D self.always_ready
+        self.terminals.append(Terminals.Terminal(priority, name, command=
, is_ready))
         # Keep this list sorted by priority
         self.terminals.sort(reverse=3DTrue, key=3Dlambda t: t.priority)
         self.name_map =3D {t.name: t for t in self.terminals}
=20
     def configured_terminal(self) -> Optional[str]:
-        import configparser
-
         config =3D configparser.ConfigParser()
         config.read(get_config_dir() / "runfvp.conf")
         return config.get("RunFVP", "Terminal", fallback=3DNone)
=20
     def preferred_terminal(self) -> str:
-        import shlex
-
         preferred =3D self.configured_terminal()
         if preferred:
             return preferred
=20
         for t in self.terminals:
-            if t.command and shutil.which(shlex.split(t.command)[0]):
+            if t.command and t.is_ready(silent=3DTrue):
                 return t.name
         return self.terminals[-1].name
=20
     def all_terminals(self) -> List[str]:
         return self.name_map.keys()
=20
+    def available_terminals(self) -> List[str]:
+        return [t for t in self.name_map if self.name_map[t].is_ready(si=
lent=3DTrue)]
+
     def __getitem__(self, name: str):
         return self.name_map[name]
=20
+
 terminals =3D Terminals()
 # TODO: option to switch between telnet and netcat
 connect_command =3D "telnet localhost %port"
-terminals.add_terminal(2, "tmux", f"tmux new-window -n \"{{name}}\" \"{c=
onnect_command}\"")
-terminals.add_terminal(2, "gnome-terminal", f"gnome-terminal --window --=
title \"{{name}} - %title\" --command \"{connect_command}\"")
-terminals.add_terminal(1, "xterm", f"xterm -title \"{{name}} - %title\" =
-e {connect_command}")
+terminals.add_terminal(2, "tmux", f'tmux new-window -n "{{name}}" "{conn=
ect_command}"', tmux_is_ready)
+terminals.add_terminal(2, "gnome-terminal", f'gnome-terminal --window --=
title "{{name}} - %title" --command "{connect_command}"', gterm_is_ready)
+terminals.add_terminal(1, "xterm", f'xterm -title "{{name}} - %title" -e=
 {connect_command}', xterm_is_ready)
 terminals.add_terminal(0, "none", None)
diff --git a/scripts/runfvp b/scripts/runfvp
index ceae18ae..8e6fe655 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -23,7 +23,8 @@ def parse_args(arguments):
     parser =3D argparse.ArgumentParser(description=3D"Run images in a FV=
P")
     parser.add_argument("config", nargs=3D"?", help=3D"Machine name or p=
ath to .fvpconf file")
     group =3D parser.add_mutually_exclusive_group()
-    group.add_argument("-t", "--terminals", choices=3Dterminals.all_term=
inals(), default=3Dterminals.preferred_terminal(), help=3D"Automatically =
start terminals (default: %(default)s)")
+    available_terminals=3D",".join(terminals.available_terminals())
+    group.add_argument("-t", "--terminals", choices=3Dterminals.all_term=
inals(), default=3Dterminals.preferred_terminal(), help=3Df"Automatically=
 start terminals (default: %(default)s). Available terminals are ({availa=
ble_terminals})")
     group.add_argument("-c", "--console", action=3D"store_true", help=3D=
"Attach the first uart to stdin/stdout")
     parser.add_argument("--verbose", action=3D"store_true", help=3D"Outp=
ut verbose logging")
     parser.usage =3D f"{parser.format_usage().strip()} -- [ arguments pa=
ssed to FVP ]"
@@ -52,6 +53,11 @@ def parse_args(arguments):
 def start_fvp(args, fvpconf, extra_args):
     fvp =3D runner.FVPRunner(logger)
     try:
+
+        if args.terminals:
+            if not terminal.terminals[args.terminals].is_ready():
+                return 1
+
         fvp.start(fvpconf, extra_args, args.terminals)
=20
         if args.console:
--=20
2.43.0


