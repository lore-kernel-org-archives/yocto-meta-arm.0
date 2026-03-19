Return-Path: <igor.opaniuk@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE5F1075276
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 08:23:34 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6237.1773908611763809173
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Mar 2026 01:23:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=TVjZxkEf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: foundries.io, ip: 205.220.168.131, mailfrom: igor.opaniuk@foundries.io)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J73vBY2544601
	for <meta-arm@lists.yoctoproject.org>; Thu, 19 Mar 2026 08:23:31 GMT
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0957rt7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <meta-arm@lists.yoctoproject.org>; Thu, 19 Mar 2026 08:23:31 +0000 (GMT)
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b97b6ccf166so77071166b.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 19 Mar 2026 01:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1773908609; x=1774513409; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EGi8d9Lw8gWVfjzmftVNJ+qjScJ6fO088FgKWCrbUjM=;
        b=TVjZxkEfaHNBti7JstTjM6ieLaG2z0gjFxAxttBKC8Xq1ciuUYIl8VEIyzKjJM31h3
         rlhW58/DkfobsA7Aahl+zGXB06deSkXoID5mKbg/KW3lkzXTgTumJSFcF5H5GNZjq/aK
         b9UzGwFC7w2An2t6j5yNwVz2VCt1/lhmPlKOkWxW/Mzv2lO+DspzV1Fc6kme37ml6jgm
         M7pVC6rNlBvcpEIT8EUWD8CQ7hk+IJ6GiFaxtp/qlV4LlLfI3pbbBlXIaVEonq24Fy29
         Fi1LAxPicNDKNiHftLdbD7kqkj8UdG6bSbkrTvOjRIq2M64Rz0aagTJj3S87DMGGy02x
         SPJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773908609; x=1774513409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGi8d9Lw8gWVfjzmftVNJ+qjScJ6fO088FgKWCrbUjM=;
        b=tZ2dGDxGoIMyHzJqnjEXXFgMK4kJuss8K4HiKkBZfafjz3wc0xPjPHNAQxjEuViwLh
         dDaT6t16shA7+UZmEj6XMvaWV4Umnhm98OhKLgj+pjvTSckATj11x/MUPdjH8EtryQFU
         YLNvUYMQqRZba17KLSZOQ2SLTB+QPMEGxC0VqcEeCEGQjcg5aFut3ygARO3QywtY8B+9
         EpNbJ6+NFHSrkriNzar5w+4rB0hC742jvzv0ziREDEb55MlqGwYJGgoJts/33k5jsclE
         TAyPHkyzSF6f6gCkS4Y250hNJSs8EZpZGmR9ZgAoMX/YJaNPdTQgtteVukOy6RnjQn8K
         5zsQ==
X-Gm-Message-State: AOJu0YwrZ95g/iJzS5EsoFrDwegXAVjSB1rOgDs4a5w3dSsyNNGdRBsC
	lRq6WmcocPTgui2ALKfi+uQtptT2tg6u1JQe/w6YPUb3tXw3V1RbywAz6sbUXsHqIbF/siORhdz
	kESDLRNeoUjKvVvl4PmxghUgumTIJyqdK0sij22uJ3qfZlxH6B7tL/WIA1L6aqdk8gdvAWbWiX6
	j4l8Lj
X-Gm-Gg: ATEYQzxD1G22tTR4CNnK3OiTEdYJPYjBJ1vkevfYByMYU22wTi59fudn3Tw4Ua6Qa1+
	+3YA3+FvriHjplwWWXAxf1m7+Si3tngxAM7UJVRWpvPUNbfe4PtFOZmxpqYKOXZI8HCHtwgkQ+i
	tGjDyy1K1TViZnJUIG4P0tUzJZ7m8BQpedHPWAeU2h3JudHdFNpNzFk1eg9gC4TVJ65q6xSCu6G
	cwWlxkYUZiMsikvJR5Wd2AlWhXv/dSaH+YuwRz+4dODKo4Qr2+MF9HiLuaWBxdoBSnknXzTZlNW
	67Z5YmQwneKdAoU3enHYONAXTZrOyZnW9OHOCROdoXZjMf0YBvOSAgVZ2PpT8nY0cnYe8c9ExOI
	xu1N5E/xr1xckQEI+VuPf7JBMrZH7xhpRdTUQdt63IEG25EL8V1LNJtjiWKR6
