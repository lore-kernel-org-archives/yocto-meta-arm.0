Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10857.1793804107283788042
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 Nov 2026 06:55:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=fzDg4lNV;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79D091516
	for <meta-arm@lists.yoctoproject.org>; Wed,  4 Nov 2026 06:55:03 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6399E3FA7A
	for <meta-arm@lists.yoctoproject.org>; Wed,  4 Nov 2026 06:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793804106; bh=uA7w8/Ta0MgjeETQXMJAbZ4dq7mj7ZqKS43/7YCm2TQ=;
	h=From:To:Subject:Date:From;
	b=fzDg4lNVIG0SLJzSTMw2JK1AOiGzlxf+JJywJnEu4cf7O0vBeyNZ/xSI+9bttpecq
	 a+Z1kvSgqChba0BRnw5oToJHQ+G1kuloPNYT1IdHSm4q5+Ix2CsO5L3NJmOOOdo086
	 QTjtdzpPpdUdWNnNfnB3d48Wub+lLhT3Jl/SoVVs=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: build TF-RMM in a dedicated qemuarm64 job
Date: Wed,  4 Nov 2026 09:55:05 -0500
Message-ID: <20261104145505.12441-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arm@lists.yoctoproject.org>; Wed, 04 Nov 2026 14:55:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7205
Content-Type: text/plain; charset="utf-8"

The poky-tiny fragment overrides the qemuarm64 target list, so RMM
is not built by the existing matrix jobs. Move RMM into a separate kas
fragment and add a matrix entry that selects it explicitly.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml   | 1 +
 ci/qemuarm64.yml | 4 ----
 ci/tf-rmm.yml    | 7 +++++++
 3 files changed, 8 insertions(+), 4 deletions(-)
 create mode 100644 ci/tf-rmm.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index b6ee135330a8..98414f9fc83e 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -284,6 +284,7 @@ qemuarm64:
       - DISTRO: poky-tiny
         FIRMWARE: [u-boot, edk2]
         TESTING: testimage
+      - TF: tf-rmm
=20
 qemuarm-secureboot:
   extends: .build
diff --git a/ci/qemuarm64.yml b/ci/qemuarm64.yml
index 8e394c7f5258..9c696365c05b 100644
--- a/ci/qemuarm64.yml
+++ b/ci/qemuarm64.yml
@@ -6,7 +6,3 @@ header:
     - ci/base.yml
=20
 machine: qemuarm64
-
-target:
-  - core-image-minimal
-  - trusted-firmware-rmm
diff --git a/ci/tf-rmm.yml b/ci/tf-rmm.yml
new file mode 100644
index 000000000000..76b95fc936cd
--- /dev/null
+++ b/ci/tf-rmm.yml
@@ -0,0 +1,7 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
+header:
+  version: 14
+
+target:
+ - trusted-firmware-rmm
--=20
2.54.0 (Apple Git-157)

