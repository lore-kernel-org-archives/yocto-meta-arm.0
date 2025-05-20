Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F02DBC3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 17:28:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.27027.1747762094849828472
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 May 2025 10:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D3C41516;
	Tue, 20 May 2025 10:28:01 -0700 (PDT)
Received: from gyoszi01-yocto.budapest.arm.com (ubul2.budapest.arm.com [10.45.25.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E7F2B3F5A1;
	Tue, 20 May 2025 10:28:13 -0700 (PDT)
From: Gyorgy Szing <gyorgy.szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 9/9] arm-bsp/trusted-services: pass MM_COMM_BUFFER_SIZE to the libts build
Date: Tue, 20 May 2025 19:27:47 +0200
Message-ID: <20250520172748.3439803-9-gyorgy.szing@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520172748.3439803-1-gyorgy.szing@arm.com>
References: <20250520172748.3439803-1-gyorgy.szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 20 May 2025 17:28:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6516

From: Bence Balogh <bence.balogh@arm.com>

The libts deployment expects the MM Communication buffer size to be
provided using the "MM_COMM_BUFFER_SIZE" variable.
Previously the default value which is set in the [1] was not overridden
here in the recipe because of this.

The size of the MM Communication buffers are not changed in this
commit, the page size is 0x1000.

[1] https://git.trustedfirmware.org/plugins/gitiles/TS/trusted-services.g=
it/+/refs/tags/v1.1.0/deployments/libts/arm-linux/CMakeLists.txt#24

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 .../recipes-security/trusted-services/libts_%.bbappend        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/recipes-security/trusted-services/libts_%.bbapp=
end b/meta-arm-bsp/recipes-security/trusted-services/libts_%.bbappend
index 2ae28c89..7871b1e5 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/libts_%.bbappend
+++ b/meta-arm-bsp/recipes-security/trusted-services/libts_%.bbappend
@@ -1,9 +1,9 @@
 require ts-arm-platforms.inc
=20
 EXTRA_OECMAKE:append:corstone1000 =3D "-DMM_COMM_BUFFER_ADDRESS=3D0x81FF=
F000 \
-                                     -DMM_COMM_BUFFER_PAGE_COUNT=3D1 \
+                                     -DMM_COMM_BUFFER_SIZE=3D0x1000 \
                                     "
=20
 EXTRA_OECMAKE:append:fvp-base =3D " -DMM_COMM_BUFFER_ADDRESS=3D0x8100000=
0 \
-                                  -DMM_COMM_BUFFER_PAGE_COUNT=3D8 \
+                                  -DMM_COMM_BUFFER_SIZE=3D0x8000 \
     "
--=20
2.43.0


