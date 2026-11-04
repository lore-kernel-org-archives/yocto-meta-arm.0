Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3941.1793752594919386331
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 Nov 2026 16:36:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=YW126o1D;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=W0QakVUa;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RKO3194003
	for <meta-arm@lists.yoctoproject.org>; Wed, 4 Nov 2026 00:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=421tWSs3qVh
	rvo4vo8da/s7RFnS7qFoKbakFnd90U7c=; b=YW126o1DaYdKKiu5kr8hOSmpprZ
	/Y2U2T06Pt9YTCV6WUVTr736bQ7u6JxKetzqCzAC90bxrsnhvjld8IwAWlnUgIRO
	HnDzfG8cabD20ABGYECDZaJKL0q6GpHnMJozB2wV5nZBzgqmBYrNhEwamRf0TVV/
	O7uhLgQu+jxuisi7JxOiZOUA8Sgp/DajJ7gHTElLdJIaoy1EcqExilPK1YtFpngN
	VnMnhzEtvdHYYwx3oJtmty+6BoZmRk1keiqUG9T9OWBiRyE4+O6LSBEBwpj7eGQk
	OEY/4yIAinvxon8d8pZMS//ofV/c8Umjd/Ol0DagdE/jgqvBAChSgaOYi9g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8nh57b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <meta-arm@lists.yoctoproject.org>; Wed, 04 Nov 2026 00:36:34 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd68b8579f2so79835a12.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 03 Nov 2026 16:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793752594; x=1794357394; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=421tWSs3qVhrvo4vo8da/s7RFnS7qFoKbakFnd90U7c=;
        b=W0QakVUaW5qXHcTS4oSU+qpOrWlWuh1yUHT3GmDNzrkppU9wdARTVV6/XLDihY/ieX
         r0GHvXQ9wU3Ds7pGoQ5/9Xyus2BVPc2tag/01vxPQwYwVgz09uPP8ze6zocMpCdxE8Q8
         seDVH84VmjhjM+KsQxF0he241BrNb9HPkNxrJ8vI0kuR43h/wHah8Od/08lHlWcX20Bn
         g3fZAHfCk+KEf1wfZPjcQc/k3i88h2tXoTYLcKmHIDNljmNpy+u9mP2T4eQk0d9n7kvb
         mR0CxIe98KZkFNT803J4TKEqJyDieh2/sMxA1zdCbry19V38UgYdC8tRqJ/lgyaGbgT6
         M/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793752594; x=1794357394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=421tWSs3qVhrvo4vo8da/s7RFnS7qFoKbakFnd90U7c=;
        b=ucs/Cz479DB49HraZ+VPQNeDlBAtNFKai3mtgAKP/oYFkoK4UsGziXmbEDQVyVATF0
         /sucIzuwgVgXzmrIpgWWASVdr15wgGEKS+oww0vBrMnwZZ5ABbBMWCHsl+AazayE+E6p
         uG38bTLlSiThgoFuSc5ZonRqnMuZpK7rrPbK5U5YQkblW9QZ9uQpwgblHCjsmMG5ylt8
         +2qvcYoMLM45xHgPUC35f5nmsVsuvco/G0YZazK+1MXwYBOoeVMaBic3p7eQJUwVxjd2
         TNbas1xaIqSWaDJUrcpqf29oZzJUJgsWy8F1NT9ileaEsmbx1EIenZ3zSafnwzlmbbln
         A2PA==
X-Gm-Message-State: APuU4Z/T0a2bHH+d3YERkKjZ7RS7Ci3Ek3IoQSVMSOUpAfc+5OYaOyym
	gq+EyoXSIfTCQc7krMVryGJRpyaj0m3BI2FIbg0ywDw2rTmdfGuOicUpay6BvPPQt0dTiA2lyzG
	8eazuJx1eCXV0Cd8MwB1SWCzlrxFA+YOyAnsAXkxUsK7YAGM/TN1L2jDgRXA8shUTMWB145HcB+
	YngpRY4g==
