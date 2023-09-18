Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36066CD37B0
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 11:16:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.48743.1695035785447067066
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 Sep 2023 04:16:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1860C1FB;
	Mon, 18 Sep 2023 04:17:02 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3E9BF3F67D;
	Mon, 18 Sep 2023 04:16:24 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/2] CI: remove redundant variables in testimage.yml
Date: Mon, 18 Sep 2023 12:16:21 +0100
Message-Id: <20230918111622.650459-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 18 Sep 2023 11:16:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5053

From: Ross Burton <ross.burton@arm.com>

QEMU_USE_SLIRP is no longer needed[1] as adding slirp to
TEST_RUNQEMUPARAMS is sufficient, so remove that.

Setting TEST_SERVER_IP also isn't needed as there's a default value now,
and we disable the package management tests that would use the server
IP.  When they work the correct IP can be set.

[1] As of oe-core f4e8650

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/testimage.yml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/ci/testimage.yml b/ci/testimage.yml
index f496ec1c..a0e90250 100644
--- a/ci/testimage.yml
+++ b/ci/testimage.yml
@@ -11,8 +11,6 @@ local_conf_header:
     QEMU_USE_KVM =3D ""
   slirp: |
     TEST_RUNQEMUPARAMS =3D "slirp"
-    TEST_SERVER_IP =3D "127.0.0.1"
-    QEMU_USE_SLIRP =3D "1"
   sshd: |
     IMAGE_FEATURES:append =3D " ssh-server-dropbear"
   sshkeys: |
--=20
2.34.1


