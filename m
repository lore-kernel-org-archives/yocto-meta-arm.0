Return-Path: <harry.moulton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75EB4C433FE
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 12:34:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.5657.1650976467398377378
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 05:34:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harry.moulton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3A91ED1;
	Tue, 26 Apr 2022 05:34:26 -0700 (PDT)
Received: from e123741.cambridge.arm.com (e123741.cambridge.arm.com
 [10.1.196.216])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 005713F774;
	Tue, 26 Apr 2022 05:34:25 -0700 (PDT)
From: harry.moulton@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH honister 6/9] runfvp: refactor terminal selection
Date: Tue, 26 Apr 2022 13:33:56 +0100
Message-Id: <20220426123359.22873-7-harry.moulton@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220426123359.22873-1-harry.moulton@arm.com>
References: <20220426123359.22873-1-harry.moulton@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 26 Apr 2022 12:34:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3307

From: Ross Burton <ross.burton@arm.com>

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
 
 import asyncio
+import collections
 import json
 import os
 import re
@@ -12,25 +13,59 @@ import pathlib
 import logging
 logger = logging.getLogger("RunFVP")
 
-# TODO: option to switch between telnet and netcat
-connect_command = "telnet localhost %port"
+from typing import List, Optional
+
+def get_config_dir() -> pathlib.Path:
+    value = os.environ.get("XDG_CONFIG_HOME")
+    if value and os.path.isabs(value):
+        return pathlib.Path(value)
+    else:
+        return pathlib.Path.home() / ".config"
+
+class Terminals:
+    Terminal = collections.namedtuple("Terminal", ["priority", "name", "command"])
+
+    def __init__(self):
+        self.terminals = []
+
+    def add_terminal(self, priority, name, command):
+        self.terminals.append(Terminals.Terminal(priority, name, command))
+        # Keep this list sorted by priority
+        self.terminals.sort(reverse=True, key=lambda t: t.priority)
+        self.name_map = {t.name: t for t in self.terminals}
 
-terminal_map = {
-    "tmux": f"tmux new-window -n \"%title\" \"{connect_command}\"",
-    "xterm": f"xterm -title \"%title\" -e {connect_command}",
-    "none": ""
-    # TODO more terminals
-}
+    def configured_terminal(self) -> Optional[str]:
+        import configparser
 
-def get_default_terminal():
-    import shutil
-    import shlex
+        config = configparser.ConfigParser()
+        config.read(get_config_dir() / "runfvp.conf")
+        return config.get("RunFVP", "Terminal", fallback=None)
 
-    for terminal in "xterm",:
-        command = shlex.split(terminal_map[terminal])[0]
-        if shutil.which(command):
-            return terminal
-    return "none"
+    def preferred_terminal(self) -> str:
+        import shlex, shutil
+
+        preferred = self.configured_terminal()
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
+terminals = Terminals()
+# TODO: option to switch between telnet and netcat
+connect_command = "telnet localhost %port"
+terminals.add_terminal(2, "tmux", f"tmux new-window -n \"%title\" \"{connect_command}\""),
+terminals.add_terminal(2, "gnome-terminal", f"gnome-terminal --window --title \"%title\" --command \"{connect_command}\""),
+terminals.add_terminal(1, "xterm", f"xterm -title \"%title\" -e {connect_command}"),
+terminals.add_terminal(0, "none", None)
 
 def get_image_directory(machine=None):
     """
@@ -59,7 +94,7 @@ def parse_args(arguments):
     parser = argparse.ArgumentParser(description="Run images in a FVP")
     parser.add_argument("config", nargs="?", help="Machine name or path to .fvpconf file")
     group = parser.add_mutually_exclusive_group()
-    group.add_argument("-t", "--terminals", choices=terminal_map.keys(), default=get_default_terminal(), help="Automatically start terminals (default: %(default)s)")
+    group.add_argument("-t", "--terminals", choices=terminals.all_terminals(), default=terminals.preferred_terminal(), help="Automatically start terminals (default: %(default)s)")
     group.add_argument("-c", "--console", action="store_true", help="Attach the first uart to stdin/stdout")
     parser.add_argument("--verbose", action="store_true", help="Output verbose logging")
     parser.usage = f"{parser.format_usage().strip()} -- [ arguments passed to FVP ]"
-- 
2.17.1


