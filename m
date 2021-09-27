Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 940B4C433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 12:56:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.30751.1632747367571683995
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 27 Sep 2021 05:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB7A611D4
	for <meta-arm@lists.yoctoproject.org>; Mon, 27 Sep 2021 05:56:08 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 673CA3F718
	for <meta-arm@lists.yoctoproject.org>; Mon, 27 Sep 2021 05:56:08 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 6/7] runfvp: ensure the default terminal is usable
Date: Mon, 27 Sep 2021 13:56:01 +0100
Message-Id: <20210927125602.3400822-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210927125602.3400822-1-ross.burton@arm.com>
References: <20210927125602.3400822-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 27 Sep 2021 12:56:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2234

Pick a default terminal which will actually work, instead of defaulting
to xterm even if xterm isn't installed.

Also show the default in the --help output.

Change-Id: Ib3e7c32917725f404a171248549b6f9c0afe8158
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/runfvp | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/scripts/runfvp b/scripts/runfvp
index 0b70c56b..e40bad0d 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -19,6 +19,16 @@ terminal_map =3D {
     # TODO more terminals
 }
=20
+def get_default_terminal():
+    import shutil
+    import shlex
+
+    for terminal in "xterm",:
+        command =3D shlex.split(terminal_map[terminal])[0]
+        if shutil.which(command):
+            return terminal
+    return "none"
+
 def get_image_directory(machine=3DNone):
     """
     Get the DEPLOY_DIR_IMAGE for the specified machine
@@ -42,7 +52,7 @@ def parse_args(arguments):
     parser =3D argparse.ArgumentParser(description=3D"Run images in a FV=
P")
     parser.add_argument("config", nargs=3D"?", help=3D"Machine name or p=
ath to .fvpconf file")
     group =3D parser.add_mutually_exclusive_group()
-    group.add_argument("-t", "--terminals", choices=3Dterminal_map.keys(=
), default=3D"xterm", help=3D"Automatically start terminals")
+    group.add_argument("-t", "--terminals", choices=3Dterminal_map.keys(=
), default=3Dget_default_terminal(), help=3D"Automatically start terminal=
s (default: %(default)s)")
     group.add_argument("-c", "--console", action=3D"store_true", help=3D=
"Attach the first uart to stdin/stdout")
     parser.add_argument("--verbose", action=3D"store_true", help=3D"Outp=
ut verbose logging")
     parser.usage =3D f"{parser.format_usage().strip()} -- [ arguments pa=
ssed to FVP ]"
--=20
2.25.1


