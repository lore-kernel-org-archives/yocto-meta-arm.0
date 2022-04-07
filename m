Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A23C433FE
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.402.1649347767816434621
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 Apr 2022 09:09:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 899ED139F
	for <meta-arm@lists.yoctoproject.org>; Thu,  7 Apr 2022 09:09:27 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 372533F73B
	for <meta-arm@lists.yoctoproject.org>; Thu,  7 Apr 2022 09:09:27 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/7] CI: install pregenerated SSH keys to speed up boot
Date: Thu,  7 Apr 2022 17:09:19 +0100
Message-Id: <20220407160925.3809765-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 07 Apr 2022 20:36:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3255

As we're in a CI environment there's no need to generate unique SSH keys
on boot.  Installing the pregenerated SSH keys means they don't need to
be generated, which saves a reasonable amount of boot time due to the
lack of entropy if virtio-rng isn't available.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/base.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/ci/base.yml b/ci/base.yml
index eb5637d4..4c997463 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -42,6 +42,8 @@ local_conf_header:
     QEMU_USE_KVM =3D ""
   perf: |
     CORE_IMAGE_EXTRA_INSTALL +=3D "perf"
+  sshkeys: |
+    CORE_IMAGE_EXTRA_INSTALL +=3D "ssh-pregen-hostkeys"
 machine: unset
=20
 target:
--=20
2.25.1