X-Gm-Gg: AYBFou2pewRLbHBMsLZSGtsWAv5pTXnTQ0O3DjJxwLa2alByl/1kgs2KbsoBkcO20bV
	vRrAXm2DFxKpnkmiM0jU712cWtYLbLnDkvLQTt8lv13/H+o1zwNTqGEhRkzKye9Tg+BMdJCjd1r
	4aYkGknA5ZDLI+V+Uniib0KrH6gOcql6f2K5iHZ6gRK/GBgJ0ZdRCCcJOUkCcbPWrwLzgVJUmqN
	I6HeqWFpJ1Q9ZInlxddALtkAz6KywiMn+9MTqfb9bMfg67KcZhGhLOH+8MVzfZTEjtYse9YQsHf
	ZsLJ9F4NFknGlymNlxpWg20/O8etFRzs3M/UEiZHIfWBtarLGmMQEFbikdonCExzgLblMlV2T7T
	JIyQoGPKwalDTkUTgIQgpnisxd1njui1AnHQghD/h/AhkkeBllqav1wE/xf4GjNw8F0AiU6imN1
	T7LOV25fh786c4plWFSWAKnuz+fa+RcKNYrKO1D4WWEo8sGcE5wn1wbTSeNN9A5qqaMBlBnfazv
	4JlzMWONhtYlD4=
X-Received: by 2002:a17:90b:3944:b0:3ad:4a8b:c703 with SMTP id 98e67ed59e1d1-3ae896f8649mr11537517a91.19.1793752593563;
        Tue, 03 Nov 2026 16:36:33 -0800 (PST)
X-Received: by 2002:a17:90b:3944:b0:3ad:4a8b:c703 with SMTP id 98e67ed59e1d1-3ae896f8649mr11537500a91.19.1793752592952;
        Tue, 03 Nov 2026 16:36:32 -0800 (PST)
