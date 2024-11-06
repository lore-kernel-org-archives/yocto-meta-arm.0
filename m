Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52BEAD44D55
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 11:49:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.44094.1730893751413937764
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 Nov 2024 03:49:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA6B11063;
	Wed,  6 Nov 2024 03:49:40 -0800 (PST)
Received: from e129527.cambridge.arm.com (e129527.cambridge.arm.com [10.1.32.168])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2DD6E3F6A8;
	Wed,  6 Nov 2024 03:49:10 -0800 (PST)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH scarthgap] arm-bsp/documentation: corstone1000: Add SystemReady IR v2.0 certification
Date: Wed,  6 Nov 2024 11:49:05 +0000
Message-Id: <20241106114905.1916463-1-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 06 Nov 2024 11:49:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6244

- Add details on SystemReady IR v2.0 certification achievement
- Document additional patch added
- Update release notes with new milestone tag `CORSTONE1000-2024.06-syste=
mready-ir-v2.0`

Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
---
 .../documentation/corstone1000/release-notes.rst       | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-arm-bsp/documentation/corstone1000/release-notes.rst b/=
meta-arm-bsp/documentation/corstone1000/release-notes.rst
index 0cad0266..5f88d69c 100644
--- a/meta-arm-bsp/documentation/corstone1000/release-notes.rst
+++ b/meta-arm-bsp/documentation/corstone1000/release-notes.rst
@@ -38,6 +38,16 @@ Platform Support
  - This software release is tested on Corstone-1000 Fast Model platform =
(FVP) version 11.23_25
    https://developer.arm.com/tools-and-software/open-source-software/arm=
-platforms-software/arm-ecosystem-fvps
=20
+SystemReady IR v2.0 Certification Milestone
+-------------------------------------------
+
+As of this release, Corstone-1000 has achieved `SystemReady IR v2.0 cert=
ification <https://www.arm.com/architecture/system-architectures/systemre=
ady-certification-program/ve>`__.
+This milestone confirms compliance with the SystemReady IR requirements,=
 ensuring broader compatibility and reliability for deployment.
+
+Applied patch `313ad2a0e600 <https://git.yoctoproject.org/meta-arm/commi=
t/?h=3Dscarthgap&id=3D313ad2a0e600655d9bfbe53646e356372ff02644>`__ to add=
ress compatibility requirements for SystemReady IR v2.0.
+
+This update is included in tag `CORSTONE1000-2024.06-systemready-ir-v2.0=
 <https://git.yoctoproject.org/meta-arm/tag/?h=3DCORSTONE1000-2024.06-sys=
temready-ir-v2.0>`__ and builds on the `CORSTONE1000-2024.06` release.
+
 ***********************
 Release notes - 2023.11
 ***********************

