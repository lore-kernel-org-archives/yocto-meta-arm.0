Return-Path: <csaba.szilagyi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC57C87FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 07:47:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.29946.1753861658386429298
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 30 Jul 2025 00:47:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: csaba.szilagyi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 203A01DB5;
	Wed, 30 Jul 2025 00:47:30 -0700 (PDT)
Received: from ubuntu-build.budapest.arm.com (GM0ZH93R.arm.com [10.45.26.24])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9FB163F673;
	Wed, 30 Jul 2025 00:47:37 -0700 (PDT)
From: =?UTF-8?q?Csaba=20Szil=C3=A1gyi?= <csaba.szilagyi@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Csaba=20Szil=C3=A1gyi?= <csaba.szilagyi@arm.com>
Subject: [PATCH 6/6] arm/hafnium: add hafnium to qemuarm64-secureboot target
Date: Wed, 30 Jul 2025 07:45:51 +0000
Message-ID: <20250730074551.1388-7-csaba.szilagyi@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730074551.1388-1-csaba.szilagyi@arm.com>
References: <20250730074551.1388-1-csaba.szilagyi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 30 Jul 2025 07:47:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6633

Signed-off-by: Csaba Szil=C3=A1gyi <csaba.szilagyi@arm.com>
---
 ci/qemuarm64-secureboot.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ci/qemuarm64-secureboot.yml b/ci/qemuarm64-secureboot.yml
index b26941e0..fc9c90b2 100644
--- a/ci/qemuarm64-secureboot.yml
+++ b/ci/qemuarm64-secureboot.yml
@@ -9,6 +9,7 @@ machine: qemuarm64-secureboot
=20
 target:
   - core-image-base
+  - hafnium
=20
 local_conf_header:
   optee: |

