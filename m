Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C29CC04FFE
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 10:50:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12283.1715683794576322591
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 May 2024 03:49:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C1A61007
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 May 2024 03:50:19 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AC2163F762
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 May 2024 03:49:53 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/ssh-pregen-hostkeys: enable on virtual machines
Date: Tue, 14 May 2024 10:49:51 +0000
Message-Id: <20240514104951.2496686-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 May 2024 10:50:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5713

As of oe-core b040597, the ssh-pregen-hostkeys recipe is limited to the
qemu* machines only, so that it can only be used in development or
emulation and not in production.

We have some virtual machines in meta-arm-bsp which don't match the
COMPATIBLE_MACHINE in the recipe but still benefit from this recipe, so
add a bbappend to enable it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../ssh-pregen-hostkeys/ssh-pregen-hostkeys_%.bbappend      | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-connectivity/ssh-pregen-hostkeys=
/ssh-pregen-hostkeys_%.bbappend

diff --git a/meta-arm-bsp/recipes-connectivity/ssh-pregen-hostkeys/ssh-pr=
egen-hostkeys_%.bbappend b/meta-arm-bsp/recipes-connectivity/ssh-pregen-h=
ostkeys/ssh-pregen-hostkeys_%.bbappend
new file mode 100644
index 00000000..77c5bd3a
--- /dev/null
+++ b/meta-arm-bsp/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-ho=
stkeys_%.bbappend
@@ -0,0 +1,6 @@
+# These machines cannot run in product as they are virtual
+# platforms, so allow ssh-pregen-hostkeys to be used.
+
+COMPATIBLE_MACHINE:corestone1000-fvp =3D "corestone1000-fvp"
+COMPATIBLE_MACHINE:fvp-base =3D "fvp-base"
+COMPATIBLE_MACHINE:sbsa-ref =3D "sbsa-ref"
--=20
2.34.1


