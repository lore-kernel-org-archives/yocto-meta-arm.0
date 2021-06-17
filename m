Received: from foss.arm.com (foss.arm.com [])
 by mx.groups.io with SMTP id smtpd.web11.141.1623934308230258263
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Jun 2021 05:51:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 _spf-b.arm.com}: parse error for token &{10 18 spf.protection.outlook.com}: parse error for token &{10 18 spfd.protection.outlook.com}: limit exceeded (domain: arm.com, ip: <nil>, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 633F412FC
	for <meta-arm@lists.yoctoproject.org>; Thu, 17 Jun 2021 05:51:48 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0DF733F719
	for <meta-arm@lists.yoctoproject.org>; Thu, 17 Jun 2021 05:51:47 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][hardknott 5/9] scripts: add runfvp
Date: Thu, 17 Jun 2021 13:51:39 +0100
Message-Id: <20210617125143.489231-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210617125143.489231-1-ross.burton@arm.com>
References: <20210617125143.489231-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

runfvp is a script that reads existing .fvpconf files (as written by
fvpboot.bbclass) and executes the FVP binary appropriately.

By default the behaviour is the same as running a FVP by hand, but by
passing --console the first serial port is connected to stdin/stdout.

Change-Id: Ibd26867c09e8692be4c02a7ea13571dcfe36db9b
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/runfvp | 160 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 160 insertions(+)
 create mode 100755 scripts/runfvp

diff --git a/scripts/runfvp b/scripts/runfvp
new file mode 100755
index 0000000..d0e97d0
--- /dev/null
+++ b/scripts/runfvp
@@ -0,0 +1,160 @@
+#! /usr/bin/env python3
+
+import json
+import os
+import sys
+import subprocess
+import pathlib
+
+import logging
+logger =3D logging.getLogger("RunFVP")
+
+# TODO: option to switch between telnet and netcat
+connect_command =3D "telnet localhost %port"
+
+terminal_map =3D {
+    "tmux": f"tmux new-window -n \"%title\" \"{connect_command}\"",
+    "xterm": f"xterm -title \"%title\" -e {connect_command}",
+    "none": ""
+    # TODO more terminals
+}
+
+def get_image_directory(machine=3DNone):
+    """
+    Get the DEPLOY_DIR_IMAGE for the specified machine
+    (or the configured machine if not set).
+    """
+    import bb.tinfoil
+
+    if machine:
+        os.environ["MACHINE"] =3D machine
+
+    with bb.tinfoil.Tinfoil() as tinfoil:
+        tinfoil.prepare(config_only=3DTrue)
+        image_dir =3D tinfoil.config_data.getVar("DEPLOY_DIR_IMAGE")
+        logger.debug(f"Got DEPLOY_DIR_IMAGE {image_dir}")
+        return pathlib.Path(image_dir)
+
+
+def runfvp(args):
+    import argparse
+
+    parser =3D argparse.ArgumentParser(description=3D"Run images in a FV=
P")
+    parser.add_argument("config", nargs=3D"?", help=3D"Machine name or p=
ath to .fvpconf file")
+    group =3D parser.add_mutually_exclusive_group()
+    group.add_argument("-t", "--terminals", choices=3Dterminal_map.keys(=
), default=3D"xterm", help=3D"Automatically start terminals")
+    group.add_argument("-c", "--console", action=3D"store_true", help=3D=
"Attach the first uart to stdin/stdout")
+    parser.add_argument("-C", "--parameter", action=3D"append", default=3D=
[], help=3D"Extra configuration parameters for FVP")
+    parser.add_argument("--verbose", action=3D"store_true", help=3D"Outp=
ut verbose logging")
+    # TODO option for telnet vs netcat
+
+    args =3D parser.parse_args()
+    logging.basicConfig(level=3Dargs.verbose and logging.DEBUG or loggin=
g.WARNING)
+    logger.debug(f"Parsed arguments are {vars(args)}")
+
+    # If we're hooking up the console, don't start any terminals
+    if args.console:
+        args.terminals =3D "none"
+
+    if args.config and os.path.exists(args.config):
+        config_file =3D args.config
+    else:
+        image_dir =3D get_image_directory(args.config)
+        # All .fvpconf configuration files
+        configs =3D image_dir.glob("*.fvpconf")
+        # Just the files
+        configs =3D [p for p in configs if p.is_file() and not p.is_syml=
ink()]
+        if not configs:
+            print(f"Cannot find any .fvpconf in {image_dir}")
+            sys.exit(1)
+        # Sorted by modification time
+        configs =3D sorted(configs, key=3Dlambda p: p.stat().st_mtime)
+        config_file =3D configs[-1]
+
+    logger.debug(f"Loading {config_file}")
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
+        logger.error("Required value FVP_EXE not set in machine configur=
ation")
+        sys.exit(1)
+
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
+        if args.terminals !=3D "none" and name:
+            # TODO if raw mode
+            # cli.extend(["--parameter", f"{terminal}.mode=3Draw"])
+            # TODO put name into terminal title
+            cli.extend(["--parameter", f"{terminal}.terminal_command=3D{=
terminal_map[args.terminals]}"])
+        else:
+            # Disable terminal
+            cli.extend(["--parameter", f"{terminal}.start_telnet=3D0"])
+
+    cli.extend(config["args"])
+
+    # Finally add the user's extra arguments
+    for param in args.parameter:
+        cli.extend(["--parameter", param])
+
+    logger.debug(f"Constructed FVP call: {cli}")
+    if args.console:
+        expected_terminal =3D config["console"]
+        if not expected_terminal:
+            logger.error("--console used but FVP_CONSOLE not set in mach=
ine configuration")
+            sys.exit(1)
+
+        fvp_process =3D subprocess.Popen(cli, bufsize=3D1, universal_new=
lines=3DTrue, stdin=3Dsubprocess.DEVNULL, stdout=3Dsubprocess.PIPE, stder=
r=3Dsubprocess.STDOUT)
+
+        import selectors, re
+        selector =3D selectors.DefaultSelector()
+        selector.register(fvp_process.stdout, selectors.EVENT_READ)
+        output =3D ""
+        looking =3D True
+        while fvp_process.poll() is None:
+            # TODO some sort of timeout for 'input never appeared'
+            events =3D selector.select(timeout=3D10)
+            for key, mask in events:
+                line =3D key.fileobj.readline()
+                output +=3D line
+                if looking:
+                    m =3D re.match(fr"^{expected_terminal}: Listening.+p=
ort ([0-9]+)$", line)
+                    if m:
+                        port =3D m.group(1)
+                        subprocess.run(["telnet", "localhost", port])
+                        looking =3D False
+        if fvp_process.returncode:
+            logger.error(f"{fvp_process.args[0]} quit with code {fvp_pro=
cess.returncode}:")
+            logger.error(output)
+    else:
+        subprocess.run(cli)
+
+if __name__ =3D=3D "__main__":
+    runfvp(sys.argv)
--=20
2.25.1

