Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1042C54E5D
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 16:40:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1253.1710261626566247419
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Mar 2024 09:40:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1417A1007
	for <meta-arm@lists.yoctoproject.org>; Tue, 12 Mar 2024 09:41:03 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CA1A13F73F
	for <meta-arm@lists.yoctoproject.org>; Tue, 12 Mar 2024 09:40:25 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [nanbield PATCH] arm/linux-yocto: backport patch to fix 6.5.13 networking issues
Date: Tue, 12 Mar 2024 12:40:24 -0400
Message-Id: <20240312164024.64734-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 12 Mar 2024 16:40:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5423

Linux kernel commit 9aea191c29e18f7c044a2f95a2da7f7b7fdd0449 (backported
to 6.5.13 as part of the stable process) introduces an bug, which is
preventing networking from functioning (and logging lots of errors in
dmesg).  Linux kernel commit 45b3fae4675dc1d4ee2d7aefa19d85ee4f891377
resolves the issue.

It is need for everything, but only applying for aarch64 to keep the
CI tooling happy.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...randomize_layout-crash-in-struct-nei.patch | 46 +++++++++++++++++++
 .../linux/linux-yocto%.bbappend               |  3 ++
 2 files changed, 49 insertions(+)
 create mode 100644 meta-arm/recipes-kernel/linux/files/0001-neighbour-Fi=
x-__randomize_layout-crash-in-struct-nei.patch

diff --git a/meta-arm/recipes-kernel/linux/files/0001-neighbour-Fix-__ran=
domize_layout-crash-in-struct-nei.patch b/meta-arm/recipes-kernel/linux/f=
iles/0001-neighbour-Fix-__randomize_layout-crash-in-struct-nei.patch
new file mode 100644
index 000000000000..d622cbc6e4e1
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/files/0001-neighbour-Fix-__randomize_=
layout-crash-in-struct-nei.patch
@@ -0,0 +1,46 @@
+From 45b3fae4675dc1d4ee2d7aefa19d85ee4f891377 Mon Sep 17 00:00:00 2001
+From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
+Date: Sat, 25 Nov 2023 15:33:58 -0600
+Subject: [PATCH] neighbour: Fix __randomize_layout crash in struct neigh=
bour
+
+Previously, one-element and zero-length arrays were treated as true
+flexible arrays, even though they are actually "fake" flex arrays.
+The __randomize_layout would leave them untouched at the end of the
+struct, similarly to proper C99 flex-array members.
+
+However, this approach changed with commit 1ee60356c2dc ("gcc-plugins:
+randstruct: Only warn about true flexible arrays"). Now, only C99
+flexible-array members will remain untouched at the end of the struct,
+while one-element and zero-length arrays will be subject to randomizatio=
n.
+
+Fix a `__randomize_layout` crash in `struct neighbour` by transforming
+zero-length array `primary_key` into a proper C99 flexible-array member.
+
+Fixes: 1ee60356c2dc ("gcc-plugins: randstruct: Only warn about true flex=
ible arrays")
+Closes: https://lore.kernel.org/linux-hardening/20231124102458.GB1503258=
@e124191.cambridge.arm.com/
+Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
+Reviewed-by: Kees Cook <keescook@chromium.org>
+Tested-by: Joey Gouly <joey.gouly@arm.com>
+Link: https://lore.kernel.org/r/ZWJoRsJGnCPdJ3+2@work
+Signed-off-by: Paolo Abeni <pabeni@redhat.com>
+
+Upstream-Status: Backport
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+
+---
+ include/net/neighbour.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/net/neighbour.h b/include/net/neighbour.h
+index 07022bb0d44d..0d28172193fa 100644
+--- a/include/net/neighbour.h
++++ b/include/net/neighbour.h
+@@ -162,7 +162,7 @@ struct neighbour {
+ 	struct rcu_head		rcu;
+ 	struct net_device	*dev;
+ 	netdevice_tracker	dev_tracker;
+-	u8			primary_key[0];
++	u8			primary_key[];
+ } __randomize_layout;
+=20
+ struct neigh_ops {
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend b/meta-a=
rm/recipes-kernel/linux/linux-yocto%.bbappend
index c4e351bb39d4..76b6f4cf4023 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
@@ -1,5 +1,8 @@
 ARMFILESPATHS :=3D "${THISDIR}/files:"
=20
+FILESEXTRAPATHS:prepend:aarch64 =3D "${ARMFILESPATHS}"
+SRC_URI:append:aarch64 =3D " file://0001-neighbour-Fix-__randomize_layou=
t-crash-in-struct-nei.patch"
+
 COMPATIBLE_MACHINE:generic-arm64 =3D "generic-arm64"
 FILESEXTRAPATHS:prepend:generic-arm64 =3D "${ARMFILESPATHS}"
 SRC_URI:append:generic-arm64 =3D " \
--=20
2.39.3 (Apple Git-146)