Received: from ip-172-31-25-255.us-west-2.compute.internal (ec2-35-83-207-173.us-west-2.compute.amazonaws.com. [35.83.207.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9928d1sm6677855a91.14.2026.11.03.16.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:36:32 -0800 (PST)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Jon Mason <jon.mason@arm.com>, Ross Burton <ross.burton@arm.com>
Subject: [PATCH 1/2] arm/optee: update to 4.11.0
Date: Wed,  4 Nov 2026 00:36:22 +0000
Message-ID: <20261104003624.3008551-2-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104003624.3008551-1-ricardo.salveti@oss.qualcomm.com>
References: <20261104003624.3008551-1-ricardo.salveti@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwMSBTYWx0ZWRfX5QercUoNkcq3
 OsgkoQduB94CFV20XmIWOZOYooX7xuntP+w5NMNdXHX1Rf2cyHJKD0c7Kf2S4h0j26ssAabE29a
 SBYO59/tjBoZT1cVq4w3r7UipvIqjTeGBiAKL25VdGrZZufk9oE/FAeLZ2B93RSUmJWBUMZRT9e
 B+cwj4/gYewco8fv5wsJZ3o7uW3OSCpwLBS7MiomX5WouN2Yz9qkXYdOVrWMmftLLjaD6VUKFCc
 h7Qx3cVYvrI0+Xo9ljpn8szE1JSgH9rStkhrUOCj7n62vx04xoJL8L/khx3PPtmsE5771vwbL/o
 KRHqUg8NXhtm6qT68IoVhrKURCh+pqjKcgeE3riLPRmFScGz8bDYt6mfDEW8Cz3OfrQb1lrSNTA
 KprlQqugTT/zy9Zhi2nSM9/7F/iRjzOYOUO2lxLaQQmDE6x7kRoB9nwbLfb/qlmA+tZi0Ac9HSj
 A4EViIamBfMAYIPs3bQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwMSBTYWx0ZWRfX4H+RQdTHt+8q
 fWJXuzoMwJM1Lg++pUBhA00nYTigJmFL0FjjdqvgRAnpRWVgKeqMMwCA2BQoawGr8/3uL+IWsiD
 NkSL1c2/I57zjzXPK+21LaUumZdUSMo=
X-Proofpoint-GUID: YTe-K8sr7curt7j7EkmAGAQ6yM0WBWjH
X-Proofpoint-ORIG-GUID: YTe-K8sr7curt7j7EkmAGAQ6yM0WBWjH
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aea7e12 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=P2/bgbqRawb6I1+7fxbs5g==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=ItSmiS8kAAAA:8
 a=EUspDBNiAAAA:8 a=nn6jHV3G5U2Yl-nOGaMA:9 a=bFCP_H2QrGi7Okbo017w:22
 a=Z_dOBdvtEwRpV_PUZq0s:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1011 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040001
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arm@lists.yoctoproject.org>; Wed, 04 Nov 2026 00:36:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7202
Content-Type: text/plain; charset="utf-8"

Update the recipes and the git recipes to 4.11.0.  Since corstone1000
is still using 4.10.0, move that to meta-arm-bsp.

Highlights:
- optee-os: mbedTLS 3.6.6, RISC-V FP context switching and device tree
  based boot, RPMB on UFS and optional RPMB-backed TA version
  databases, new NVIDIA Tegra, Renesas R-Car Gen5, Raspberry Pi 4,
  i.MX952 and Qualcomm platforms, SM2 ciphertext now C1 || C3 || C2 by
  default, and hardening across ldelf, SPMC, secure storage and key
  import.
- optee-client: new libasteec (Application Secrets) library, HKDF
  support and serialization fixes in libckteec.
- optee-test: new regression tests (PBKDF2, ECDH with invalid points,
  discarded AE output, nil UUID TA, RISC-V FP) and SM2 test vector
  selection matching optee-os.
- optee-examples: file input and key/IV options for the aes and sha
  examples, and an HMAC fix.

Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
 .../optee/optee-client_4.10.0.bb              |  0
 .../optee/optee-examples_4.10.0.bb            |  0
 .../optee/optee-os-tadevkit_4.10.0.bb         |  0
 .../recipes-security/optee/optee-os_4.10.0.bb |  0
 .../optee/optee-test_4.10.0.bb                |  0
 .../optee/optee-client_4.11.0.bb              |  4 +++
 .../optee/optee-client_git.bb                 |  4 +--
 .../optee/optee-examples_4.11.0.bb            |  4 +++
 .../optee/optee-examples_git.bb               |  4 +--
 .../optee/optee-os-tadevkit_4.11.0.bb         | 30 +++++++++++++++++++
 .../recipes-security/optee/optee-os_4.11.0.bb |  6 ++++
 .../recipes-security/optee/optee-os_git.bb    |  4 +--
 .../optee/optee-test_4.11.0.bb                | 17 +++++++++++
 .../recipes-security/optee/optee-test_git.bb  |  4 +--
 14 files changed, 69 insertions(+), 8 deletions(-)
 rename {meta-arm => meta-arm-bsp}/recipes-security/optee/optee-client_4.10.0.bb (100%)
 rename {meta-arm => meta-arm-bsp}/recipes-security/optee/optee-examples_4.10.0.bb (100%)
 rename {meta-arm => meta-arm-bsp}/recipes-security/optee/optee-os-tadevkit_4.10.0.bb (100%)
 rename {meta-arm => meta-arm-bsp}/recipes-security/optee/optee-os_4.10.0.bb (100%)
 rename {meta-arm => meta-arm-bsp}/recipes-security/optee/optee-test_4.10.0.bb (100%)
 create mode 100644 meta-arm/recipes-security/optee/optee-client_4.11.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-examples_4.11.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit_4.11.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-os_4.11.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-test_4.11.0.bb

diff --git a/meta-arm/recipes-security/optee/optee-client_4.10.0.bb b/meta-arm-bsp/recipes-security/optee/optee-client_4.10.0.bb
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-client_4.10.0.bb
rename to meta-arm-bsp/recipes-security/optee/optee-client_4.10.0.bb
diff --git a/meta-arm/recipes-security/optee/optee-examples_4.10.0.bb b/meta-arm-bsp/recipes-security/optee/optee-examples_4.10.0.bb
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-examples_4.10.0.bb
rename to meta-arm-bsp/recipes-security/optee/optee-examples_4.10.0.bb
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_4.10.0.bb b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_4.10.0.bb
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os-tadevkit_4.10.0.bb
rename to meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_4.10.0.bb
diff --git a/meta-arm/recipes-security/optee/optee-os_4.10.0.bb b/meta-arm-bsp/recipes-security/optee/optee-os_4.10.0.bb
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os_4.10.0.bb
rename to meta-arm-bsp/recipes-security/optee/optee-os_4.10.0.bb
diff --git a/meta-arm/recipes-security/optee/optee-test_4.10.0.bb b/meta-arm-bsp/recipes-security/optee/optee-test_4.10.0.bb
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-test_4.10.0.bb
rename to meta-arm-bsp/recipes-security/optee/optee-test_4.10.0.bb
diff --git a/meta-arm/recipes-security/optee/optee-client_4.11.0.bb b/meta-arm/recipes-security/optee/optee-client_4.11.0.bb
new file mode 100644
index 00000000..026ac6bc
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-client_4.11.0.bb
@@ -0,0 +1,4 @@
+require recipes-security/optee/optee-client.inc
+
+# v4.11.0
+SRCREV = "da81fb7b30781029bc9d4acfddc7c60b08deb1f3"
diff --git a/meta-arm/recipes-security/optee/optee-client_git.bb b/meta-arm/recipes-security/optee/optee-client_git.bb
index 884f3b59..a76dcffa 100644
--- a/meta-arm/recipes-security/optee/optee-client_git.bb
+++ b/meta-arm/recipes-security/optee/optee-client_git.bb
@@ -1,7 +1,7 @@
 require recipes-security/optee/optee-client.inc
 
-# v4.10.0
-SRCREV = "9f5e90918093c1d1cd264d8149081b64ab7ba672"
+# v4.11.0
+SRCREV = "da81fb7b30781029bc9d4acfddc7c60b08deb1f3"
 PV .= "+git"
 UPSTREAM_CHECK_COMMITS = "1"
 
diff --git a/meta-arm/recipes-security/optee/optee-examples_4.11.0.bb b/meta-arm/recipes-security/optee/optee-examples_4.11.0.bb
new file mode 100644
index 00000000..96b1425f
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-examples_4.11.0.bb
@@ -0,0 +1,4 @@
+require recipes-security/optee/optee-examples.inc
+
+# v4.11.0
+SRCREV = "71e8f3f320eef46a9369700bf30b91d67427d535"
diff --git a/meta-arm/recipes-security/optee/optee-examples_git.bb b/meta-arm/recipes-security/optee/optee-examples_git.bb
index d8d6d043..99ea004f 100644
--- a/meta-arm/recipes-security/optee/optee-examples_git.bb
+++ b/meta-arm/recipes-security/optee/optee-examples_git.bb
@@ -1,7 +1,7 @@
 require recipes-security/optee/optee-examples.inc
 
-# v4.10.0
-SRCREV = "934c7edb74a26e90f68024cf441073528444177f"
+# v4.11.0
+SRCREV = "71e8f3f320eef46a9369700bf30b91d67427d535"
 PV .= "+git"
 UPSTREAM_CHECK_COMMITS = "1"
 
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_4.11.0.bb b/meta-arm/recipes-security/optee/optee-os-tadevkit_4.11.0.bb
new file mode 100644
index 00000000..cca9f62a
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_4.11.0.bb
@@ -0,0 +1,30 @@
+require recipes-security/optee/optee-os_${PV}.bb
+
+SUMMARY = "OP-TEE Trusted OS TA devkit"
+DESCRIPTION = "OP-TEE TA devkit for build TAs"
+HOMEPAGE = "https://www.op-tee.org/"
+
+DEPENDS += "python3-pycryptodome-native"
+DEPENDS:append:toolchain-clang = " lld-native"
+
+do_install() {
+    #install TA devkit
+    install -d ${D}${includedir}/optee/export-user_ta/
+    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
+        cp -aR $f ${D}${includedir}/optee/export-user_ta/
+    done
+}
+
+do_deploy() {
+	echo "Do not inherit do_deploy from optee-os."
+}
+
+FILES:${PN} = "${includedir}/optee/"
+
+# Build paths are currently embedded
+INSANE_SKIP:${PN}-dev += "buildpaths"
+
+# Include extra headers needed by SPMC tests to TA DEVKIT.
+# Supported after op-tee v3.20
+EXTRA_OEMAKE:append = "${@bb.utils.contains('MACHINE_FEATURES', 'optee-spmc-test', \
+                                        ' CFG_SPMC_TESTS=y', '' , d)}"
diff --git a/meta-arm/recipes-security/optee/optee-os_4.11.0.bb b/meta-arm/recipes-security/optee/optee-os_4.11.0.bb
new file mode 100644
index 00000000..8c1526ec
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os_4.11.0.bb
@@ -0,0 +1,6 @@
+require recipes-security/optee/optee-os.inc
+
+DEPENDS += "dtc-native"
+
+# v4.11.0
+SRCREV = "f54190f22611dd5ad5d22546fd4209aa100f56bd"
diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb b/meta-arm/recipes-security/optee/optee-os_git.bb
index f2ae0d46..27080b3c 100644
--- a/meta-arm/recipes-security/optee/optee-os_git.bb
+++ b/meta-arm/recipes-security/optee/optee-os_git.bb
@@ -2,8 +2,8 @@ require recipes-security/optee/optee-os.inc
 
 DEPENDS += "dtc-native"
 
-# v4.10.0
-SRCREV = "753afbbee1682f5d16fd30e87b31058a4fd4f4b8"
+# v4.11.0
+SRCREV = "f54190f22611dd5ad5d22546fd4209aa100f56bd"
 PV .= "+git"
 UPSTREAM_CHECK_COMMITS = "1"
 
diff --git a/meta-arm/recipes-security/optee/optee-test_4.11.0.bb b/meta-arm/recipes-security/optee/optee-test_4.11.0.bb
new file mode 100644
index 00000000..b06be1c6
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-test_4.11.0.bb
@@ -0,0 +1,17 @@
+require recipes-security/optee/optee-test.inc
+
+# v4.11.0
+SRCREV = "179740b43809069ee567d58ebd8e0f85ef8168e2"
+
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a8fa504109e4cd7ea575bc49ea4be560 \
+                    file://LICENSE-BSD;md5=dca16d6efa93b55d0fd662ae5cd6feeb \
+                    file://LICENSE-GPL;md5=10e86b5d2a6cb0e2b9dcfdd26a9ac58d \
+                   "
+
+# Include ffa_spmc test group if the SPMC test is enabled.
+# Supported after op-tee v3.20
+EXTRA_OEMAKE:append = "${@bb.utils.contains('MACHINE_FEATURES', 'optee-spmc-test', \
+                                        ' CFG_SPMC_TESTS=y CFG_SECURE_PARTITION=y', '' , d)}"
+
+RDEPENDS:${PN} += "${@bb.utils.contains('MACHINE_FEATURES', 'optee-spmc-test', \
+                                              ' arm-ffa-user', '' , d)}"
diff --git a/meta-arm/recipes-security/optee/optee-test_git.bb b/meta-arm/recipes-security/optee/optee-test_git.bb
index a06c76c1..a560122a 100644
--- a/meta-arm/recipes-security/optee/optee-test_git.bb
+++ b/meta-arm/recipes-security/optee/optee-test_git.bb
@@ -1,7 +1,7 @@
 require recipes-security/optee/optee-test.inc
 
-# v4.10.0
-SRCREV = "88c93e87a5c172363ee986ded036a25cafcc9d2c"
+# v4.11.0
+SRCREV = "179740b43809069ee567d58ebd8e0f85ef8168e2"
 PV .= "+git"
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.43.0

