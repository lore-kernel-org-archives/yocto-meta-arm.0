Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BAA2C433FE
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 17:22:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.415.1634750526681014742
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 20 Oct 2021 10:22:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B279ED1
	for <meta-arm@lists.yoctoproject.org>; Wed, 20 Oct 2021 10:22:04 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 158693F694
	for <meta-arm@lists.yoctoproject.org>; Wed, 20 Oct 2021 10:22:03 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] runfvp: Ensure new process group is in the foreground
Date: Wed, 20 Oct 2021 18:22:01 +0100
Message-Id: <20211020172201.443130-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 20 Oct 2021 17:22:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2289

From: Peter Hoyes <Peter.Hoyes@arm.com>

When a new process group is created, it is launched in the background
and any attempt to access the session terminal triggers a SIGTTIN (for
stdin) or SIGTTOU (for stdout) signal. These are ignored in an
interactive shell, but the default signal behavior in a new job is to
send a SIGTSTP to the whole process group. This causes runfvp to hang
when executed via a subprocess when stdin is accessed.

After creating a new process group, use tcsetpgrp to make the new group
the foreground process for the terminal associated with stdin/stdout.

The documentation for tcsetgrp states that tcsetpgrp itself raises a
SIGTTOU signal, so set this signal to SIG_IGN.

Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I349a825df7fcb8a3cedb81762b901c6f50fa53b5
---
 scripts/runfvp | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/runfvp b/scripts/runfvp
index 97836726..9188a3a6 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -4,6 +4,7 @@ import asyncio
 import json
 import os
 import re
+import signal
 import sys
 import subprocess
 import pathlib
@@ -220,6 +221,9 @@ if __name__ =3D=3D "__main__":
         # Set the process group so that it's possible to kill runfvp and
         # everything it spawns easily.
         os.setpgid(0, 0)
+        signal.signal(signal.SIGTTOU, signal.SIG_IGN)
+        os.tcsetpgrp(sys.stdin.fileno(), os.getpgrp())
         runfvp(sys.argv[1:])
+
     except KeyboardInterrupt:
         pass
--=20
2.25.1


