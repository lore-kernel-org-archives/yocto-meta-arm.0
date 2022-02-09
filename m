Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D09EC433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 17:46:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.30017.1644428781791324310
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Feb 2022 09:46:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4564B113E
	for <meta-arm@lists.yoctoproject.org>; Wed,  9 Feb 2022 09:46:21 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D49883F70D
	for <meta-arm@lists.yoctoproject.org>; Wed,  9 Feb 2022 09:46:20 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm/ffa-debugfs-mod: remove kernel image runtime
 dependency
Date: Wed,  9 Feb 2022 17:46:09 +0000
Message-Id: <20220209174610.3824795-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220209174610.3824795-1-ross.burton@arm.com>
References: <20220209174610.3824795-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 09 Feb 2022 17:46:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2967

CS1K wants to put the ffa-debugfs kernel module into the initramfs, but
this pulls in the kernel image too because kernel modules depend on the
kernel image (via kernel-module-split.bbclass).  Arguably this should be
controllable somehow, as it's not mandatory to have an image on the same
file system as the modules: initramfs or separate /boot partitions being
notable cases.

Until this is resolved upstream[1] we can work around it by removing the
RDEPENDS on the kernel from the kernel module.  As the package is
generated during do_package this can't be a simple RDEPENDS:remove, but
has to be another package split function which runs after the module
splitting function.

[1] https://lore.kernel.org/openembedded-core/20220209173036.3823144-1-ro=
ss.burton@arm.com/T/#t

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../ffa-debugfs/ffa-debugfs-mod_2.1.0.bb               | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb=
 b/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
index 4fedad1c..03ce0135 100644
--- a/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
+++ b/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
@@ -27,3 +27,13 @@ do_install:append() {
 }
=20
 COMPATIBLE_HOST =3D "(arm|aarch64).*-linux"
+
+# Kernel modules currently RDEPEND on the kernel, which is troublesome w=
hen you want to put a
+# kernel module into a initramfs without pulling the kernel into the ini=
tramfs, which would be
+# silly.  Until this is a recommends the easiest way to handle this is t=
o remove the dependency
+# in this recipe.
+PACKAGESPLITFUNCS:append =3D " remove_kernel_dependency"
+python remove_kernel_dependency() {
+  key =3D "RDEPENDS:kernel-module-arm-ffa-user-" + d.getVar("KERNEL_VERS=
ION")
+  d.delVar(key)
+}
--=20
2.25.1


