Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6426C761A6
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 14:24:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.131472.1680704638958987012
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Apr 2023 07:23:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED6291691;
	Wed,  5 Apr 2023 07:24:42 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F1DC63F762;
	Wed,  5 Apr 2023 07:23:57 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/3] arm-bsp/scp-firmware: move all machines to SCP 2.11
Date: Wed,  5 Apr 2023 15:23:54 +0100
Message-Id: <20230405142355.1703355-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230405142355.1703355-1-ross.burton@arm.com>
References: <20230405142355.1703355-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 05 Apr 2023 14:24:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4542

Thanks to Xueliang Zhong for testing that this works on N1SDP.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-juno.inc    | 2 +-
 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc   | 3 ---
 ...p-firmware_2.10.%.bbappend =3D> scp-firmware_2.11.%.bbappend} | 0
 3 files changed, 1 insertion(+), 4 deletions(-)
 rename meta-arm-bsp/recipes-bsp/scp-firmware/{scp-firmware_2.10.%.bbappe=
nd =3D> scp-firmware_2.11.%.bbappend} (100%)

diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-juno.inc =
b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-juno.inc
index ea2faceb..f78c94b4 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-juno.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-juno.inc
@@ -10,7 +10,7 @@ do_install:append() {
     for TYPE in ${FW_INSTALL}; do
         if [ "$TYPE" =3D "romfw_bypass" ]; then
             install -D "${B}/${TYPE}/${FW_TARGETS}/bin/${SCP_PLATFORM}-b=
l1-bypass.bin" "${D}/firmware/${FW}_${TYPE}.bin"
-            install -D "${B}/${TYPE}/${FW_TARGETS}/bin/${SCP_PLATFORM}-b=
l1-bypass" "${D}/firmware/${FW}_${TYPE}.elf"
+            install -D "${B}/${TYPE}/${FW_TARGETS}/bin/${SCP_PLATFORM}-b=
l1-bypass.elf" "${D}/firmware/${FW}_${TYPE}.elf"
         fi
     done
 }
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc=
 b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
index 85f89a01..811537aa 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
@@ -3,9 +3,6 @@
 SCP_PLATFORM  =3D "n1sdp"
 SCP_LOG_LEVEL =3D "INFO"
=20
-SRCREV  =3D "de7e464ecd77130147103cf48328099c2d0e6289"
-PV .=3D "+git${SRCPV}"
-
 COMPATIBLE_MACHINE:n1sdp =3D "n1sdp"
=20
 DEPENDS +=3D "fiptool-native"
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.10.%.bb=
append b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.11.%.bbappe=
nd
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.10.%.bba=
ppend
rename to meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.11.%.bbapp=
end
--=20
2.34.1


