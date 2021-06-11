Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.10295.1623425572737925914
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Jun 2021 08:32:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34D8E143D
	for <meta-arm@lists.yoctoproject.org>; Fri, 11 Jun 2021 08:32:52 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2CA53F73D
	for <meta-arm@lists.yoctoproject.org>; Fri, 11 Jun 2021 08:32:51 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] runfvp: drop --parameter, users can use -- --parameter
Date: Fri, 11 Jun 2021 16:32:46 +0100
Message-Id: <20210611153246.2555026-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611153246.2555026-1-ross.burton@arm.com>
References: <20210611153246.2555026-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Now that arbitrary parameters can be passed to the FVP binary, runfvp
doesn't need to handle --parameter itself.

Anyone using runfvp --parameter should simply use runfvp -- --parameter.

Change-Id: I8a79200fe927c253308731e7e0cb228e53cd989a
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/runfvp | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/scripts/runfvp b/scripts/runfvp
index 4761270..be04768 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -44,7 +44,6 @@ def runfvp(args):
     group =3D parser.add_mutually_exclusive_group()
     group.add_argument("-t", "--terminals", choices=3Dterminal_map.keys(=
), default=3D"xterm", help=3D"Automatically start terminals")
     group.add_argument("-c", "--console", action=3D"store_true", help=3D=
"Attach the first uart to stdin/stdout")
-    parser.add_argument("-C", "--parameter", action=3D"append", default=3D=
[], help=3D"Extra configuration parameters for FVP")
     parser.add_argument("--verbose", action=3D"store_true", help=3D"Outp=
ut verbose logging")
     parser.usage =3D f"{parser.format_usage().strip()} -- [ arguments pa=
ssed to FVP ]"
     # TODO option for telnet vs netcat
@@ -129,10 +128,6 @@ def runfvp(args):
=20
     cli.extend(config["args"])
=20
-    # Add any explicit --parameter calls
-    for param in args.parameter:
-        cli.extend(["--parameter", param])
-
     # Finally add the user's extra arguments
     cli.extend(fvp_args)
=20
--=20
2.25.1

