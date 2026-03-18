Return-Path: <igor.opaniuk@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C3E6103E16B
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 12:23:55 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12627.1773836629238986552
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Mar 2026 05:23:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=OdjPe+MX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: foundries.io, ip: 205.220.180.131, mailfrom: igor.opaniuk@foundries.io)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IAi7D9008805
	for <meta-arm@lists.yoctoproject.org>; Wed, 18 Mar 2026 12:23:48 GMT
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytj50ag6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <meta-arm@lists.yoctoproject.org>; Wed, 18 Mar 2026 12:23:48 +0000 (GMT)
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-661827d7a81so839062a12.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 18 Mar 2026 05:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1773836626; x=1774441426; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m0IcWVi9So8cE3O+tRuB74kgLdexgYG+3mCIL4pfd4o=;
        b=OdjPe+MXdvKyTogOtkzpxsWTXGA/K4mCjK17raLjJ50IknHpi4euvecf3J5YGFRBly
         NMePM68ceSV6PpUeNHIePOtMcqcAGXKw3bHISVJjiOJMhsixuHB/JkWBuQbUucoQoBYl
         FT+ffemcvjIjgRp+ixQGUdUd2ah33zfyDlMD9HioRk5YZz8uMUrcjznvnpgCxmHHsrYZ
         CUS5Z7YHPfivhlMZ6yXmuzsJW1hby5lY9Qtbw9ISoDGv2NYzRRQ4hCDP5PIIjfctB/0m
         eGEGHB2nVAaVguzXZanqNJR3jBeuM+8UimWhleakYDPkalIjJ9uuQyW166VJG4ObFX1z
         JOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773836626; x=1774441426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0IcWVi9So8cE3O+tRuB74kgLdexgYG+3mCIL4pfd4o=;
        b=alFiE4uXbOyIfTLbBbO0j8fqjaqcyUYxehYiAku+kDOrdC1V9ISdSlF019sQebdEb1
         5LCCCV67VRhuNBvZoF50xVzzSsvDOqUkYOIdCrgPG26jgrG+QRHDPBoXr9WA4t2/sPSN
         Rij5HivNw1Ys0fIDwT9XI3FwvmKBFva/bwfSfD3K1KDC5hbFRzUG2Bxztk4sGPtxvdlP
         e++MrzM+XOs0xctT3WK+NpK/oZ53lCQeioh5NCB+Tv25bUOlukpVAjY0sws/4eTWd9Zy
         A8TNeZUXs3hx5IPcb1POmUtlkaO9cvXjYwegBnbeYUH2/S1eyCFgQA1h7G4SSB/LR4Ch
         aDOg==
X-Gm-Message-State: AOJu0YyQ4Jjylzsr+6uC7LLoCd6S/bAx5dEibWSrds1vwEIOK144eIiX
	ofR2cfN64IGYlYQeeFYzrYltFVCSSCLJrl/Yl5f4LzOF1xtz/B0d4ggBvqKT7STUTf1h9+cAHUy
	xTULPOlY8eF1CX0AVAkQm6rr9UAA7aXUV795lBk83Y13Nu7777FiGFoA78Ud6bvB9nDBQappQY2
	4EgA==
X-Gm-Gg: ATEYQzwAseNsmO4FyTT5wb/AOtDfuaVA745kFG12tdoGUF0hpobbd0fOnzrCJy/x7w+
	RA5XQTM3Z8xsLIydVhlinT5LK7+Xx40+mHvRurEai7vfhVqS4tNChHcTQzzaWCoHdQjHsnqkLxk
	Jzzqh3pM+jzODYIpalo5G8WgyyGDA5RaL9R8+kyulXUElUJ4yZtMsjQS2RNUP3yNHWjHrziKt8R
	KYVhcnyCrBf5WUBNulvC/ZrJJw0FeSJlgqqsSOufqStwbe5gKVJYpSHfbTSUtzUmAxRrUl1/c79
	RH4qRnu10rTFkguxdIZCcHC/04KLmsC8HdLRgKqg+f7tQVtVk69Umuc3tTuhzW+4sm1wH9dGdA8
	TABtAOuz0OZcK7DAF/pYvv4UEXaESJtEOxny9ju3bKBZfhDHxIQ3HUsUZiroD
