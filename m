Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA97C00A94
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 09:26:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16883.1713173202899138543
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Apr 2024 02:26:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E95262F4;
	Mon, 15 Apr 2024 02:27:10 -0700 (PDT)
Received: from e126523.arm.com (unknown [10.57.76.60])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B5DDF3F64C;
	Mon, 15 Apr 2024 02:26:41 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 1/1] kas: corstone1000: disable multiconfig for firmware builds
Date: Mon, 15 Apr 2024 11:26:27 +0200
Message-Id: <20240415092627.341741-2-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240415092627.341741-1-bence.balogh@arm.com>
References: <20240415092627.341741-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Apr 2024 09:26:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5542

From: Bence Balogh <bence.balogh@arm.com>

Multiconfig is only needed when recovery and the mass storage images
are built together. It is not needed when firmware-only build is used.

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 kas/corstone1000-firmware-only.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kas/corstone1000-firmware-only.yml b/kas/corstone1000-firmwa=
re-only.yml
index f1640367..6192a408 100644
--- a/kas/corstone1000-firmware-only.yml
+++ b/kas/corstone1000-firmware-only.yml
@@ -4,6 +4,8 @@ header:
=20
 local_conf_header:
   firmwarebuild: |
+    BBMULTICONFIG:remove =3D "firmware"
+
     # Need to ensure the rescue linux options are selected
     OVERRIDES .=3D ":firmware"
=20
--=20
2.25.1


