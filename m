Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6AC8C10F1A
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 13:37:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.18719.1713793064348813027
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Apr 2024 06:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 364E213D5;
	Mon, 22 Apr 2024 06:38:12 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D8A83F73F;
	Mon, 22 Apr 2024 06:37:43 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/6] ci/testimage: don't :append to IMAGE_FEATURES
Date: Mon, 22 Apr 2024 13:37:35 +0000
Message-Id: <20240422133739.190536-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240422133739.190536-1-ross.burton@arm.com>
References: <20240422133739.190536-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 22 Apr 2024 13:37:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5579

Some BSPs use a proper initramfs and putting a SSH server into them
via this :append isn't ideal.  Adding using +=3D should be sufficient.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/testimage.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ci/testimage.yml b/ci/testimage.yml
index a0e90250..4b71a5e1 100644
--- a/ci/testimage.yml
+++ b/ci/testimage.yml
@@ -12,7 +12,7 @@ local_conf_header:
   slirp: |
     TEST_RUNQEMUPARAMS =3D "slirp"
   sshd: |
-    IMAGE_FEATURES:append =3D " ssh-server-dropbear"
+    IMAGE_FEATURES +=3D "ssh-server-dropbear"
   sshkeys: |
     CORE_IMAGE_EXTRA_INSTALL +=3D "ssh-pregen-hostkeys"
   universally_failing_tests: |
--=20
2.34.1


