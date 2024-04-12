Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FD64C04FFE
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 10:05:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.43375.1712916338554153639
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Apr 2024 03:05:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F2EF113E;
	Fri, 12 Apr 2024 03:06:07 -0700 (PDT)
Received: from e126835.arm.com (unknown [10.57.83.142])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 889C43F7C5;
	Fri, 12 Apr 2024 03:05:37 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 2/3] arm-bsp/trusted-services: corstone1000: Change MM comm buffer location
Date: Fri, 12 Apr 2024 11:05:26 +0100
Message-Id: <20240412100527.991610-3-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240412100527.991610-1-emekcan.aras@arm.com>
References: <20240412100527.991610-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 12 Apr 2024 10:05:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5537

From: Emekcan Aras <emekcan.aras@arm.com>

MM Communicate buffer is accessed by normal world but at the moment so it
should be located in DDR instead of secure-ram. This moves mm communicate
buffer to the DDR for trusted-service components.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 meta-arm-bsp/recipes-security/trusted-services/libts_%.bbappend | 2 +-
 .../recipes-security/trusted-services/ts-sp-se-proxy_%.bbappend | 2 +-
 .../trusted-services/ts-sp-smm-gateway_%.bbappend               | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm-bsp/recipes-security/trusted-services/libts_%.bbapp=
end b/meta-arm-bsp/recipes-security/trusted-services/libts_%.bbappend
index 99c03f69..450cfc58 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/libts_%.bbappend
+++ b/meta-arm-bsp/recipes-security/trusted-services/libts_%.bbappend
@@ -1,5 +1,5 @@
 require ts-arm-platforms.inc
=20
-EXTRA_OECMAKE:append:corstone1000 =3D "-DMM_COMM_BUFFER_ADDRESS=3D0x0200=
0000 \
+EXTRA_OECMAKE:append:corstone1000 =3D "-DMM_COMM_BUFFER_ADDRESS=3D0x81FF=
F000 \
                                      -DMM_COMM_BUFFER_PAGE_COUNT=3D1 \
                                     "
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-se-prox=
y_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-se-pr=
oxy_%.bbappend
index eba15532..3a1b2d81 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-se-proxy_%.bba=
ppend
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-se-proxy_%.bba=
ppend
@@ -1,5 +1,5 @@
 require ts-arm-platforms.inc
=20
-EXTRA_OECMAKE:append:corstone1000 =3D " -DMM_COMM_BUFFER_ADDRESS=3D"0x00=
000000 0x02000000" \
+EXTRA_OECMAKE:append:corstone1000 =3D " -DMM_COMM_BUFFER_ADDRESS=3D"0x00=
000000 0x81FFF000" \
     -DMM_COMM_BUFFER_PAGE_COUNT=3D"1" \
     "
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-smm-gat=
eway_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-sm=
m-gateway_%.bbappend
index eba15532..3a1b2d81 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-smm-gateway_%.=
bbappend
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-smm-gateway_%.=
bbappend
@@ -1,5 +1,5 @@
 require ts-arm-platforms.inc
=20
-EXTRA_OECMAKE:append:corstone1000 =3D " -DMM_COMM_BUFFER_ADDRESS=3D"0x00=
000000 0x02000000" \
+EXTRA_OECMAKE:append:corstone1000 =3D " -DMM_COMM_BUFFER_ADDRESS=3D"0x00=
000000 0x81FFF000" \
     -DMM_COMM_BUFFER_PAGE_COUNT=3D"1" \
     "
--=20
2.25.1


