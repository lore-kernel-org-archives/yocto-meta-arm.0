Return-Path: <igor.opaniuk@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1F00CD5BB1
	for <webhook@archiver.kernel.org>; Mon, 25 May 2026 13:07:08 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15441.1779714427729146730
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 25 May 2026 06:07:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=CThsb8Ic;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: foundries.io, ip: 205.220.180.131, mailfrom: igor.opaniuk@foundries.io)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PBPjmb3263696
	for <meta-arm@lists.yoctoproject.org>; Mon, 25 May 2026 13:07:06 GMT
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecnhs0a91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <meta-arm@lists.yoctoproject.org>; Mon, 25 May 2026 13:07:06 +0000 (GMT)
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-5a8c76f9601so5649741e87.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 25 May 2026 06:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1779714425; x=1780319225; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lPYRZJGCGkfMgoq8+tndC6Jkb3YdAZpxPZsofbhgFfE=;
        b=CThsb8IcHMQkt8ADZW58/c3Ww/ayjxl8jiwgHM9oNLqYp0gOgRmcsYILD256IbW4jJ
         951N3QEV5HgZHgbp6Vj9QnsrEDDg9u39IoNd5BdEEdc5fXA6wfbYJoUfKecG/b52jyik
         oEVRXGc3nYUjxXDKP0i1piraqL1S2XY5Cw4pnrG+oBg3ttTgBQxt1fhcJEPISJ1TONCt
         bZAVsmbZU4m5zIZHyoE1OmmjRUuVGu6Yv0VPZXs2o3N/aY5Na5BcWJsTw8iY/yZmftp6
         FvOQALb53lRwcJ8N7dcoZonAPwRaNqOs0/zpLNdzqTwVtbv58ooYwhC3Bx/++vxDVa6h
         motg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779714425; x=1780319225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lPYRZJGCGkfMgoq8+tndC6Jkb3YdAZpxPZsofbhgFfE=;
        b=oRV2lqXDy8SJxn+IeQBkmDSaU1uJMbtHmqvsFVEqvg1dqDXUEmJtRcf23CB9i7P1ve
         zyNe2hNjvzdGWn68/4dTPYrY038K+JPuTJfm6tLfXTJ4QXwkHH0k3qUBrInggk56Lcz8
         6XXdF1FoCQeOiiQpIrNLaOlMm6ND8Ag4gUGIOPcFla0ocks0GFpsP0R1HXHTRmDtIC/F
         o5yiFvdyKAR3htdN7mTsbZG8uGuhXq7xay9pAp4pTEMiaf4/07NUPwqVA8UB6bWtFJ1P
         F3ccz+cdptDveHgMZ9dUeJoTTe+u4BBL0+WYnT97cgamTsJT81Os8h0HLfcWpWjZCkSp
         yZ+g==
X-Gm-Message-State: AOJu0YzpcL1751dX5HVi6chg0WH45Z2aUA4dpW+CxsauNPa4PRX7/u1t
	xzIEru+BX/4pbtgMPJdzY8tL8LdV/dNyauMFTgYGQ0vgu7pFPv60XC5yJ3XDhPUMWWmTG23Iu4G
	1ENddlokDU4yX0Wq7bHWZzhU6jtcVoRmB50GDqhJB0hIsnrosIJbe3u4vRD4kiFwA+XdAC1qbMW
	Nlgcn/
X-Gm-Gg: Acq92OEomqrhh4wbdl9GMd7Ty+YyEZ9umVLSl86Ndwj/rN7LHVqNEQDoLADY0pUeT37
	Wx8wNWPUMlkg16OPFLjvKNhu+IiU0NS426YSSss9EhoR0a+rGYD0XndllLQDfXp64NTVFwLZ/oF
	50rypB3FDxjBwK+Xo4KPMY6rhcAX7qXgUZrUJ5HGI+z8cjG18HPMBTMHwnttX85m/eErG1z27IL
	gYv//blcOlQ7Y8yDJJicwgOVgR8KOrH4+jyXuzwJ6L33QCHAHx5Tz1ffYDXUL8sflrbCq+ql4hK
	IActCkIgbPrlywsPvFRgCAzaSL/ja2wd7Igro2P5sfMcP3Prtq465CG9BukdIA6Tch2LD/jIBob
	FNdMBMKVE73BRv7IuPeQc38EVOgDA9WXNmiJqi50xW6Yf0Bpi023XekndxpIWi4o2jQw=
