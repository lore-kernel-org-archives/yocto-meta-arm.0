Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.8984.1622042190109323371
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 26 May 2021 08:16:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B7CF1692
	for <meta-arm@lists.yoctoproject.org>; Wed, 26 May 2021 08:16:29 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 160F73F73D
	for <meta-arm@lists.yoctoproject.org>; Wed, 26 May 2021 08:16:28 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/6] scripts: add runfvp
Date: Wed, 26 May 2021 16:16:17 +0100
Message-Id: <20210526151618.170014-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526151618.170014-1-ross.burton@arm.com>
References: <20210526151618.170014-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

runfvp is a script that reads existing .fvpconf files (as written by
fvpboot.bbclass) and executes the FVP binary appropriately.

By default the behaviour is the same as running a FVP by hand, but by
passing --console the first serial port is connected to stdin/stdout.

Change-Id: Ibd26867c09e8692be4c02a7ea13571dcfe36db9b
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/runfvp | 108 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100755 scripts/runfvp

diff --git a/scripts/runfvp b/scripts/runfvp
new file mode 100755
index 0000000..ddda9b1
--- /dev/null
+++ b/scripts/runfvp
@@ -0,0 +1,108 @@
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
+if __name__ =3D=3D "__main__":
+    import argparse
+
+    parser =3D argparse.ArgumentParser(description=3D"Run images in a FV=
P")
+    parser.add_argument("config", nargs=3D"?", help=3D"Machine name or p=
ath to .fvpconf file")
+    parser.add_argument("-t", "--terminals", choices=3Dterminal_map.keys=
(), default=3D"xterm", help=3D"Automatically start terminals")
+    parser.add_argument("--verbose", action=3D"store_true", help=3D"Outp=
ut verbose logging")
+    # TODO option for telnet vs netcat
+
+    args =3D parser.parse_args()
+    logging.basicConfig(level=3Dargs.verbose and logging.DEBUG or loggin=
g.WARNING)
+    logger.debug(f"Parsed arguments are {vars(args)}")
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
+    sanitise("parameters", {})
+    sanitise("data", {})
+    sanitise("applications", {})
+    sanitise("args", [])
+
+    cli =3D []
+    if "fvp-bindir" in config:
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
+    logger.debug(f"Constructed FVP call: {cli}")
+    subprocess.run(cli)
--=20
2.25.1

