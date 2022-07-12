Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA1A0C433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 10:28:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7387.1657621724519170596
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Jul 2022 03:28:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83F0B1515;
	Tue, 12 Jul 2022 03:28:44 -0700 (PDT)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3872D3F792;
	Tue, 12 Jul 2022 03:28:43 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	robbie.cao@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 1/6] scripts,arm/lib: Refactor runfvp into FVPRunner
Date: Tue, 12 Jul 2022 11:28:25 +0100
Message-Id: <20220712102830.625090-2-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220712102830.625090-1-peter.hoyes@arm.com>
References: <20220712102830.625090-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 12 Jul 2022 10:28:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3555

From: Peter Hoyes <Peter.Hoyes@arm.com>

Refactor runfvp into a "fvp" library inside meta-arm. Split into
terminal, conffile and runner.

Issue-Id: SCM-4957
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I797f9a4eab810f3cc331b7db140f59c9911231fd
---
 meta-arm/lib/fvp/__init__.py |   0
 meta-arm/lib/fvp/conffile.py |  58 +++++++++
 meta-arm/lib/fvp/runner.py   | 115 +++++++++++++++++
 meta-arm/lib/fvp/terminal.py |  59 +++++++++
 scripts/runfvp               | 240 +++++------------------------------
 5 files changed, 262 insertions(+), 210 deletions(-)
 create mode 100644 meta-arm/lib/fvp/__init__.py
 create mode 100644 meta-arm/lib/fvp/conffile.py
 create mode 100644 meta-arm/lib/fvp/runner.py
 create mode 100644 meta-arm/lib/fvp/terminal.py

