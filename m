Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C51FCC27C7B
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 15:05:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12066.1718118323986199506
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Jun 2024 08:05:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20F101595
	for <meta-arm@lists.yoctoproject.org>; Tue, 11 Jun 2024 08:05:48 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4138B3F64C
	for <meta-arm@lists.yoctoproject.org>; Tue, 11 Jun 2024 08:05:23 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/6] CI: use pregenerated SSH keys in genericarm64
Date: Tue, 11 Jun 2024 15:05:15 +0000
Message-Id: <20240611150519.1940896-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240611150519.1940896-1-ross.burton@arm.com>
References: <20240611150519.1940896-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 11 Jun 2024 15:05:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5796

We boot genericarm64 inside a qemu, so add the pregenerated keys to speed
up testing.  This isn't a risk because we don't publish the images.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/genericarm64.yml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/ci/genericarm64.yml b/ci/genericarm64.yml
index 320cfae7..2fbe766f 100644
--- a/ci/genericarm64.yml
+++ b/ci/genericarm64.yml
@@ -14,5 +14,8 @@ local_conf_header:
   bootloader: |
     # If running genericarm64 in a qemu we need to manually build the bo=
otloader
     EXTRA_IMAGEDEPENDS +=3D "virtual/bootloader"
+  sshpregen: |
+    # Allow the use of the pregen keys as this is CI so safe
+    COMPATIBLE_MACHINE:pn-ssh-pregen-hostkeys:genericarm64 =3D "generica=
rm64"
=20
 machine: genericarm64
--=20
2.34.1