X-Received: by 2002:a17:907:3f1f:b0:b98:d53:4f50 with SMTP id a640c23a62f3a-b980d5350b0mr198631266b.46.1773908608906;
        Thu, 19 Mar 2026 01:23:28 -0700 (PDT)
X-Received: by 2002:a17:907:3f1f:b0:b98:d53:4f50 with SMTP id a640c23a62f3a-b980d5350b0mr198629666b.46.1773908607995;
        Thu, 19 Mar 2026 01:23:27 -0700 (PDT)
Received: from igor-t14.. (185-72-184-225.cgnat.inetia.pl. [185.72.184.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f13e83c8sm406891166b.2.2026.03.19.01.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 01:23:27 -0700 (PDT)
From: Igor Opaniuk <igor.opaniuk@foundries.io>
To: meta-arm@lists.yoctoproject.org
Cc: Jon Mason <jon.mason@arm.com>, Ricardo Salveti <ricardo@foundries.io>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jose Quaresma <jose.quaresma@foundries.io>,
        Igor Opaniuk <igor.opaniuk@foundries.io>
Subject: [PATCH v1] arm/edk2-basetools-native: build C host tools (GenFfs, GenFv)
Date: Thu, 19 Mar 2026 09:23:23 +0100
Message-ID: <20260319082323.3673789-1-igor.opaniuk@foundries.io>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kM3-mdxanlHi0d-MdLSLsEEdFogsk7Wp
X-Proofpoint-GUID: kM3-mdxanlHi0d-MdLSLsEEdFogsk7Wp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA2NSBTYWx0ZWRfX1BwVAL/u0Sm0
 p9yYk9Hf+foxgYUvBSETh056E0tI4KmtQmcZ1bumY4gBWE1fWvkElInsSTWhFxtq9yJ7LuiXcHL
 k93y59NuWyLAOTSbTNg2hAug/oZoIx+v2lwjTIeFvtM/osvBk/jiw4sZXz5z3ZpvYtYOxxtBqKB
 REEw8Ka0BHA/adjRkB3vHIx5nl4e765WmszX/JXcN+SW446f7nDrHpAc3w/lTt4Z/AjUhh3tGwT
 H845+52s0zyRc2xc3KrPFvaNVv68bbynMt8emdZPpB8GWbWa7MJKy3F087D/oh+Q6sijij8gp0E
 9JO+yDLhil5wDQ6WtSwvCzC70XZVSicQ/DiYEnTBK2MQEqpSNDK9x1xTJdwjmde1igx29X1hOGj
 MpQWwqZ1tOxcyjVnfqGRO+83aKcApyMJh7pcj6iFKCnCHOjjUeobePc9YnSOcuDuuCmMzKeX/4l
 uozCzkQIIcNsI+hyprQ==
X-Authority-Analysis: v=2.4 cv=RZedyltv c=1 sm=1 tr=0 ts=69bbb283 cx=c_pps
 a=D+UBI74RbQA8i2EYnbuvxw==:117 a=nUgIwBcamMGg/yQZQzpXgQ==:17
 a=Yq5XynenixoA:10 a=9UA2AVYIz8kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=NEAV23lmAAAA:8
 a=YHFpd-ZClzWf5nr6Y90A:9 a=PsfoTyiJ_72bb7xyA04f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190065
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 19 Mar 2026 08:23:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6963

The recipe previously only copied the Python BaseTools into the native
sysroot, which was sufficient for capsule signing but not for Firmware
Volume (FV) creation. Downstream recipes that build UEFI capsule
update images for embedded platforms need GenFfs and GenFv to assemble
FV images - a key component of the UEFI Capsule Update format used for
system firmware updates.

Add the brotli submodule source (build-time dependency of both tools),
build the C BaseTools (Common, BrotliCompress, GenFfs, GenFv) and
install the binaries into ${bindir} together with GenerateCapsule.py
and the Common Python library so that capsule-generating recipes can
consume them from the native sysroot.

Signed-off-by: Igor Opaniuk <igor.opaniuk@foundries.io>
---
 .../uefi/edk2-basetools-native_202602.bb      | 43 ++++++++++++++++---
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202602.bb b/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202602.bb
index c26a3473..e2d927e2 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202602.bb
+++ b/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202602.bb
@@ -1,16 +1,25 @@
-# Install EDK2 Base Tools in native sysroot. Currently the BaseTools are not
-# built, they are just copied to native sysroot. This is sufficient for
-# generating UEFI capsules as it only depends on some python scripts. Other
-# tools need to be built first before adding to sysroot.
+# Install EDK2 Base Tools in native sysroot. The Python BaseTools are copied
+# wholesale, and the C host tools (GenFfs, GenFv) are built so that downstream
+# recipes can generate UEFI FV images and capsules.
+#
+# SRCREV_brotli must be kept in sync with the brotli submodule commit that
+# the pinned edk2 SRCREV declares in its .gitmodules. Update it whenever
+# the edk2 SRCREV is bumped.
+#   edk2-stable202602 (b7a715f7): brotli e230f474
 
 SUMMARY = "EDK2 Base Tools"
 LICENSE = "BSD-2-Clause-Patent"
 
 # EDK2
-SRC_URI = "git://github.com/tianocore/edk2.git;branch=master;protocol=https"
+SRC_URI = " \
+    git://github.com/tianocore/edk2.git;branch=master;protocol=https \
+    git://github.com/google/brotli.git;protocol=https;nobranch=1;name=brotli;destsuffix=${BPN}-${PV}/BaseTools/Source/C/BrotliCompress/brotli \
+"
 LIC_FILES_CHKSUM = "file://License.txt;md5=2b415520383f7964e96700ae12b4570a"
 
 SRCREV = "b7a715f7c03c45c6b4575bf88596bfd79658b8ce"
+SRCREV_brotli = "e230f474b87134e8c6c85b630084c612057f253e"
+SRCREV_FORMAT = "default_brotli"
 
 UPSTREAM_CHECK_GITTAGREGEX = "^edk2-stable(?P<pver>\d+)$"
 
@@ -18,7 +27,31 @@ inherit native
 
 RDEPENDS:${PN} += "python3-core"
 
+do_compile() {
+    BASE_C="${S}/BaseTools/Source/C"
+
+    oe_runmake -C "${BASE_C}/Common"
+    oe_runmake -C "${BASE_C}/BrotliCompress"
+    oe_runmake -C "${BASE_C}/GenFfs"
+    oe_runmake -C "${BASE_C}/GenFv"
+}
+
 do_install () {
     mkdir -p ${D}${bindir}/edk2-BaseTools
     cp -r ${S}/BaseTools/* ${D}${bindir}/edk2-BaseTools/
+
+    # Install compiled binaries to bindir so downstream recipes can reference
+    # them via ${STAGING_BINDIR_NATIVE}/GenFfs and GenFv.
+    install -d "${D}${bindir}"
+    install -m 0755 "${S}/BaseTools/Source/C/bin/GenFfs" "${D}${bindir}/"
+    install -m 0755 "${S}/BaseTools/Source/C/bin/GenFv"  "${D}${bindir}/"
+
+    # Install GenerateCapsule.py and Common/ Python library under a
+    # well-known datadir path.
+    install -d "${D}${datadir}/edk2-basetools"
+    install -m 0644 \
+        "${S}/BaseTools/Source/Python/Capsule/GenerateCapsule.py" \
+        "${D}${datadir}/edk2-basetools/"
+    cp -r "${S}/BaseTools/Source/Python/Common" \
+        "${D}${datadir}/edk2-basetools/"
 }
-- 
2.43.0


