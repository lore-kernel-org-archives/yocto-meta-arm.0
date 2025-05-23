Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D665C3DA6D
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 04:22:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.41085.1747974176554571209
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 May 2025 21:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C20C2BC3
	for <meta-arm@lists.yoctoproject.org>; Thu, 22 May 2025 21:22:41 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BCC6A3F6A8
	for <meta-arm@lists.yoctoproject.org>; Thu, 22 May 2025 21:22:55 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm-bsp/corstone1000: white space clean-up
Date: Fri, 23 May 2025 00:22:54 -0400
Message-Id: <20250523042254.23125-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250523042254.23125-1-jon.mason@arm.com>
References: <20250523042254.23125-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 23 May 2025 04:22:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6520

Seeing the following warnings:
WARNING: /builds/jonmason00/meta-arm/work/build/../../meta-arm-bsp/conf/m=
achine/include/corstone1000.inc:72 has a lack of whitespace around the as=
signment: 'SMMGW_AUTH_VAR=3D"1"'
WARNING: /builds/jonmason00/meta-arm/work/build/../../meta-arm-bsp/conf/m=
achine/include/corstone1000.inc:74 has a lack of whitespace around the as=
signment: 'SMMGW_INTERNAL_CRYPTO=3D"1"'

Add the necessary white space to address the issue.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/include/corstone1000.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 80ff9bbe4b04..6d68cd0f36db 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -69,6 +69,6 @@ ARM_SYSTEMREADY_ACS_CONSOLE ?=3D "default"
 IMAGE_ROOTFS_EXTRA_ARGS +=3D "--extra-space ${@${IMAGE_ROOTFS_EXTRA_SPAC=
E}}K"
=20
 # Enable Authenticated variable support in SmmGW
-SMMGW_AUTH_VAR=3D"1"
+SMMGW_AUTH_VAR =3D "1"
 # Use MbedTLS build into SmmGW for authentication related crypto operati=
ons.
-SMMGW_INTERNAL_CRYPTO=3D"1"
+SMMGW_INTERNAL_CRYPTO =3D "1"
--=20
2.39.5 (Apple Git-154)


