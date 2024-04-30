Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E764AC10F16
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 12:45:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.14248.1714481121891376670
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 05:45:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EFECC339;
	Tue, 30 Apr 2024 05:45:47 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F6DC3F73F;
	Tue, 30 Apr 2024 05:45:20 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/2] CI: build arm-systemready distro images
Date: Tue, 30 Apr 2024 12:45:17 +0000
Message-Id: <20240430124517.1702987-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240430124517.1702987-1-ross.burton@arm.com>
References: <20240430124517.1702987-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 12:45:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5650

There are two recipes in meta-arm-systemready that download ISOs for
testing purposes.  Build them in CI to verify that the fetch is
successful.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/arm-systemready-ir-acs.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/ci/arm-systemready-ir-acs.yml b/ci/arm-systemready-ir-acs.ym=
l
index ca4e8b0a..9eaf4037 100644
--- a/ci/arm-systemready-ir-acs.yml
+++ b/ci/arm-systemready-ir-acs.yml
@@ -14,3 +14,5 @@ local_conf_header:
=20
 target:
   - arm-systemready-ir-acs
+  - arm-systemready-linux-distros-debian
+  - arm-systemready-linux-distros-opensuse
--=20
2.34.1


