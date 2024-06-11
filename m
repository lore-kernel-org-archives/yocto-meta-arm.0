Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EBD9C41513
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 15:05:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12068.1718118325596625561
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Jun 2024 08:05:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0E3F1595
	for <meta-arm@lists.yoctoproject.org>; Tue, 11 Jun 2024 08:05:49 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E14353F64C
	for <meta-arm@lists.yoctoproject.org>; Tue, 11 Jun 2024 08:05:24 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/6] arm-bsp/ssh-pregen-hostkeys: fix corstone1000 typo
Date: Tue, 11 Jun 2024 15:05:18 +0000
Message-Id: <20240611150519.1940896-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240611150519.1940896-1-ross.burton@arm.com>
References: <20240611150519.1940896-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 11 Jun 2024 15:05:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5799

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../ssh-pregen-hostkeys/ssh-pregen-hostkeys_%.bbappend          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-connectivity/ssh-pregen-hostkeys/ssh-pr=
egen-hostkeys_%.bbappend b/meta-arm-bsp/recipes-connectivity/ssh-pregen-h=
ostkeys/ssh-pregen-hostkeys_%.bbappend
index 77c5bd3a..039a8479 100644
--- a/meta-arm-bsp/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-ho=
stkeys_%.bbappend
+++ b/meta-arm-bsp/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-ho=
stkeys_%.bbappend
@@ -1,6 +1,6 @@
 # These machines cannot run in product as they are virtual
 # platforms, so allow ssh-pregen-hostkeys to be used.
=20
-COMPATIBLE_MACHINE:corestone1000-fvp =3D "corestone1000-fvp"
+COMPATIBLE_MACHINE:corstone1000-fvp =3D "corstone1000-fvp"
 COMPATIBLE_MACHINE:fvp-base =3D "fvp-base"
 COMPATIBLE_MACHINE:sbsa-ref =3D "sbsa-ref"
--=20
2.34.1


