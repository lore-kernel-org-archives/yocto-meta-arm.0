Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.1117.1620748930015747400
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 May 2021 09:02:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B48F11692
	for <meta-arm@lists.yoctoproject.org>; Tue, 11 May 2021 09:02:08 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F3FD3F719
	for <meta-arm@lists.yoctoproject.org>; Tue, 11 May 2021 09:02:08 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/scp-firmware: install .elf into scp-firmware-dbg
Date: Tue, 11 May 2021 17:02:03 +0100
Message-Id: <20210511160203.1116699-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210511160203.1116699-1-ross.burton@arm.com>
References: <20210511160203.1116699-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Alongside the .bin files, also install the .elf files for debugging and
package them into scp-firmware-dbg.

The architecture QA test needs to be skipped as the SCP can be 32-bit
Arm when the main processor is 64-bit.

Change-Id: I82a57d6cc80f7d7e20028cced83481322803fc13
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.8.0.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.8.0.bb b/me=
ta-arm/recipes-bsp/scp-firmware/scp-firmware_2.8.0.bb
index bee3ab5..c58e621 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.8.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.8.0.bb
@@ -59,14 +59,19 @@ do_install() {
      for FW in ${FW_TARGETS}; do
         for TYPE in ${FW_INSTALL}; do
            install -D "${B}/product/${SCP_PLATFORM}/${FW}_${TYPE}/${SCP_=
BUILD_STR}/bin/${FW}_${TYPE}.bin" "${D}/firmware/"
+           install -D "${B}/product/${SCP_PLATFORM}/${FW}_${TYPE}/${SCP_=
BUILD_STR}/bin/${FW}_${TYPE}.elf" "${D}/firmware/"
         done
      done
 }
=20
 FILES_${PN} =3D "/firmware"
 SYSROOT_DIRS +=3D "/firmware"
+
+FILES_${PN}-dbg +=3D "/firmware/*.elf"
 # Skip QA check for relocations in .text of elf binaries
-INSANE_SKIP_${PN} =3D "textrel"
+INSANE_SKIP_${PN}-dbg =3D "arch textrel"
+INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
+INHIBIT_PACKAGE_STRIP =3D "1"
=20
 do_deploy() {
     # Copy the images to deploy directory
--=20
2.25.1

