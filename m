Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8361.1792505194616769747
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Oct 2026 07:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=n+QG8oLD;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B59712103
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Oct 2026 07:06:30 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CBA253FA32
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Oct 2026 07:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792505193; bh=kKTADoa/CgICTFlAWr7RnKEtFFKZ5ybGDUmGEIuggwU=;
	h=From:To:Subject:Date:From;
	b=n+QG8oLD261HSfSk4bmCLqYGs0AkJYksXqTpfJ8o0FD/5Bl+K8CEpNTWmUUA0ZCef
	 o7yi71Icqe8a84eJ6KYCutHR6osu5tmIqZV6SeLuyfijlxOpas/J3Xp0wXaYiAZe8M
	 4JO9ZmAdOF/TsCDwoDlzPSSQu9C9MeKDFc9jL/ts=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] CI: build trusted-firmware-rmm for qemuarm64
Date: Tue, 20 Oct 2026 10:06:32 -0400
Message-ID: <20261020140633.95775-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arm@lists.yoctoproject.org>; Tue, 20 Oct 2026 14:06:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7192
Content-Type: text/plain; charset="utf-8"

The trusted-firmware-rmm recipe is not currently covered by CI builds.
Since the recipe already supports qemuarm64, add it to the qemuarm64
CI targets to ensure that it is regularly built and checked for
regressions.

Switch the CI image to core-image-minimal to reduce the number of
packages built and improve build times.

Also, disable the buildpaths QA check for trusted-firmware-rmm and
its debug package to work around TMPDIR references in the build
output.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/qemuarm64.yml                                             | 4 ++++
 .../trusted-firmware-rmm/trusted-firmware-rmm_0.6.0.bb       | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/ci/qemuarm64.yml b/ci/qemuarm64.yml
index 9c696365c05b..8e394c7f5258 100644
--- a/ci/qemuarm64.yml
+++ b/ci/qemuarm64.yml
@@ -6,3 +6,7 @@ header:
     - ci/base.yml
=20
 machine: qemuarm64
+
+target:
+  - core-image-minimal
+  - trusted-firmware-rmm
diff --git a/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-r=
mm_0.6.0.bb b/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-=
rmm_0.6.0.bb
index 43585982e917..55d746196b6f 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.6.=
0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.6.=
0.bb
@@ -44,3 +44,8 @@ do_deploy() {
 }
=20
 addtask deploy after do_install
+
+# FIXME - The RMM build embeds TMPDIR paths in the generated binaries.
+# Skip the buildpaths QA check until these references can be removed.
+INSANE_SKIP:${PN} +=3D "buildpaths"
+INSANE_SKIP:${PN}-dbg +=3D "buildpaths"
--=20
2.54.0 (Apple Git-157)