diff --git a/meta-arm/lib/fvp/__init__.py b/meta-arm/lib/fvp/__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/meta-arm/lib/fvp/conffile.py b/meta-arm/lib/fvp/conffile.py
new file mode 100644
index 0000000..77afca1
--- /dev/null
+++ b/meta-arm/lib/fvp/conffile.py
@@ -0,0 +1,58 @@
+import json
+import pathlib
+import os
+
+
+def get_image_directory(machine=3DNone):
+    """
+    Get the DEPLOY_DIR_IMAGE for the specified machine
+    (or the configured machine if not set).
+    """
+    try:
+        import bb.tinfoil
+    except ImportError as e:
+        raise RuntimeError("Cannot connect to BitBake, did you oe-init-b=
uild-env?") from e
+
+    if machine:
+        os.environ["MACHINE"] =3D machine
+
+    with bb.tinfoil.Tinfoil() as tinfoil:
+        tinfoil.prepare(config_only=3DTrue)
+        image_dir =3D tinfoil.config_data.getVar("DEPLOY_DIR_IMAGE")
+        return pathlib.Path(image_dir)
+
+def find(machine):
+    image_dir =3D get_image_directory(machine)
+    # All .fvpconf configuration files
+    configs =3D image_dir.glob("*.fvpconf")
+    # Just the files
+    configs =3D [p for p in configs if p.is_file() and not p.is_symlink(=
)]
+    if not configs:
+            print(f"Cannot find any .fvpconf in {image_dir}")
+            raise RuntimeError()
+    # Sorted by modification time
+    configs =3D sorted(configs, key=3Dlambda p: p.stat().st_mtime)
+    return configs[-1]
+
+
+def load(config_file):
+    with open(config_file) as f:
+        config =3D json.load(f)
+
+    # Ensure that all expected keys are present
+    def sanitise(key, value):
+        if key not in config or config[key] is None:
+            config[key] =3D value
+    sanitise("fvp-bindir", "")
+    sanitise("exe", "")
+    sanitise("parameters", {})
+    sanitise("data", {})
+    sanitise("applications", {})
+    sanitise("terminals", {})
+    sanitise("args", [])
+    sanitise("console", "")
+
+    if not config["exe"]:
+        raise ValueError("Required value FVP_EXE not set in machine conf=
iguration")
+
+    return config
diff --git a/meta-arm/lib/fvp/runner.py b/meta-arm/lib/fvp/runner.py
new file mode 100644
index 0000000..e7983c6
--- /dev/null
+++ b/meta-arm/lib/fvp/runner.py
@@ -0,0 +1,115 @@
+import asyncio
+import re
+import subprocess
+import os
+import shutil
+import sys
+
+from .terminal import terminals
+
+
+def cli_from_config(config, terminal_choice):
+    cli =3D []
+    if config["fvp-bindir"]:
+        cli.append(os.path.join(config["fvp-bindir"], config["exe"]))
+    else:
+        cli.append(config["exe"])
+
+    for param, value in config["parameters"].items():
+        cli.extend(["--parameter", f"{param}=3D{value}"])
+
+    for value in config["data"]:
+        cli.extend(["--data", value])
+
+    for param, value in config["applications"].items():
+        cli.extend(["--application", f"{param}=3D{value}"])
+
+    for terminal, name in config["terminals"].items():
+        # If terminals are enabled and this terminal has been named
+        if terminal_choice !=3D "none" and name:
+            # TODO if raw mode
+            # cli.extend(["--parameter", f"{terminal}.mode=3Draw"])
+            # TODO put name into terminal title
+            cli.extend(["--parameter", f"{terminal}.terminal_command=3D{=
terminals[terminal_choice].command}"])
+        else:
+            # Disable terminal
+            cli.extend(["--parameter", f"{terminal}.start_telnet=3D0"])
+
+    cli.extend(config["args"])
+
+    return cli
+
+def check_telnet():
+    # Check that telnet is present
+    if not bool(shutil.which("telnet")):
+        raise RuntimeError("Cannot find telnet, this is needed to connec=
t to the FVP.")
+
+class FVPRunner:
+    def __init__(self, logger):
+        self._terminal_ports =3D {}
+        self._line_callbacks =3D []
+        self._logger =3D logger
+        self._fvp_process =3D None
+        self._telnets =3D []
+
+    def add_line_callback(self, callback):
+        self._line_callbacks.append(callback)
+
+    async def start(self, config, extra_args=3D[], terminal_choice=3D"no=
ne"):
+        cli =3D cli_from_config(config, terminal_choice)
+        cli +=3D extra_args
+        self._logger.debug(f"Constructed FVP call: {cli}")
+        self._fvp_process =3D await asyncio.create_subprocess_exec(*cli,=
 stdin=3Dsubprocess.DEVNULL, stdout=3Dsubprocess.PIPE, stderr=3Dsubproces=
s.STDOUT)
+
+        def detect_terminals(line):
+            m =3D re.match(r"^(\S+): Listening for serial connection on =
port (\d+)$", line)
+            if m:
+                terminal =3D m.group(1)
+                port =3D int(m.group(2))
+                self._terminal_ports[terminal] =3D port
+        self.add_line_callback(detect_terminals)
+
+    async def stop(self):
+        if self._fvp_process:
+            self._logger.debug(f"Killing FVP PID {self._fvp_process.pid}=
")
+            try:
+                self._fvp_process.terminate()
+            except ProcessLookupError:
+                pass
+
+            if await self._fvp_process.wait() !=3D 0:
+                self._logger.info(f"FVP quit with code {self._fvp_proces=
s.returncode}")
+                return self._fvp_process.returncode
+            else:
+                return 0
+
+        for telnet in self._telnets:
+            await telnet.terminate()
+            await telnet.wait()
+
+    async def run(self, until=3DNone):
+        if until and until():
+            return
+
+        async for line in self._fvp_process.stdout:
+            line =3D line.strip().decode("utf-8", errors=3D"replace")
+            for callback in self._line_callbacks:
+                callback(line)
+            if until and until():
+                return
+
+    async def _get_terminal_port(self, terminal, timeout):
+        def terminal_exists():
+            return terminal in self._terminal_ports
+        await asyncio.wait_for(self.run(terminal_exists), timeout)
+        return self._terminal_ports[terminal]
+
+    async def create_telnet(self, terminal, timeout=3D15.0):
+        check_telnet()
+        port =3D await self._get_terminal_port(terminal, timeout)
+        telnet =3D await asyncio.create_subprocess_exec("telnet", "local=
host", str(port), stdin=3Dsys.stdin, stdout=3Dsys.stdout)
+        self._telnets.append(telnet)
+        return telnet
+
+    def pid(self):
+        return self._fvp_process.pid
diff --git a/meta-arm/lib/fvp/terminal.py b/meta-arm/lib/fvp/terminal.py
new file mode 100644
index 0000000..6f40815
--- /dev/null
+++ b/meta-arm/lib/fvp/terminal.py
@@ -0,0 +1,59 @@
+import shutil
+import collections
+import pathlib
+import os
+
+from typing import List, Optional
+
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
+
+    def configured_terminal(self) -> Optional[str]:
+        import configparser
+
+        config =3D configparser.ConfigParser()
+        config.read(get_config_dir() / "runfvp.conf")
+        return config.get("RunFVP", "Terminal", fallback=3DNone)
+
+    def preferred_terminal(self) -> str:
+        import shlex
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
diff --git a/scripts/runfvp b/scripts/runfvp
index 7a3c239..30eae40 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -1,96 +1,23 @@
 #! /usr/bin/env python3
=20
 import asyncio
-import collections
-import json
 import os
-import re
-import shutil
+import pathlib
 import signal
 import sys
-import subprocess
-import pathlib
=20
 import logging
 logger =3D logging.getLogger("RunFVP")
=20
-from typing import List, Optional
-
-def get_config_dir() -> pathlib.Path:
-    value =3D os.environ.get("XDG_CONFIG_HOME")
-    if value and os.path.isabs(value):
-        return pathlib.Path(value)
-    else:
-        return pathlib.Path.home() / ".config"
-
-class Terminals:
-    Terminal =3D collections.namedtuple("Terminal", ["priority", "name",=
 "command"])
-
-    def __init__(self):
-        self.terminals =3D []
-
-    def add_terminal(self, priority, name, command):
-        self.terminals.append(Terminals.Terminal(priority, name, command=
))
-        # Keep this list sorted by priority
-        self.terminals.sort(reverse=3DTrue, key=3Dlambda t: t.priority)
-        self.name_map =3D {t.name: t for t in self.terminals}
-
-    def configured_terminal(self) -> Optional[str]:
-        import configparser
-
-        config =3D configparser.ConfigParser()
-        config.read(get_config_dir() / "runfvp.conf")
-        return config.get("RunFVP", "Terminal", fallback=3DNone)
-
-    def preferred_terminal(self) -> str:
-        import shlex
-
-        preferred =3D self.configured_terminal()
-        if preferred:
-            return preferred
-
-        for t in self.terminals:
-            if t.command and shutil.which(shlex.split(t.command)[0]):
-                return t.name
-        return self.terminals[-1].name
-
-    def all_terminals(self) -> List[str]:
-        return self.name_map.keys()
-
-    def __getitem__(self, name: str):
-        return self.name_map[name]
-
-terminals =3D Terminals()
-# TODO: option to switch between telnet and netcat
-connect_command =3D "telnet localhost %port"
-terminals.add_terminal(2, "tmux", f"tmux new-window -n \"%title\" \"{con=
nect_command}\""),
-terminals.add_terminal(2, "gnome-terminal", f"gnome-terminal --window --=
title \"%title\" --command \"{connect_command}\""),
-terminals.add_terminal(1, "xterm", f"xterm -title \"%title\" -e {connect=
_command}"),
-terminals.add_terminal(0, "none", None)
-
-def get_image_directory(machine=3DNone):
-    """
-    Get the DEPLOY_DIR_IMAGE for the specified machine
-    (or the configured machine if not set).
-    """
-    try:
-        import bb.tinfoil
-    except ImportError:
-        logger.error("Cannot connect to BitBake, did you oe-init-build-e=
nv?")
-        sys.exit(1)
-
-    if machine:
-        os.environ["MACHINE"] =3D machine
-
-    with bb.tinfoil.Tinfoil() as tinfoil:
-        tinfoil.prepare(config_only=3DTrue)
-        image_dir =3D tinfoil.config_data.getVar("DEPLOY_DIR_IMAGE")
-        logger.debug(f"Got DEPLOY_DIR_IMAGE {image_dir}")
-        return pathlib.Path(image_dir)
+# Add meta-arm/lib/ to path
+libdir =3D pathlib.Path(__file__).parents[1] / "meta-arm" / "lib"
+sys.path.insert(0, str(libdir))
=20
+from fvp import terminal, runner, conffile
=20
 def parse_args(arguments):
     import argparse
+    terminals =3D terminal.terminals
=20
     parser =3D argparse.ArgumentParser(description=3D"Run images in a FV=
P")
     parser.add_argument("config", nargs=3D"?", help=3D"Machine name or p=
ath to .fvpconf file")
@@ -120,148 +47,41 @@ def parse_args(arguments):
     logger.debug(f"FVP arguments: {fvp_args}")
     return args, fvp_args
=20
-def find_config(args):
-    if args.config and os.path.exists(args.config):
-        return args.config
-    else:
-        image_dir =3D get_image_directory(args.config)
-        # All .fvpconf configuration files
-        configs =3D image_dir.glob("*.fvpconf")
-        # Just the files
-        configs =3D [p for p in configs if p.is_file() and not p.is_syml=
ink()]
-        if not configs:
-            print(f"Cannot find any .fvpconf in {image_dir}")
-            sys.exit(1)
-        # Sorted by modification time
-        configs =3D sorted(configs, key=3Dlambda p: p.stat().st_mtime)
-        return configs[-1]
-
-
-def load_config(config_file):
-    logger.debug(f"Loading {config_file}")
-    with open(config_file) as f:
-        config =3D json.load(f)
-
-    # Ensure that all expected keys are present
-    def sanitise(key, value):
-        if key not in config or config[key] is None:
-            config[key] =3D value
-    sanitise("fvp-bindir", "")
-    sanitise("exe", "")
-    sanitise("parameters", {})
-    sanitise("data", {})
-    sanitise("applications", {})
-    sanitise("terminals", {})
-    sanitise("args", [])
-    sanitise("console", "")
-
-    if not config["exe"]:
-        logger.error("Required value FVP_EXE not set in machine configur=
ation")
-        sys.exit(1)
-
-    return config
=20
-def parse_config(args, config):
-    cli =3D []
-    if config["fvp-bindir"]:
-        cli.append(os.path.join(config["fvp-bindir"], config["exe"]))
-    else:
-        cli.append(config["exe"])
-
-    for param, value in config["parameters"].items():
-        cli.extend(["--parameter", f"{param}=3D{value}"])
-
-    for value in config["data"]:
-        cli.extend(["--data", value])
-
-    for param, value in config["applications"].items():
-        cli.extend(["--application", f"{param}=3D{value}"])
-
-    for terminal, name in config["terminals"].items():
-        # If terminals are enabled and this terminal has been named
-        if args.terminals !=3D "none" and name:
-            # TODO if raw mode
-            # cli.extend(["--parameter", f"{terminal}.mode=3Draw"])
-            # TODO put name into terminal title
-            cli.extend(["--parameter", f"{terminal}.terminal_command=3D{=
terminals[args.terminals].command}"])
-        else:
-            # Disable terminal
-            cli.extend(["--parameter", f"{terminal}.start_telnet=3D0"])
-
-    cli.extend(config["args"])
-
-    return cli
-
-async def start_fvp(cli, console_cb):
+async def start_fvp(args, config, extra_args):
+    fvp =3D runner.FVPRunner(logger)
     try:
-        fvp_process =3D await asyncio.create_subprocess_exec(*cli, stdin=
=3Dsubprocess.DEVNULL, stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.STDO=
UT)
-
-        async for line in fvp_process.stdout:
-            line =3D line.strip().decode("utf-8", errors=3D"replace")
-            if console_cb:
-                logger.debug(f"FVP output: {line}")
-            else:
-                print(line)
+        await fvp.start(config, extra_args, args.terminals)
+
+        if args.console:
+            fvp.add_line_callback(lambda line: logger.debug(f"FVP output=
: {line}"))
+            expected_terminal =3D config["console"]
+            if not expected_terminal:
+                logger.error("--console used but FVP_CONSOLE not set in =
machine configuration")
+                return 1
+            telnet =3D await fvp.create_telnet(expected_terminal)
+            await telnet.wait()
+            logger.debug(f"Telnet quit, cancelling tasks")
+        else:
+            fvp.add_line_callback(lambda line: print(line))
=20
-            # Look for serial connections opening
-            if console_cb:
-                m =3D re.match(r"^(\S+): Listening for serial connection=
 on port (\d+)$", line)
-                if m:
-                    terminal =3D m.group(1)
-                    port =3D int(m.group(2))
-                    logger.debug(f"Console for {terminal} started on por=
t {port}")
-                    # When we can assume Py3.7+, this can be create_task
-                    asyncio.ensure_future(console_cb(terminal, port))
+        await fvp.run()
     finally:
-        # If we get cancelled or throw an exception, kill the FVP
-        logger.debug(f"Killing FVP PID {fvp_process.pid}")
-        try:
-            fvp_process.terminate()
-        except ProcessLookupError:
-            pass
-
-    if await fvp_process.wait() !=3D 0:
-        logger.info(f"{cli[0]} quit with code {fvp_process.returncode}")
-        return fvp_process.returncode
-    else:
-        return 0
+        await fvp.stop()
=20
 def runfvp(cli_args):
-    args, fvp_args =3D parse_args(cli_args)
-    config_file =3D find_config(args)
-    config =3D load_config(config_file)
-    cli =3D parse_config(args, config)
-    cli.extend(fvp_args)
-    logger.debug(f"Constructed FVP call: {cli}")
-
-    # Check that telnet is present
-    if not bool(shutil.which("telnet")):
-        logger.error("Cannot find telnet, this is needed to connect to t=
he FVP.")
-        return 1
-
-    if args.console:
-        expected_terminal =3D config["console"]
-        if not expected_terminal:
-            logger.error("--console used but FVP_CONSOLE not set in mach=
ine configuration")
-            return 1
+    args, extra_args =3D parse_args(cli_args)
+    if args.config and pathlib.Path(args.config).exists():
+        config_file =3D args.config
     else:
-        expected_terminal =3D None
-
-    async def console_started(name, port):
-        if name =3D=3D expected_terminal:
-            telnet =3D await asyncio.create_subprocess_exec("telnet", "l=
ocalhost", str(port), stdin=3Dsys.stdin, stdout=3Dsys.stdout)
-            await telnet.wait()
-            logger.debug(f"Telnet quit, cancelling tasks")
-            # TODO: this is 3.7+
-            for t in asyncio.all_tasks():
-                logger.debug(f"Cancelling {t}")
-                t.cancel()
+        config_file =3D conffile.find(args.config)
+    logger.debug(f"Loading {config_file}")
+    config =3D conffile.load(config_file)
=20
     try:
         # When we can assume Py3.7+, this can simply be asyncio.run()
         loop =3D asyncio.get_event_loop()
-        console_cb =3D expected_terminal and console_started or None
-        return loop.run_until_complete(start_fvp(cli, console_cb=3Dconso=
le_cb))
+        return loop.run_until_complete(start_fvp(args, config, extra_arg=
s))
     except asyncio.CancelledError:
         # This means telnet exited, which isn't an error
         return 0
--=20
2.25.1


