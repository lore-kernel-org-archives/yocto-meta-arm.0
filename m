Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5FCACD4857
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 14:55:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.52370.1725461740438796595
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 Sep 2024 07:55:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C648106F;
	Wed,  4 Sep 2024 07:56:06 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BA5543F73F;
	Wed,  4 Sep 2024 07:55:39 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 3/3] arm-bsp/documentation: corstone1000: remove TEE driver load
Date: Wed,  4 Sep 2024 09:55:38 -0500
Message-Id: <20240904145538.2538-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240904145538.2538-1-jon.mason@arm.com>
References: <20240904145538.2538-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 04 Sep 2024 14:55:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6059

From: Bence Balogh <bence.balogh@arm.com>

The arm-tstee driver was upstreamed to the v6.10 kernel so it doesn't
have to be loaded manually. Updated the related parts in the
Corstone-1000 user guide.

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../documentation/corstone1000/user-guide.rst | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index 359caf2d572c..038f8ad34eba 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -1232,25 +1232,24 @@ When running the tests on the Corstone-1000 FVP, =
the user should follow the
 instructions in `Running the software on FVP`_ section to boot Linux in =
FVP
 host_terminal_0, and login using the username ``root``.
=20
-First, load FF-A TEE kernel module:
+The tests use the `arm_tstee` driver to access Trusted Services Secure P=
artitions from user space.
+This driver is included in the Linux Kernel, starting from v6.10.
=20
-::
-
-  insmod /lib/modules/*-yocto-standard/updates/arm-tstee.ko
-
-Then, check whether the FF-A TEE driver is loaded correctly by using the=
 following command:
+Run the following command in the Host terminal (ttyUSB2) to verify that =
the driver is present:
=20
 ::
=20
-  cat /proc/modules | grep arm_tstee
+  ls /sys/bus/arm_ffa/drivers | grep arm_tstee
=20
-The output should be similar to:
+
+The output should be:
=20
 ::
=20
-   arm_tstee 16384 - - Live 0xffffffc000510000 (O)
+  arm_tstee
+
=20
-Now, run the PSA API tests in the following order:
+Run the PSA API tests in the following order:
=20
 ::
=20
--=20
2.39.3 (Apple Git-146)