X-Received: by 2002:a17:907:7288:b0:b8f:c684:db28 with SMTP id a640c23a62f3a-b97f182ce5dmr208959566b.12.1773836626171;
        Wed, 18 Mar 2026 05:23:46 -0700 (PDT)
X-Received: by 2002:a17:907:7288:b0:b8f:c684:db28 with SMTP id a640c23a62f3a-b97f182ce5dmr208957366b.12.1773836625634;
        Wed, 18 Mar 2026 05:23:45 -0700 (PDT)
Received: from igor-t14.. (185-72-184-225.cgnat.inetia.pl. [185.72.184.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f13ed066sm196687666b.4.2026.03.18.05.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 05:23:45 -0700 (PDT)
From: Igor Opaniuk <igor.opaniuk@foundries.io>
To: meta-arm@lists.yoctoproject.org
Cc: Jon Mason <jon.mason@arm.com>, Ricardo Salveti <ricardo@foundries.io>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jose Quaresma <jose.quaresma@foundries.io>,
        Igor Opaniuk <igor.opaniuk@foundries.io>
Subject: [RESEND RFC] arm/edk2-basetools-native: build C host tools (GenFfs, GenFv)
Date: Wed, 18 Mar 2026 13:23:42 +0100
Message-ID: <20260318122342.1531416-1-igor.opaniuk@foundries.io>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEwNSBTYWx0ZWRfX4mA0XATC0/TR
 nQMzfwOgELSRKR8deopohotzJXU97ehJsmFkIhKRUUSD5/RI6FNWEIHbIBwChNPyBjJJGPxBJdX
 1RotabNCY4EJus/ardaLkAc/C2gZ9WmPy8oPkgC8WuNUyixPwfDE3PK8n6b3mdL4JKQZ8Xy9caQ
 pU5ITXG5vii6i4mZ/bVtiIrUX0C6iSWNbVtU+81cKZaY1OhJNHhOUtgZk3TL5xeqJL30nXPruG/
 NGS3KoWBbMibhc/Sr1f89N8Se2klQ7S8cpQmNklRSwCad/0ZVJuVi6r9EUxGGVm06hY0pO01LtT
 1kIMCTavsSQ8huF/PM1jGErdGxVQesuCupFxk9hiVB/3PACOB6PWxGclofmZbtKLlexX/EJF6TP
 ORoLDwK0b9h5+1WlIW9hCwPDnQJRJyzpYSEKyYqXgXEcr89RBcZcM1v8QGHgdwl+WA0lQ3uUGRc
 HoDU+0WkjxaxJSsvqdw==
X-Proofpoint-ORIG-GUID: D2rTuNIYbAZ75cgIjadoBw-S9OLPZAJ-
X-Proofpoint-GUID: D2rTuNIYbAZ75cgIjadoBw-S9OLPZAJ-
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=69ba9954 cx=c_pps
 a=Tczdrg5if7+wQeIJmxD/XA==:117 a=nUgIwBcamMGg/yQZQzpXgQ==:17
 a=Yq5XynenixoA:10 a=9UA2AVYIz8kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=NEAV23lmAAAA:8
 a=YHFpd-ZClzWf5nr6Y90A:9 a=1oAhN8tkTtOBK6_UvoHx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180105
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 Mar 2026 12:23:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6960

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
 .../uefi/edk2-basetools-native_202602.bb      | 48 +++++++++++++++++--
 1 file changed, 43 insertions(+), 5 deletions(-)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202602.bb b/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202602.bb
index c26a3473..2d33fb86 100644
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
 
@@ -18,7 +27,36 @@ inherit native
 
 RDEPENDS:${PN} += "python3-core"
 
+do_compile() {
+    BASE_C="${S}/BaseTools/Source/C"
+
+    for d in Common BrotliCompress GenFfs GenFv; do
+        oe_runmake -C "${BASE_C}/${d}" clean 2>/dev/null || true
+    done
+    rm -f "${BASE_C}/bin/GenFfs" "${BASE_C}/bin/GenFv"
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


