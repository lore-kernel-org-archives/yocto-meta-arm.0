Return-Path: <amr.mohamed@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B76CC3DA49
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 10:01:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.57654.1721988088011506843
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 26 Jul 2024 03:01:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: amr.mohamed@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B3ED1042;
	Fri, 26 Jul 2024 03:01:53 -0700 (PDT)
Received: from e125330.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 024FE3F73F;
	Fri, 26 Jul 2024 03:01:26 -0700 (PDT)
From: amr.mohamed@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Amr Mohamed <amr.mohamed@arm.com>
Subject: [PATCH scarthgap 4/4] kas: Add new yml file for Distros unattended installation
Date: Fri, 26 Jul 2024 11:01:09 +0100
Message-Id: <20240726100109.1878470-4-amr.mohamed@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240726100109.1878470-1-amr.mohamed@arm.com>
References: <20240726100109.1878470-1-amr.mohamed@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 26 Jul 2024 10:01:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5923

From: Amr Mohamed <amr.mohamed@arm.com>

Define =E2=80=9CDISTRO_UNATTENDED_INST_TESTS=E2=80=9D variable in meta-ar=
m-systemready
independently from meta-arm-auto-solutions. This will allow running
the unattended installation without meta-arm-auto-solutions.

Signed-off-by: Amr Mohamed <amr.mohamed@arm.com>
---
 kas/arm-systemready-linux-distros-fedora.yml          |  1 +
 ...temready-linux-distros-unattended-installation.yml | 11 +++++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 kas/arm-systemready-linux-distros-unattended-installa=
tion.yml

diff --git a/kas/arm-systemready-linux-distros-fedora.yml b/kas/arm-syste=
mready-linux-distros-fedora.yml
index b2b23d78..2faa19cb 100644
--- a/kas/arm-systemready-linux-distros-fedora.yml
+++ b/kas/arm-systemready-linux-distros-fedora.yml
@@ -2,6 +2,7 @@ header:
   version: 16
   includes:
     - kas/arm-systemready-firmware.yml
+    - kas/arm-systemready-linux-distros-unattended-installation.yml
=20
 target:
   - arm-systemready-linux-distros-fedora
diff --git a/kas/arm-systemready-linux-distros-unattended-installation.ym=
l b/kas/arm-systemready-linux-distros-unattended-installation.yml
new file mode 100644
index 00000000..7976186f
--- /dev/null
+++ b/kas/arm-systemready-linux-distros-unattended-installation.yml
@@ -0,0 +1,11 @@
+header:
+  version: 16
+
+env:
+  DISTRO_UNATTENDED_INST_TESTS:
+  # The full testimage run typically takes around 12-24h on fvp-base.
+  TEST_OVERALL_TIMEOUT: "${@ 24*60*60}"
+ =20
+local_conf_header:
+  systemready-unattended-inst: |
+    TESTIMAGE_AUTO =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TEST=
S", "1", "", d)}"
--=20
2.25.1


