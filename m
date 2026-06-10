Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C76FFCD8CB2
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 15:46:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23598.1781106387972951677
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 08:46:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=jtCKgLgt;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88B792008
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Jun 2026 08:46:22 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2E40F3F99C
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Jun 2026 08:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781106387; bh=iPHO46kpU3NB9Yr+ezY/qCSIudhnKgPMUN3pevnCObA=;
	h=From:To:Subject:Date:From;
	b=jtCKgLgtZzJWoPK7/jrk1Mhnjfs87zT1fZAynj0H6Xv2HxUI2gv5gycv14CronnLP
	 NzCnug+zKvAGMP1YGbjHHRk8ZTJmf+RTg+3v9x0uLr/uHB8ck4YkEh0XNsfwGGpNIm
	 rthF+ICzkZe8LQehqIDGIxfXhVL31uf4W1+ogPMs=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/4] arm/optee: modify CVE_PRODUCT
Date: Wed, 10 Jun 2026 11:46:17 -0400
Message-ID: <20260610154620.8533-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 10 Jun 2026 15:46:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7072

Per https://nvd.nist.gov/products/cpe/detail/EB42962B-24FD-4716-B3E2-69F3=
258A57CF
adding "trustedfirmware:op-tee"

We can probably remove "linaro:op-tee", since it has been depreciated.
Fearing unintended issues, leaving it in for now.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-security/optee/optee-os.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/reci=
pes-security/optee/optee-os.inc
index 076e482bf10b..95c41fb13a58 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc1f21c4f72f372=
ef38a5a4aee55ec173"
 inherit deploy python3native
 require optee.inc
=20
-CVE_PRODUCT =3D "linaro:op-tee op-tee:op-tee_os"
+CVE_PRODUCT =3D "linaro:op-tee \
+               op-tee:op-tee_os \
+               trustedfirmware:op-tee"
=20
 DEPENDS =3D "python3-pyelftools-native python3-cryptography-native"
=20
--=20
2.50.1 (Apple Git-155)


