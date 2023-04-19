Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B299C77B73
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 16:31:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.42995.1681921866334622809
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Apr 2023 09:31:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CFF7C14;
	Wed, 19 Apr 2023 09:31:49 -0700 (PDT)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 65D413F5A1;
	Wed, 19 Apr 2023 09:31:05 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH] arm/scp-firmware: Add support for components other than SCP, MCP
Date: Wed, 19 Apr 2023 17:30:52 +0100
Message-Id: <20230419163052.473096-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Apr 2023 16:31:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4582

From: Peter Hoyes <Peter.Hoyes@arm.com>

SCP-firmware may build components other than the SCP and MCP. Make the
MCP branch of the do_install task more generic to suport this.

Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
---
 .../recipes-bsp/scp-firmware/scp-firmware_2.11.0.bb  | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.11.0.bb b/m=
eta-arm/recipes-bsp/scp-firmware/scp-firmware_2.11.0.bb
index d67e25d3..30705f6e 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.11.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.11.0.bb
@@ -78,17 +78,17 @@ do_install() {
                if [ "$FW" =3D "scp" ]; then
                    install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-bl=
1.bin" "${D}/firmware/${FW}_${TYPE}.bin"
                    install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-bl=
1.elf" "${D}/firmware/${FW}_${TYPE}.elf"
-               elif [ "$FW" =3D "mcp" ]; then
-                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-mc=
p-bl1.bin" "${D}/firmware/${FW}_${TYPE}.bin"
-                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-mc=
p-bl1.elf" "${D}/firmware/${FW}_${TYPE}.elf"
+               else
+                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-${=
FW}-bl1.bin" "${D}/firmware/${FW}_${TYPE}.bin"
+                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-${=
FW}-bl1.elf" "${D}/firmware/${FW}_${TYPE}.elf"
                fi
            elif [ "$TYPE" =3D "ramfw" ]; then
                if [ "$FW" =3D "scp" ]; then
                    install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-bl=
2.bin" "${D}/firmware/${FW}_${TYPE}.bin"
                    install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-bl=
2.elf" "${D}/firmware/${FW}_${TYPE}.elf"
-               elif [ "$FW" =3D "mcp" ]; then
-                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-mc=
p-bl2.bin" "${D}/firmware/${FW}_${TYPE}.bin"
-                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-mc=
p-bl2.elf" "${D}/firmware/${FW}_${TYPE}.elf"
+               else
+                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-${=
FW}-bl2.bin" "${D}/firmware/${FW}_${TYPE}.bin"
+                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-${=
FW}-bl2.elf" "${D}/firmware/${FW}_${TYPE}.elf"
                fi
            fi
        done
--=20
2.34.1


