Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60DABC369D0
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 13:10:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11232.1744981804446834972
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Apr 2025 06:10:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F7D1150C
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Apr 2025 06:10:01 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CC1593F66E
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Apr 2025 06:10:03 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm/tclibc: add spaces after TCLIBC
Date: Fri, 18 Apr 2025 09:10:01 -0400
Message-Id: <20250418131002.95131-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250418131002.95131-1-jon.mason@arm.com>
References: <20250418131002.95131-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 18 Apr 2025 13:10:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6468

Seeing the warning:
  lack of whitespace around the assignment: 'TCLIBC=3D"musl"'

Add spaces to address the issue

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 kas/corstone1000-firmware-only.yml      | 2 +-
 meta-arm/conf/multiconfig/firmware.conf | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/kas/corstone1000-firmware-only.yml b/kas/corstone1000-firmwa=
re-only.yml
index 6192a4087234..bc47940b316b 100644
--- a/kas/corstone1000-firmware-only.yml
+++ b/kas/corstone1000-firmware-only.yml
@@ -10,7 +10,7 @@ local_conf_header:
     OVERRIDES .=3D ":firmware"
=20
     # Need to ensure we build with a small libc
-    TCLIBC=3D"musl"
+    TCLIBC =3D "musl"
=20
   mass-storage: |
     # Ensure the Mass Storage device is absent
diff --git a/meta-arm/conf/multiconfig/firmware.conf b/meta-arm/conf/mult=
iconfig/firmware.conf
index 95de4d246792..018c0deb81e5 100644
--- a/meta-arm/conf/multiconfig/firmware.conf
+++ b/meta-arm/conf/multiconfig/firmware.conf
@@ -4,7 +4,7 @@
 DISTROOVERRIDES =3D "firmware"
=20
 TMPDIR:append =3D "_${MACHINE}"
-TCLIBC=3D"musl"
+TCLIBC =3D "musl"
=20
 # Ignore the testimage flags to include ssh-server-dropbear
 IMAGE_CLASSES:remove =3D "testimage"
--=20
2.39.5 (Apple Git-154)


