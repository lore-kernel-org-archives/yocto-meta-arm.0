Return-Path: <diego.sueiro@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32874C43334
	for <webhook@archiver.kernel.org>; Thu, 16 Jun 2022 11:29:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.16793.1655378986191323021
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Jun 2022 04:29:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: diego.sueiro@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B69D2113E;
	Thu, 16 Jun 2022 04:29:45 -0700 (PDT)
Received: from e120809.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1375C3F73B;
	Thu, 16 Jun 2022 04:29:44 -0700 (PDT)
From: Diego Sueiro <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Kamil Dziezyk <kamil.dziezyk@arm.com>
Subject: [PATCH] arm/generic-arm64: Include generic-arm64-standard.scc into
 kernel config
Date: Thu, 16 Jun 2022 12:29:38 +0100
Message-Id: 
 <f3f1229b971b69cb0e1c72eaee5f7a8fdf893589.1655378917.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 Jun 2022 11:29:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3510

From: Kamil Dziezyk <kamil.dziezyk@arm.com>

To allow bitbake including the 'generic-arm64-standard.scc' into the kern=
el
configuration, it has to be included as a kmeta type source to the SRC_UR=
I.

Issue-Id: SCM-4394
Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
Change-Id: Iaebd0c7758038843a1d0f37decbef057629bf0bb
---
 .../{ =3D> generic-arm64-kmeta}/generic-arm64-standard.scc      | 0
 meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend          | 4 ++++
 2 files changed, 4 insertions(+)
 rename meta-arm/recipes-kernel/linux/linux-yocto/{ =3D> generic-arm64-km=
eta}/generic-arm64-standard.scc (100%)

diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/generic-arm64-stan=
dard.scc b/meta-arm/recipes-kernel/linux/linux-yocto/generic-arm64-kmeta/=
generic-arm64-standard.scc
similarity index 100%
rename from meta-arm/recipes-kernel/linux/linux-yocto/generic-arm64-stand=
ard.scc
rename to meta-arm/recipes-kernel/linux/linux-yocto/generic-arm64-kmeta/g=
eneric-arm64-standard.scc
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend b/meta-=
arm/recipes-kernel/linux/linux-yocto_%.bbappend
index 14cc6df..cf093f0 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
@@ -1,6 +1,10 @@
 ARMFILESPATHS :=3D "${THISDIR}/${PN}:"
=20
 COMPATIBLE_MACHINE:generic-arm64 =3D "generic-arm64"
+FILESEXTRAPATHS:prepend:generic-arm64 =3D "${ARMFILESPATHS}"
+SRC_URI:append:generic-arm64 =3D" \
+    file://generic-arm64-kmeta;type=3Dkmeta;destsuffix=3Dgeneric-arm64-k=
meta \
+    "
=20
 FILESEXTRAPATHS:prepend:qemuarm64-secureboot =3D "${ARMFILESPATHS}"
 SRC_URI:append:qemuarm64-secureboot =3D " \
--=20
2.35.1


