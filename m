Return-Path: <delane.brandy@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44EA5C30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 09:50:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6860.1720086609424853203
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Jul 2024 02:50:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: delane.brandy@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E454B367;
	Thu,  4 Jul 2024 02:50:33 -0700 (PDT)
Received: from e133015.arm.com (unknown [10.57.45.137])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 459143F762;
	Thu,  4 Jul 2024 02:50:08 -0700 (PDT)
From: delane.brandy@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Delane Brandy <delane.brandy@arm.com>
Subject: [PATCH] arm-bsp/corstone1000: Update Corstone-1000 user guide
Date: Thu,  4 Jul 2024 10:49:52 +0100
Message-Id: <20240704094952.982354-1-delane.brandy@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 04 Jul 2024 09:50:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5863

From: Delane Brandy <delane.brandy@arm.com>

Update the Corstone-1000 user guide with the new instructions on how to
rebuild the platform to enable multicore support and run a test to
verify this.

Signed-off-by: Delane Brandy <delane.brandy@arm.com>
---
 .../documentation/corstone1000/user-guide.rst | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index 5dc95642..2bdd490f 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -1458,6 +1458,33 @@ The external system can be switched on/off on dema=
nd with the following commands
=20
   echo start > /sys/class/remoteproc/remoteproc0/state
=20
+
+Testing FVP in SMP mode
+-----------------------
+
+Symmetric multiprocessing (SMP) mode is only supported on FVP. It can be=
 enabled by using `corstone1000-fvp-multicore.yml`
+
+1. Rebuild the platform with SMP mode enabled:
+
+::
+
+  kas build meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml:meta=
-arm/kas/corstone1000-fvp-multicore.yml
+
+2. Once rebuilt, boot the platform with SMP mode enabled:
+
+::
+
+  kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml:meta=
-arm/kas/corstone1000-fvp-multicore.yml -c "../meta-arm/scripts/runfvp"
+
+
+3. Validating SMP mode using the nproc command which should return the n=
umber of cores:
+
+::
+
+  nproc
+  #output: 4
+
+
 Tests results
 -------------
=20

