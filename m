Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 945F5C4332F
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 12:56:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.30758.1632747368725587502
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 27 Sep 2021 05:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34EDCD6E
	for <meta-arm@lists.yoctoproject.org>; Mon, 27 Sep 2021 05:56:08 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE5663F718
	for <meta-arm@lists.yoctoproject.org>; Mon, 27 Sep 2021 05:56:07 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/7] runfvp: refactor argument parsing
Date: Mon, 27 Sep 2021 13:56:00 +0100
Message-Id: <20210927125602.3400822-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210927125602.3400822-1-ross.burton@arm.com>
References: <20210927125602.3400822-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 27 Sep 2021 12:56:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2233

No behavioural changes, just cleanup.

Change-Id: I04d82512493a2f90e810198e520f672284cd3eb2
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/runfvp | 41 ++++++++++++++++++++++++++++-------------
 1 file changed, 28 insertions(+), 13 deletions(-)

diff --git a/scripts/runfvp b/scripts/runfvp
index 52d8f20b..0b70c56b 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -36,7 +36,7 @@ def get_image_directory(machine=3DNone):
         return pathlib.Path(image_dir)
=20
=20
-def runfvp(args):
+def parse_args(arguments):
     import argparse
=20
     parser =3D argparse.ArgumentParser(description=3D"Run images in a FV=
P")
@@ -48,24 +48,28 @@ def runfvp(args):
     parser.usage =3D f"{parser.format_usage().strip()} -- [ arguments pa=
ssed to FVP ]"
     # TODO option for telnet vs netcat
=20
-    try:
-        i =3D sys.argv.index("--")
-        arguments =3D sys.argv[1:i]
-        fvp_args =3D sys.argv[i+1:]
-    except ValueError:
-        arguments =3D sys.argv[1:]
+    # If the arguments contains -- then everything after it should be pa=
ssed to the FVP binary directly.
+    if "--" in arguments:
+        i =3D arguments.index("--")
+        fvp_args =3D arguments[i+1:]
+        arguments =3D arguments[:i]
+    else:
         fvp_args =3D []
=20
     args =3D parser.parse_args(args=3Darguments)
     logging.basicConfig(level=3Dargs.verbose and logging.DEBUG or loggin=
g.WARNING)
-    logger.debug(f"Parsed arguments are {vars(args)}")
=20
     # If we're hooking up the console, don't start any terminals
     if args.console:
         args.terminals =3D "none"
=20
+    logger.debug(f"Parsed arguments: {vars(args)}")
+    logger.debug(f"FVP arguments: {fvp_args}")
+    return args, fvp_args
+
+def find_config(args):
     if args.config and os.path.exists(args.config):
-        config_file =3D args.config
+        return args.config
     else:
         image_dir =3D get_image_directory(args.config)
         # All .fvpconf configuration files
@@ -77,8 +81,10 @@ def runfvp(args):
             sys.exit(1)
         # Sorted by modification time
         configs =3D sorted(configs, key=3Dlambda p: p.stat().st_mtime)
-        config_file =3D configs[-1]
+        return configs[-1]
+
=20
+def load_config(config_file):
     logger.debug(f"Loading {config_file}")
     with open(config_file) as f:
         config =3D json.load(f)
@@ -100,6 +106,9 @@ def runfvp(args):
         logger.error("Required value FVP_EXE not set in machine configur=
ation")
         sys.exit(1)
=20
+    return config
+
+def parse_config(args, config):
     cli =3D []
     if config["fvp-bindir"]:
         cli.append(os.path.join(config["fvp-bindir"], config["exe"]))
@@ -128,10 +137,16 @@ def runfvp(args):
=20
     cli.extend(config["args"])
=20
-    # Finally add the user's extra arguments
-    cli.extend(fvp_args)
+    return cli
=20
+def runfvp(cli_args):
+    args, fvp_args =3D parse_args(cli_args)
+    config_file =3D find_config(args)
+    config =3D load_config(config_file)
+    cli =3D parse_config(args, config)
+    cli.extend(fvp_args)
     logger.debug(f"Constructed FVP call: {cli}")
+
     if args.console:
         expected_terminal =3D config["console"]
         if not expected_terminal:
@@ -165,6 +180,6 @@ def runfvp(args):
=20
 if __name__ =3D=3D "__main__":
     try:
-        runfvp(sys.argv)
+        runfvp(sys.argv[1:])
     except KeyboardInterrupt:
         pass
--=20
2.25.1