X-Received: by 2002:ac2:430d:0:b0:5a8:97d7:8c30 with SMTP id 2adb3069b0e04-5aa323924fdmr2918020e87.40.1779714424715;
        Mon, 25 May 2026 06:07:04 -0700 (PDT)
X-Received: by 2002:ac2:430d:0:b0:5a8:97d7:8c30 with SMTP id 2adb3069b0e04-5aa323924fdmr2918009e87.40.1779714423983;
        Mon, 25 May 2026 06:07:03 -0700 (PDT)
Received: from t14s-g6 (185-164-141-21.cgnat.inetia.pl. [185.164.141.21])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cb37a7sm2699599e87.2.2026.05.25.06.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 06:07:03 -0700 (PDT)
From: Igor Opaniuk <igor.opaniuk@foundries.io>
To: meta-arm@lists.yoctoproject.org
Cc: Jon Mason <jon.mason@arm.com>, Igor Opaniuk <igor.opaniuk@foundries.io>
Subject: [PATCH] arm/edk2-basetools-native: add util-linux-native to DEPENDS
Date: Mon, 25 May 2026 15:06:56 +0200
Message-ID: <20260525130656.2119859-1-igor.opaniuk@foundries.io>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Vd3H+lp9 c=1 sm=1 tr=0 ts=6a14497a cx=c_pps
 a=GG3J4tSt4DzqLn8s52yoAw==:117 a=JsdSkJyxCPcZmfxNhm0PvA==:17
 a=NGcC8JguVDcA:10 a=9UA2AVYIz8kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=s9rZhGMTjjZONbSeVUcA:9
 a=9R8SQkHTFvfJQMtf_-xA:22
X-Proofpoint-GUID: HKWk3x-NtmMRIveLaciAgdevOeQ0YHrS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEzNSBTYWx0ZWRfX7GoRsf1+ncoh
 CqhrlxJ76dBDFcKFCcbk2DBHewv3kJ5ruZC4gEiAGY4mXP9tpkRvbDWQLitE5IcJTpbCsTe6J7I
 zuU5UF51vD82moXr8DF9PzVNtGEUkCG0sw66nYN+LcGh1XB/Qdpth0YhAMwhYHe6WiWbCKlkoBI
 gao6jtWiJPkchtF2sSNTQBV5XCh3ejzPfRXzFrQv6vkyKHddFVTf8koibKNpjri3Z+bWB5PBaUe
 a3gdDE0QC40kccGzHgoldQn670yCaHyM8c1Yh9NOXYzYyqpQObOOSmMTf6Vj81j2UgPjvDQyT06
 h4375gSIF5uDRtf6AmAC39NDAwZBgHkupB4fV3Ugg9zXxvxN0k4cs/CKRnyeY7+3UUi+0vnLSsF
 G0j/xA9HCnZOWc1hjH3joVb7jt4ckh5M3ioFjNbe6oV5TLJ4drqsvokRdq2aIVfBNPyWjCa4Ids
 J0s2wESCynlVDH0SFeA==
X-Proofpoint-ORIG-GUID: HKWk3x-NtmMRIveLaciAgdevOeQ0YHrS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250135
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 25 May 2026 13:07:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7062

The C host tools GenFv and GenFfs include <uuid/uuid.h> from libuuid,
which is provided by util-linux. Without an explicit dependency the
build relies on the header being present in the host system, which
breaks reproducible builds and fails on hosts without uuid-dev
installed:

  GenFvInternalLib.c:21:10: fatal error: uuid/uuid.h: No such file or directory
     21 | #include <uuid/uuid.h>
        |          ^~~~~~~~~~~~~
  compilation terminated.

Add util-linux-native to DEPENDS so libuuid is staged into the native
sysroot before compilation.

Signed-off-by: Igor Opaniuk <igor.opaniuk@foundries.io>
---
 meta-arm/recipes-bsp/uefi/edk2-basetools-native_202602.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202602.bb b/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202602.bb
index e2d927e2..35dc199c 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202602.bb
+++ b/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202602.bb
@@ -25,6 +25,8 @@ UPSTREAM_CHECK_GITTAGREGEX = "^edk2-stable(?P<pver>\d+)$"
 
 inherit native
 
+DEPENDS += "util-linux-native"
+
 RDEPENDS:${PN} += "python3-core"
 
 do_compile() {
-- 
2.53.0


