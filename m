Received: from foss.arm.com (foss.arm.com [])
 by mx.groups.io with SMTP id smtpd.web11.141.1623934308230258263
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Jun 2021 05:51:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 _spf-b.arm.com}: parse error for token &{10 18 spf.protection.outlook.com}: parse error for token &{10 18 spfd.protection.outlook.com}: limit exceeded (domain: arm.com, ip: <nil>, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BC5913A1
	for <meta-arm@lists.yoctoproject.org>; Thu, 17 Jun 2021 05:51:49 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2682D3F719
	for <meta-arm@lists.yoctoproject.org>; Thu, 17 Jun 2021 05:51:49 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][hardknott 7/9] runfvp: pass arbitrary options after -- to the FVP binary
Date: Thu, 17 Jun 2021 13:51:41 +0100
Message-Id: <20210617125143.489231-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210617125143.489231-1-ross.burton@arm.com>
References: <20210617125143.489231-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Ross Burton <ross@burtonini.com>

To allow passing arbitrary options to the FVP binary, split the passed
options on --.  Anything before the separator is handled by runfvp,
anything afterwards is passed as-is to the FVP binary.

Change-Id: I686b2fb79d217e26988753be7bd067c638d69eac
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 scripts/runfvp | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/scripts/runfvp b/scripts/runfvp
index 4ef0bfc..4761270 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -46,9 +46,18 @@ def runfvp(args):
     group.add_argument("-c", "--console", action=3D"store_true", help=3D=
"Attach the first uart to stdin/stdout")
     parser.add_argument("-C", "--parameter", action=3D"append", default=3D=
[], help=3D"Extra configuration parameters for FVP")
     parser.add_argument("--verbose", action=3D"store_true", help=3D"Outp=
ut verbose logging")
+    parser.usage =3D f"{parser.format_usage().strip()} -- [ arguments pa=
ssed to FVP ]"
     # TODO option for telnet vs netcat
=20
-    args =3D parser.parse_args()
+    try:
+        i =3D sys.argv.index("--")
+        arguments =3D sys.argv[1:i]
+        fvp_args =3D sys.argv[i+1:]
+    except ValueError:
+        arguments =3D sys.argv[1:]
+        fvp_args =3D []
+
+    args =3D parser.parse_args(args=3Darguments)
     logging.basicConfig(level=3Dargs.verbose and logging.DEBUG or loggin=
g.WARNING)
     logger.debug(f"Parsed arguments are {vars(args)}")
=20
@@ -120,10 +129,13 @@ def runfvp(args):
=20
     cli.extend(config["args"])
=20
-    # Finally add the user's extra arguments
+    # Add any explicit --parameter calls
     for param in args.parameter:
         cli.extend(["--parameter", param])
=20
+    # Finally add the user's extra arguments
+    cli.extend(fvp_args)
+
     logger.debug(f"Constructed FVP call: {cli}")
     if args.console:
         expected_terminal =3D config["console"]
--=20
2.25.1

