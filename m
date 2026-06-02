Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90EAECD6E60
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 12:58:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24538.1780405092764136992
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 02 Jun 2026 05:58:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=vLQ42xK4;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17C41169C
	for <meta-arm@lists.yoctoproject.org>; Tue,  2 Jun 2026 05:58:07 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DEB473F632
	for <meta-arm@lists.yoctoproject.org>; Tue,  2 Jun 2026 05:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780405092; bh=VdeZniOnK/tgy9T7x1lK8kwKZlD8YTZ9y5UFaxovUo0=;
	h=From:To:Subject:Date:From;
	b=vLQ42xK45DxNRoFNLaSkhxR/M+t0Bb9wM1l0BJw2iBrCsSBwHABMC8eXHXkWuzIfi
	 s9aUt8XndGsLmz52gkEdzmY2SCKgKFVYqxhquS1bJwe8zJI67LFqnQoQR36sNLapGH
	 xSJKAeSYCakJMkcJ9/042sKrizfmq+WcOBV3uCBA=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/tf-a-tests: Workaround GCC errors for 'unused-but-set-variable'
Date: Tue,  2 Jun 2026 08:58:10 -0400
Message-ID: <20260602125811.54843-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 02 Jun 2026 12:58:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7067

New GCC is logging errors for unused-but-set-variable in
tftf/tests/runtime_services/standard_service/psci/api_tests/psci_stat/tes=
t_psci_stat.c

Workaround this by adding -Wno-unused-but-set-variable to the Makefile
Refer to https://github.com/TrustedFirmware-A/tf-a-tests/issues/4
For the upstream resolution, if/when that arrives.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...1-Fix-GCC-errors-in-test_psci_stat.c.patch | 41 +++++++++++++++++++
 .../trusted-firmware-a/tf-a-tests_2.14.0.bb   |  2 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/0001-Fi=
x-GCC-errors-in-test_psci_stat.c.patch

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-Fix-GCC-e=
rrors-in-test_psci_stat.c.patch b/meta-arm/recipes-bsp/trusted-firmware-a=
/files/0001-Fix-GCC-errors-in-test_psci_stat.c.patch
new file mode 100644
index 000000000000..a03fb8405832
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-Fix-GCC-errors-i=
n-test_psci_stat.c.patch
@@ -0,0 +1,41 @@
+From 042dcbc95249a2311e8a784fa7193299aa2ad651 Mon Sep 17 00:00:00 2001
+From: Jon Mason <jon.mason@arm.com>
+Date: Sat, 30 May 2026 10:24:53 -0400
+Subject: [PATCH] Fix GCC errors in test_psci_stat.c
+
+With the latest GCC, we're seeing the errors:
+
+| tftf/tests/runtime_services/standard_service/psci/api_tests/psci_stat/=
test_psci_stat.c: In function 'test_psci_stats_cpu_off':
+| tftf/tests/runtime_services/standard_service/psci/api_tests/psci_stat/=
test_psci_stat.c:681:23: error: variable 'off_cpu_count' set but not used=
 [-Werror=3Dunused-but-set-variable=3D]
+|   681 |         int cpu_node, off_cpu_count =3D 0, ret;
+|       |                       ^~~~~~~~~~~~~
+| tftf/tests/runtime_services/standard_service/psci/api_tests/psci_stat/=
test_psci_stat.c: In function 'test_psci_stats_system_suspend':
+| tftf/tests/runtime_services/standard_service/psci/api_tests/psci_stat/=
test_psci_stat.c:800:23: error: variable 'off_cpu_count' set but not used=
 [-Werror=3Dunused-but-set-variable=3D]
+|   800 |         int cpu_node, off_cpu_count =3D 0;
+|       |                       ^~~~~~~~~~~~~
+
+This is because assert is being #ifdef'ed out and thus the variable is
+never being used.  Add '-Wno-unused-but-set-variable' to the Makefile to
+workaround the issue.
+
+See https://github.com/TrustedFirmware-A/tf-a-tests/issues/4
+
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+Upstream-Status: Pending
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 9d222acc30b4..806329382da5 100644
+--- a/Makefile
++++ b/Makefile
+@@ -277,7 +277,7 @@ GCC_ASFLAGS_aarch64	:=3D	-mgeneral-regs-only ${march=
64-directive}
+=20
+ GCC_WARNINGS		+=3D	-nostdinc -ffreestanding -Wall -Werror 	\
+ 				-Wmissing-include-dirs  $(GCC_CFLAGS_$(ARCH)) \
+-				-std=3Dgnu99 -Os
++				-Wno-unused-but-set-variable -std=3Dgnu99 -Os
+=20
+ # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D105523
+ GCC_CFLAGS		+=3D	$(call cc_option, --param=3Dmin-pagesize=3D0)
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.14.0.bb=
 b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.14.0.bb
index dcd97d1a196d..a65106f24ede 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.14.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.14.0.bb
@@ -12,6 +12,8 @@ SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A_TESTS};branch=
=3D${SRCBRANCH}"
 SRCBRANCH =3D "master"
 SRCREV =3D "3b3d800133081b48482b1205a32671b82bc2b640"
=20
+SRC_URI +=3D "file://0001-Fix-GCC-errors-in-test_psci_stat.c.patch"
+
 EXTRA_OEMAKE +=3D "USE_NVM=3D0"
 EXTRA_OEMAKE +=3D "SHELL_COLOR=3D1"
 EXTRA_OEMAKE +=3D "DEBUG=3D1"
--=20
2.50.1 (Apple Git-155)


