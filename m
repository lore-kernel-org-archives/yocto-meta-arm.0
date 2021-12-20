Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D73C433F5
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 17:13:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8001.1640020422925051780
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Dec 2021 09:13:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 726C2ED1
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Dec 2021 09:13:42 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E0D13F774
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Dec 2021 09:13:42 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 6/7] runfvp: refactor terminal selection
Date: Mon, 20 Dec 2021 17:13:36 +0000
Message-Id: <20211220171337.877288-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220171337.877288-1-ross.burton@arm.com>
References: <20211220171337.877288-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 20 Dec 2021 17:13:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2747

Rewrite the terminal code to have a priority list of terminals when
selecting a default, allow the user to pick a default with a
configuration file, and add gnome-terminal to the list.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/runfvp | 69 +++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 52 insertions(+), 17 deletions(-)

diff --git a/scripts/runfvp b/scripts/runfvp
index fb334795..ca1e797c 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -1,6 +1,7 @@
 #! /usr/bin/env python3
=20
 import asyncio
+import collections
 import json
 import os
 import re
@@ -12,25 +13,59 @@ import pathlib
 import logging
 logger =3D logging.getLogger("RunFVP")
=20
-# TODO: option to switch between telnet and netcat
-connect_command =3D "telnet localhost %port"
+from typing import List, Optional
+
+def get_config_dir() -> pathlib.Path:
+    value =3D os.environ.get("XDG_CONFIG_HOME")
+    if value and os.path.isabs(value):
+        return pathlib.Path(value)
+    else:
+        return pathlib.Path.home() / ".config"
+
+class Terminals:
+    Terminal =3D collections.namedtuple("Terminal", ["priority", "name",=
 "command"])
+
+    def __init__(self):
+        self.terminals =3D []
+
+    def add_terminal(self, priority, name, command):
+        self.terminals.append(Terminals.Terminal(priority, name, command=
))
+        # Keep this list sorted by priority
+        self.terminals.sort(reverse=3DTrue, key=3Dlambda t: t.priority)
+        self.name_map =3D {t.name: t for t in self.terminals}
=20
-terminal_map =3D {
-    "tmux": f"tmux new-window -n \"%title\" \"{connect_command}\"",
-    "xterm": f"xterm -title \"%title\" -e {connect_command}",
-    "none": ""
-    # TODO more terminals
-}
+    def configured_terminal(self) -> Optional[str]:
+        import configparser
=20
-def get_default_terminal():
-    import shutil
-    import shlex
+        config =3D configparser.ConfigParser()
+        config.read(get_config_dir() / "runfvp.conf")
+        return config.get("RunFVP", "Terminal", fallback=3DNone)
=20
-    for terminal in "xterm",:
-        command =3D shlex.split(terminal_map[terminal])[0]
-        if shutil.which(command):
-            return terminal
-    return "none"
+    def preferred_terminal(self) -> str:
+        import shlex, shutil
+
+        preferred =3D self.configured_terminal()
+        if preferred:
+            return preferred
+
+        for t in self.terminals:
+            if t.command and shutil.which(shlex.split(t.command)[0]):
+                return t.name
+        return self.terminals[-1].name
+
+    def all_terminals(self) -> List[str]:
+        return self.name_map.keys()
+
+    def __getitem__(self, name: str):
+        return self.name_map[name]
+
+terminals =3D Terminals()
+# TODO: option to switch between telnet and netcat
+connect_command =3D "telnet localhost %port"
+terminals.add_terminal(2, "tmux", f"tmux new-window -n \"%title\" \"{con=
nect_command}\""),
+terminals.add_terminal(2, "gnome-terminal", f"gnome-terminal --window --=
title \"%title\" --command \"{connect_command}\""),
+terminals.add_terminal(1, "xterm", f"xterm -title \"%title\" -e {connect=
_command}"),
+terminals.add_terminal(0, "none", None)
=20
 def get_image_directory(machine=3DNone):
     """
@@ -59,7 +94,7 @@ def parse_args(arguments):
     parser =3D argparse.ArgumentParser(description=3D"Run images in a FV=
P")
     parser.add_argument("config", nargs=3D"?", help=3D"Machine name or p=
ath to .fvpconf file")
     group =3D parser.add_mutually_exclusive_group()
-    group.add_argument("-t", "--terminals", choices=3Dterminal_map.keys(=
), default=3Dget_default_terminal(), help=3D"Automatically start terminal=
s (default: %(default)s)")
+    group.add_argument("-t", "--terminals", choices=3Dterminals.all_term=
inals(), default=3Dterminals.preferred_terminal(), help=3D"Automatically =
start terminals (default: %(default)s)")
     group.add_argument("-c", "--console", action=3D"store_true", help=3D=
"Attach the first uart to stdin/stdout")
     parser.add_argument("--verbose", action=3D"store_true", help=3D"Outp=
ut verbose logging")
     parser.usage =3D f"{parser.format_usage().strip()} -- [ arguments pa=
ssed to FVP ]"
--=20
2.25.1


