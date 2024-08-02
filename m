Return-Path: <luca.fancellu@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5481C3DA7F
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 07:06:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.87415.1722582356330839053
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 02 Aug 2024 00:05:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: luca.fancellu@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 640A91007;
	Fri,  2 Aug 2024 00:06:21 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F56D3F5A1;
	Fri,  2 Aug 2024 00:05:55 -0700 (PDT)
From: Luca Fancellu <luca.fancellu@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: peter.hoyes@arm.com,
	Jon.Mason@arm.com
Subject: [PATCH scarthgap] arm/oeqa: Introduce retry mechanism for fvp_devices run_cmd
Date: Fri,  2 Aug 2024 08:05:43 +0100
Message-Id: <20240802070543.3439695-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 02 Aug 2024 07:06:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5944

Currently the run_cmd, which is a wrapper for self.target.run()
that uses SSH to spawn commands on the target, can fail spuriously
with error 255 and cause the test to fail on slow systems.

In order to address that, introduce a retry mechanism for the call,
that is able to wait some time for the system to settle and retry
the command when the error code from SSH is 255.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 meta-arm/lib/oeqa/runtime/cases/fvp_devices.py | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta-arm/lib/oeqa/runtime/cases/fvp_devices.py b/meta-arm/li=
b/oeqa/runtime/cases/fvp_devices.py
index 0246e76a94b3..c9d08c03448a 100644
--- a/meta-arm/lib/oeqa/runtime/cases/fvp_devices.py
+++ b/meta-arm/lib/oeqa/runtime/cases/fvp_devices.py
@@ -1,16 +1,29 @@
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.data import skipIfNotInDataVar
 from oeqa.core.decorator.depends import OETestDepends
+from time import sleep
=20
=20
 class FvpDevicesTest(OERuntimeTestCase):
-    def run_cmd(self, cmd, check=3DTrue):
+    def run_cmd(self, cmd, check=3DTrue, retry=3D3):
         """
         A wrapper around self.target.run, which:
           * Fails the test on command failure by default
           * Allows the "run" behavior to be overridden in sub-classes
+          * Has a retry mechanism when SSH returns 255
         """
-        (status, output) =3D self.target.run(cmd)
+        status =3D 255
+        # The loop is retrying the self.target.run() which uses SSH only=
 when
+        # the SSH return code is 255, which might be an issue with
+        # "Connection refused" because the port isn't open yet
+        while status =3D=3D 255 and retry > 0:
+            (status, output) =3D self.target.run(cmd)
+            retry -=3D 1
+            # In case the status is 255, delay the next retry to give ti=
me to
+            # the system to settle
+            if status =3D=3D 255:
+                sleep(30)
+
         if status and check:
             self.fail("Command '%s' returned non-zero exit "
                       "status %d:\n%s" % (cmd, status, output))
--=20
2.34.1


