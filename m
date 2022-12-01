Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7428C4321E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 12:44:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.42015.1669898662154007538
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 01 Dec 2022 04:44:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1315ED6E;
	Thu,  1 Dec 2022 04:44:28 -0800 (PST)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 004F03F73D;
	Thu,  1 Dec 2022 04:44:20 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH] arm/fvp: Backport shlex.join from Python 3.8
Date: Thu,  1 Dec 2022 12:44:16 +0000
Message-Id: <20221201124416.578360-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 01 Dec 2022 12:44:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4172

From: Peter Hoyes <Peter.Hoyes@arm.com>

721bec25 "arm/fvp: Join cli arguments in verbose logging" changed the
verbose output of FVPRunner to print the generated arguments using
shlex.join instead of as a list. However, this function is only
available in Python >=3D 3.8, whereas OE-core currently supports Python
3.6.

To fix this, backport its one-line implementation to a local function
shlex_join and update the call site.

Issue-Id: SCM-5314
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I56cab9dddcd0a91272464be15742a6ee726dad41
---
 meta-arm/lib/fvp/runner.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-arm/lib/fvp/runner.py b/meta-arm/lib/fvp/runner.py
index f55c579d..4fd624ba 100644
--- a/meta-arm/lib/fvp/runner.py
+++ b/meta-arm/lib/fvp/runner.py
@@ -70,6 +70,13 @@ class ConsolePortParser:
                 pass
=20
=20
+# This function is backported from Python 3.8. Remove it and replace cal=
l sites
+# with shlex.join once OE-core support for earlier Python versions is dr=
opped.
+def shlex_join(split_command):
+    """Return a shell-escaped string from *split_command*."""
+    return ' '.join(shlex.quote(arg) for arg in split_command)
+
+
 class FVPRunner:
     def __init__(self, logger):
         self._logger =3D logger
@@ -88,7 +95,7 @@ class FVPRunner:
             if name in os.environ:
                 env[name] =3D os.environ[name]
=20
-        self._logger.debug(f"Constructed FVP call: {shlex.join(cli)}")
+        self._logger.debug(f"Constructed FVP call: {shlex_join(cli)}")
         self._fvp_process =3D subprocess.Popen(
             cli,
             stdin=3Dsubprocess.DEVNULL, stdout=3Dstdout, stderr=3Dsubpro=
cess.STDOUT,
--=20
2.25.1


