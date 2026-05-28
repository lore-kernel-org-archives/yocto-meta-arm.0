Return-Path: <Michael.safwat@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D75B7CD5BD1
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 08:24:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6179.1779956643077905438
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 May 2026 01:24:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=ufcnEN7g;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: michael.safwat@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A03D22EE;
	Thu, 28 May 2026 01:23:57 -0700 (PDT)
Received: from e142473.cambridge.arm.com (e142473.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03D113F905;
	Thu, 28 May 2026 01:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779956642; bh=NZfwVPHHLoylJLtZsluFOi2vD8AmQ9Zkf0GVNpV/HIE=;
	h=From:To:Cc:Subject:Date:From;
	b=ufcnEN7g1CpJt358xRM25vmlu/PYtc0Jd52PbAxWai/PIafQqp1KcE8mVKkWTXuNj
	 wWtPWG+1vzZVr2BpZSBGfO7YGXHjM46CyUjkRZ2H/VcZ19h+LChQ+7lZK65uCij3ZD
	 q5yybIPmfAjNRHA6jWRjcKNyA7t15A8DWu5JAQJQ=
From: Michael Safwat <michael.safwat@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Michael Safwat <michael.safwat@arm.com>
Subject: [PATCH] runfvp: add --dry-run option
Date: Thu, 28 May 2026 09:23:57 +0100
Message-ID: <20260528082357.893275-1-michael.safwat@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 28 May 2026 08:24:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7066

Add a --dry-run option to scripts/runfvp to print the constructed
FVP command line and exit without launching the model.

This is useful for checking parameters and reusing them with different
FVP binaries.

Signed-off-by: Michael Safwat <michael.safwat@arm.com>
---
 scripts/runfvp | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/runfvp b/scripts/runfvp
index 10a8ad1c..5a1d3d73 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -27,6 +27,7 @@ def parse_args(arguments):
     group.add_argument("-t", "--terminals", choices=3Dterminals.all_term=
inals(), default=3Dterminals.preferred_terminal(), help=3Df"Automatically=
 start terminals (default: %(default)s). Available terminals are ({availa=
ble_terminals})")
     group.add_argument("-c", "--console", action=3D"store_true", help=3D=
"Attach the first uart to stdin/stdout")
     parser.add_argument("--verbose", action=3D"store_true", help=3D"Outp=
ut verbose logging")
+    parser.add_argument("--dry-run", action=3D"store_true", help=3D"Prin=
t the FVP command and exit")
     parser.usage =3D f"{parser.format_usage().strip()} -- [ arguments pa=
ssed to FVP ]"
     # TODO option for telnet vs netcat
=20
@@ -54,6 +55,12 @@ def start_fvp(args, fvpconf, extra_args):
     fvp =3D runner.FVPRunner(logger)
     try:
=20
+        if args.dry_run:
+            config =3D conffile.load(fvpconf)
+            cli =3D runner.cli_from_config(config, args.terminals) + ext=
ra_args
+            print(runner.shlex_join(cli))
+            return 0
+
         if args.terminals:
             if not terminal.terminals[args.terminals].is_ready():
                 return 1

