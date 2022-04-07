Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B36C4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.403.1649347769006305065
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 Apr 2022 09:09:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CE2F1596
	for <meta-arm@lists.yoctoproject.org>; Thu,  7 Apr 2022 09:09:29 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D642B3F73B
	for <meta-arm@lists.yoctoproject.org>; Thu,  7 Apr 2022 09:09:28 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/7] CI: rename sshd section in testimage.yml
Date: Thu,  7 Apr 2022 17:09:22 +0100
Message-Id: <20220407160925.3809765-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407160925.3809765-1-ross.burton@arm.com>
References: <20220407160925.3809765-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 07 Apr 2022 20:36:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3258

Rename the fragment that installs a SSH daemon to 'sshd' instead of the
generic 'packages'.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/testimage.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ci/testimage.yml b/ci/testimage.yml
index 0ffaaa2d..a26dcaf9 100644
--- a/ci/testimage.yml
+++ b/ci/testimage.yml
@@ -9,5 +9,5 @@ local_conf_header:
     TEST_RUNQEMUPARAMS =3D "slirp"
     TEST_SERVER_IP =3D "127.0.0.1"
     QEMU_USE_SLIRP =3D "1"
-  packages: |
+  sshd: |
     IMAGE_FEATURES:append =3D " ssh-server-dropbear"
--=20
2.25.1


