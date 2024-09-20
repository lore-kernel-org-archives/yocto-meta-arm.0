Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F13C1C7883C
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 12:57:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.17298.1726837039411152137
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 20 Sep 2024 05:57:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48C551474
	for <meta-arm@lists.yoctoproject.org>; Fri, 20 Sep 2024 05:57:48 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A1A8D3F66E
	for <meta-arm@lists.yoctoproject.org>; Fri, 20 Sep 2024 05:57:18 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm-bsp/fvp: Re-enable parselogs
Date: Fri, 20 Sep 2024 08:57:16 -0400
Message-Id: <20240920125716.13293-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240920125716.13293-1-jon.mason@arm.com>
References: <20240920125716.13293-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 20 Sep 2024 12:57:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6094

Re-enable parselogs testing for fvp-base and corstone1000-fvp, and add
an ignore file for the relevant entries.  Also, increase the testing
being done on corstone1000-fvp.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/fvp.yml                                                | 5 -----
 meta-arm-bsp/conf/machine/corstone1000-fvp.conf           | 3 ++-
 .../runtime/cases/parselogs-ignores-corstone1000-fvp.txt  | 8 ++++++++
 .../lib/oeqa/runtime/cases/parselogs-ignores-fvp-base.txt | 1 +
 4 files changed, 11 insertions(+), 6 deletions(-)
 create mode 100644 meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores=
-corstone1000-fvp.txt
 create mode 100644 meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores=
-fvp-base.txt

diff --git a/ci/fvp.yml b/ci/fvp.yml
index 2bf1cef024a8..667bb641092a 100644
--- a/ci/fvp.yml
+++ b/ci/fvp.yml
@@ -7,8 +7,3 @@ local_conf_header:
   testimagefvp: |
     LICENSE_FLAGS_ACCEPTED +=3D "Arm-FVP-EULA"
     IMAGE_CLASSES +=3D "fvpboot"
-  failing_tests: |
-    # This fails but we can't add to the ignorelist from meta-arm yet
-    # https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14604
-    TEST_SUITES:remove =3D "parselogs"
-    TEST_SUITES:remove =3D "xorg"
diff --git a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf b/meta-arm-b=
sp/conf/machine/corstone1000-fvp.conf
index 2c724bfeb2b8..a605a695b19a 100644
--- a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
+++ b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
@@ -9,7 +9,8 @@ TFM_PLATFORM_IS_FVP =3D "TRUE"
=20
 # testimage config
 TEST_TARGET =3D "OEFVPTarget"
-TEST_SUITES =3D "fvp_boot"
+TEST_TARGET_IP =3D "127.0.0.1:2222"
+DEFAULT_TEST_SUITES:append =3D " fvp_boot fvp_devices"
=20
 # FVP Config
 FVP_PROVIDER ?=3D "fvp-corstone1000-native"
diff --git a/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-corsto=
ne1000-fvp.txt b/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-co=
rstone1000-fvp.txt
new file mode 100644
index 000000000000..63cef943e792
--- /dev/null
+++ b/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-corstone1000-=
fvp.txt
@@ -0,0 +1,8 @@
+psci: failed to boot CPU1 (-95)
+CPU1: failed to boot: -95
+psci: failed to boot CPU2 (-95)
+CPU2: failed to boot: -95
+psci: failed to boot CPU3 (-95)
+CPU3: failed to boot: -95
+ARM FF-A: Notification setup failed -95, not enabled
+ARM FF-A: Failed to register driver sched callback -95
diff --git a/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-fvp-ba=
se.txt b/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-fvp-base.t=
xt
new file mode 100644
index 000000000000..eaffc181556b
--- /dev/null
+++ b/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-fvp-base.txt
@@ -0,0 +1 @@
+basic-mmio-gpio: Failed to locate of_node [id: -2]
--=20
2.39.3 (Apple Git-146)


