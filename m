Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2AB9C04FFE
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 13:37:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.18824.1713879430073668236
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Apr 2024 06:37:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B425339
	for <meta-arm@lists.yoctoproject.org>; Tue, 23 Apr 2024 06:37:37 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E5B6F3F64C
	for <meta-arm@lists.yoctoproject.org>; Tue, 23 Apr 2024 06:37:08 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: add Yocto Project SSTATE Mirror
Date: Tue, 23 Apr 2024 09:37:08 -0400
Message-Id: <20240423133708.23216-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 23 Apr 2024 13:37:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5584

Add the Yocto Project public SSTATE mirror to its own unique yml file.
This allows for developers to use this to speed up builds, while not
adding in the default case.  This "off by default" is because it can add
10s of minutes to each build, which might not be beneficial to those who
are using SSTATE dir locally.

Also, removing the removal ptest distro feature, as this change prevents
an optimal usage of the YP SSTATE mirror (~30% match to ~90% match for
qemuarm64).

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/base.yml          | 1 -
 ci/sstate-mirror.yml | 9 +++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)
 create mode 100644 ci/sstate-mirror.yml

diff --git a/ci/base.yml b/ci/base.yml
index 3d868a476d4e..6058b1c29caa 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -32,7 +32,6 @@ local_conf_header:
     PACKAGECONFIG:remove:pn-qemu-system-native =3D "gtk+ sdl"
     PACKAGECONFIG:append:pn-perf =3D " coresight"
     INHERIT +=3D "rm_work"
-    DISTRO_FEATURES:remove =3D "ptest"
   extrapackages: |
     CORE_IMAGE_EXTRA_INSTALL +=3D "perf opencsd"
     CORE_IMAGE_EXTRA_INSTALL:append:aarch64 =3D " gator-daemon"
diff --git a/ci/sstate-mirror.yml b/ci/sstate-mirror.yml
new file mode 100644
index 000000000000..c31b90759381
--- /dev/null
+++ b/ci/sstate-mirror.yml
@@ -0,0 +1,9 @@
+header:
+  version: 14
+
+local_conf_header:
+  sstate_mirror: |
+    BB_HASHSERVE_UPSTREAM =3D "hashserv.yocto.io:8687"
+    SSTATE_MIRRORS =3D "file://.* http://cdn.jsdelivr.net/yocto/sstate/a=
ll/PATH;downloadfilename=3DPATH"
+    BB_HASHSERVE =3D "auto"
+    BB_SIGNATURE_HANDLER =3D "OEEquivHash"
--=20
2.39.3 (Apple Git-146)


