Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B54C6FD18
	for <webhook@archiver.kernel.org>; Sun, 23 Apr 2023 19:59:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.35082.1682279946456090637
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 23 Apr 2023 12:59:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: adam.johnston@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 787311042;
	Sun, 23 Apr 2023 12:59:49 -0700 (PDT)
Received: from e114993.cambridge.arm.com (e114993.cambridge.arm.com [10.1.200.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFD6A3F587;
	Sun, 23 Apr 2023 12:59:04 -0700 (PDT)
From: adam.johnston@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Adam Johnston <adam.johnston@arm.com>
Subject: [PATCH 1/1] CI: Remove ts-smm-gateway from N1SDP
Date: Sun, 23 Apr 2023 20:58:55 +0100
Message-Id: <20230423195855.1800774-2-adam.johnston@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230423195855.1800774-1-adam.johnston@arm.com>
References: <20230423195855.1800774-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 23 Apr 2023 19:59:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4611

From: Adam Johnston <adam.johnston@arm.com>

Installing SMM Gateway SP on the N1SDP may stop the platform from booting
for on-device testing in CI.

In n1sdp.yml, remove `ts-smm-gateway` if it has been added

Keep `ts-smm-gateway` in default SP set so it can still be tested with
`qemu-secureboot`

Signed-off-by: Adam Johnston <adam.johnston@arm.com>
---
 ci/n1sdp.yml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/ci/n1sdp.yml b/ci/n1sdp.yml
index 797a5225..f6883079 100644
--- a/ci/n1sdp.yml
+++ b/ci/n1sdp.yml
@@ -4,3 +4,7 @@ header:
     - ci/base.yml
=20
 machine: n1sdp
+
+local_conf_header:
+  unsupported_trusted_services: |
+    MACHINE_FEATURES:remove =3D "ts-smm-gateway"
--=20
2.25.1


