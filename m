Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0343FC433FE
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 14:21:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.76568.1638282108493366342
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Nov 2021 06:21:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B28A011FB
	for <meta-arm@lists.yoctoproject.org>; Tue, 30 Nov 2021 06:21:47 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D4E03F5A1
	for <meta-arm@lists.yoctoproject.org>; Tue, 30 Nov 2021 06:21:47 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: disable use of KVM
Date: Tue, 30 Nov 2021 14:21:45 +0000
Message-Id: <20211130142145.3711132-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Nov 2021 14:21:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2491

oe-core c2a2d47 changed the default of QEMU_USE_KVM to 1, so qemu will
want to use KVM and will error if it can't.  Our CI runners don't have
KVM, so we need to disable this.

In the long term this should be more intelligent as some workers have
KVM and some don't, but this will get successful builds again.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/base.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/ci/base.yml b/ci/base.yml
index 86608b28..6a96a47d 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -37,6 +37,8 @@ local_conf_header:
     PACKAGECONFIG:append:pn-perf =3D " coresight"
   noptest: |
     DISTRO_FEATURES:remove =3D "ptest"
+  kvm: |
+    QEMU_USE_KVM =3D "0"
=20
 machine: unset
=20
--=20
2.25.1


