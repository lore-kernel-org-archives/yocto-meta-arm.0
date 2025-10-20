Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9690CCD199
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 15:09:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.21443.1760972967103676691
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Oct 2025 08:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 930621063
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Oct 2025 08:09:18 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 15FFF3F66E
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Oct 2025 08:09:25 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/5] CI: remove meta-clang
Date: Mon, 20 Oct 2025 16:09:20 +0100
Message-ID: <20251020150924.84223-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 20 Oct 2025 15:09:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6739

Now that clang is in core, we don't need to use meta-clang anymore.
Also, use PREFERRED_TOOLCHAIN_TARGET to specify the toolchain to use.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/clang.yml    | 6 +-----
 ci/gcc.yml      | 4 ++--
 ci/update-repos | 1 -
 3 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/ci/clang.yml b/ci/clang.yml
index 402292a6b86d..dfe0c36616d0 100644
--- a/ci/clang.yml
+++ b/ci/clang.yml
@@ -3,10 +3,6 @@
 header:
   version: 14
=20
-repos:
-  meta-clang:
-    url: https://github.com/kraj/meta-clang
-
 local_conf_header:
   toolchain: |
-    TOOLCHAIN =3D "clang"
+    PREFERRED_TOOLCHAIN_TARGET =3D "clang"
diff --git a/ci/gcc.yml b/ci/gcc.yml
index 1f368c24dcb1..61e1d0e17791 100644
--- a/ci/gcc.yml
+++ b/ci/gcc.yml
@@ -3,7 +3,7 @@
 header:
   version: 14
=20
-#NOTE: This is the default for poky.  This is only being added for compl=
eteness/clarity
+#NOTE: This is the default.  This is only being added for completeness/c=
larity
 local_conf_header:
   toolchain: |
-    TOOLCHAIN =3D "gcc"
+    PREFERRED_TOOLCHAIN_TARGET =3D "gcc"
diff --git a/ci/update-repos b/ci/update-repos
index c44246cc019c..e70ed0d963c6 100755
--- a/ci/update-repos
+++ b/ci/update-repos
@@ -23,7 +23,6 @@ repositories =3D (
     "https://git.yoctoproject.org/poky",
     "https://git.openembedded.org/meta-openembedded",
     "https://git.yoctoproject.org/meta-virtualization",
-    "https://github.com/kraj/meta-clang",
 )
=20
 if __name__ =3D=3D "__main__":
--=20
2.50.1 (Apple Git-155)


