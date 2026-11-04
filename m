Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3940.1793752594368917491
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 Nov 2026 16:36:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=RJHlcHH0;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=PIqAStst;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40R76W193439
	for <meta-arm@lists.yoctoproject.org>; Wed, 4 Nov 2026 00:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LWJanuswWAHSuiKQHLqedaGBTjD+MgdDbpU
	XkwG/zec=; b=RJHlcHH0ZiiDx60659xtsLBy9GUR31HI5N3USVfdBVqs/giNfho
	2pSFzQoyRWU/V3wXMghquZYFb9wjR0ytK++khiIdQrx8Qb31wzN1ckvOzvL2wFaV
	vs4NP4LmGfa0m0tSO9RrsI5pSPBBsyWzVIxPWfVonoAk18xzH96fKp9pJUM+ptgM
	udH7wSYEMu+DYZ3wuFejNcheIdZV0mntS8KWTv6QT+oYgctzgzwWpAOK07mYRnnm
	nNg4ZgnucVU4kHfH+MLfJqZOrhAefVnjkPYv7GjfZRn78DGgaqI+P9StFOKMjUrZ
	i4KOQZbuDXM2ib7tMzevDb+zHc5LtLyMyWA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8nh57a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <meta-arm@lists.yoctoproject.org>; Wed, 04 Nov 2026 00:36:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b07b06027eso283101a91.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 03 Nov 2026 16:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793752593; x=1794357393; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LWJanuswWAHSuiKQHLqedaGBTjD+MgdDbpUXkwG/zec=;
        b=PIqAStstBJkFqtT5lH4M/F8bSjkIWR5dcH4Ji91Ljwj7aHgV9facabL82S6ebowxDD
         Sh+47SV4uWA8G29mTrg2kobSLxOstYS1amwMLcc1DnuBejqpRN10DrKy2pk5Fe7OYXzf
         iqrqS6528wri5VCZOxQckP9H2zf1MzMj7AqjHlaGATLgiLDIm249EhOCfahMCvzpT/Kf
         flJM84S+ycBmS1VwycEIgbhRjSUiKTgQZAS6HICTOTPg8+LKhB0DlchoTVBF24zEYv4Y
         F03RjP1iokOXYE3bZvSVZpUXApaVFAeGvt7EqR6L3K1GUKeff6bnTj5WGX5+5k7fYUZu
         OkaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793752593; x=1794357393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LWJanuswWAHSuiKQHLqedaGBTjD+MgdDbpUXkwG/zec=;
        b=vuWEaMeQFNHd4RiNIlHoUkXiAS65cMLGXT8cA9bpB4FahbV2prp3CNu8TJCw99ss5z
         v+iI1NNMC1db+pFBvjoy/tjEmsL6Al8Lvz6SGNZ3Vl1Q6ghpJbJMAfu6lPHZfZ93M/RW
         4Q7145QJItCanD+ZY4E41RTLtyMlEVtXB6Wgvs7Zalm7JZud3MLJSIuj3l7pKgz8u+9v
         V9FN1l3pOP0VwEck/mtuea7zMkOBk6aDaUlOtGsnd4sMhy5s4S0XDYFbxFYr043WvQA5
         qzpY77aDVMl7i09SWKitCqCaBHQmGrTFeXfo2s9N5etERVqWblTwH+JRyrWyBBpE5ULl
         A0ow==
X-Gm-Message-State: APuU4Z91Vmqp+BCG0C0Nxd3oN9UgeIStL48N8iK8t7bL8/MYxOJrdgKX
	k4EKWgSB8kTrxHTEFMR3LOywFG3MnEqXjbA2VesL7iwVabxr34iVAFBowXtD+VniTSfSFRuMDMH
	43c6cwEb0S5TP4NQE/VWU0vG8y/3Q/4Pf11XxXRLWov0JmaEwvMVN42+Sn44d73x1JE+dY9ph6+
	1QyAcVuw==
X-Gm-Gg: AYBFou0kOflb5ZW+OcTxj3bFn8XdeTMKgKfT4CWww5yKPU0AbT1FKhH+Cvtiwl/Bx3S
	nRyHng0d1VFvTjrhbzz1Ez4aJSeUm4VrzCRUkylRP6qrtG0C9qbgbNqJgF9Jz+L7mFL8nA4s/3p
	sAvNiKzpADlQltG0KggqC4OKvXVeMsiKdczUmdznoejRZNWKqIWVr+yK201dgyoIILzD0NptB8y
	s9SVZlGNdyZiZheGbE5VbKL1B4tKVN6J1V7BqHN6NmZzYXCr+3TOP1JoCFYG4W76OxrOpcPy2VD
	Eap6gqblDvaqki65EoxsSAqOSdOmsDtb6JGr958N7abT+Oerh1a3cXy4qJkuEqsRdHmPpfxHZcQ
	vnCavBqI/Yf+htFxyJW9/CuGePIm+QcCP7TwfAZdxoRaMjjPyThiyzc7ocaSEIDH8dwMM5elb+e
	7VQORCU+ZF3EOk94NntZDEfD6aDiMX5aIooz5IS+UDUU+U4e05LLmjN9+kowbe8XxP9GS1gjUJZ
	EJsqsq15qj6Y3E=
X-Received: by 2002:a17:90b:4e8f:b0:3b0:9691:a240 with SMTP id 98e67ed59e1d1-3b09691a667mr559494a91.47.1793752592796;
        Tue, 03 Nov 2026 16:36:32 -0800 (PST)
X-Received: by 2002:a17:90b:4e8f:b0:3b0:9691:a240 with SMTP id 98e67ed59e1d1-3b09691a667mr559468a91.47.1793752592216;
        Tue, 03 Nov 2026 16:36:32 -0800 (PST)
Received: from ip-172-31-25-255.us-west-2.compute.internal (ec2-35-83-207-173.us-west-2.compute.amazonaws.com. [35.83.207.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9928d1sm6677855a91.14.2026.11.03.16.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:36:31 -0800 (PST)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Jon Mason <jon.mason@arm.com>, Ross Burton <ross.burton@arm.com>
Subject: [PATCH 0/2] arm/optee: update to 4.11.0
Date: Wed,  4 Nov 2026 00:36:21 +0000
Message-ID: <20261104003624.3008551-1-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwMSBTYWx0ZWRfX7vA6tDxZs07i
 Ff9N2oSP6OnI0WFGVn1y6iXY0kubApZcKvC+C155F5KucNdPoWilT6390bvk5MO906TZWDgARCo
 /vtLtldGhqhA1q6XheT+Mzvwf2kP9nNR9zau8mhpFvNkj17v6lG6X41TunglW6fzdtzL/IeirFq
 deq/bjggaIfc5XyHHtIgGvVXxxS3AE7N7V7UOVGYGp4cHslMwn5takkrrI0Hk1Onj8mouKqZ9ck
 aAfZmFP1/mPJohuP0dMgyzD3xWXwCP9McUwBclzKUXz9sbhtu5DeHXUCt9DPbxyrLUdpAC/tYH0
 vgpvouRxHzSG9LyeILHKZsLEu0hUjI0SRqFSDGtT7Sb58ArE7bthok7yILj2bwJabksWsPFI9EL
 0nI7NiDOkopGJd7xMQwTN8yPF65e1wp7SifKKCJ7nezPjizEU0/AvA3KiUdR5uTs/G4OvOLi2sR
 JmLqPgXuC1UhxZcDGbQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwMSBTYWx0ZWRfX8sOzsPO8ZPGU
 Ki3g463RR3HBsWX9m12qJNibQMGj/ZGldl53aETbEVVVxlEeEOHPHxK1N5N+8q5hY7/XWq627TD
 w1HErmefOwWQ72YDFpQs37f5skutwTE=
X-Proofpoint-GUID: Ny656GnUUVpJZTezqEb5NSzIsNxDAgzf
X-Proofpoint-ORIG-GUID: Ny656GnUUVpJZTezqEb5NSzIsNxDAgzf
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aea7e11 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=P2/bgbqRawb6I1+7fxbs5g==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=i-nPJNIz7RY9q1rr19YA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7201
Content-Type: text/plain; charset="utf-8"

Update OP-TEE (os, tadevkit, client, test, examples) and the fTPM TA
to the 4.11.0 release.  corstone1000 stays on 4.10.0 through the
recipes moved to meta-arm-bsp.

Tested with the meta-arm CI configurations:
- qemuarm64-secureboot + testimage (gcc and clang): optee
  (xtest -t regression) and ftpm suites pass
- qemuarm-secureboot + testimage: optee and ftpm suites pass
- qemuarm64-secureboot + qemuarm64-secureboot-ts + testimage: optee,
  ftpm and trusted_services suites pass
- corstone1000-fvp: optee-os and optee-client build at 4.10.0 from
  meta-arm-bsp
- git recipes build at the 4.11.0 revisions
- yocto-check-layer passes for meta-arm, meta-arm-bsp and
  meta-arm-toolchain

Ricardo Salveti (2):
  arm/optee: update to 4.11.0
  arm/optee-ftpm: update to 4.11.0

 .../optee/optee-client_4.10.0.bb              |  0
 .../optee/optee-examples_4.10.0.bb            |  0
 .../optee/optee-os-tadevkit_4.10.0.bb         |  0
 .../recipes-security/optee/optee-os_4.10.0.bb |  0
 .../optee/optee-test_4.10.0.bb                |  0
 ...ee-ftpm_4.10.0.bb => optee-ftpm_4.11.0.bb} |  4 +--
 .../optee/optee-client_4.11.0.bb              |  4 +++
 .../optee/optee-client_git.bb                 |  4 +--
 .../optee/optee-examples_4.11.0.bb            |  4 +++
 .../optee/optee-examples_git.bb               |  4 +--
 .../optee/optee-os-tadevkit_4.11.0.bb         | 30 +++++++++++++++++++
 .../recipes-security/optee/optee-os_4.11.0.bb |  6 ++++
 .../recipes-security/optee/optee-os_git.bb    |  4 +--
 .../optee/optee-test_4.11.0.bb                | 17 +++++++++++
 .../recipes-security/optee/optee-test_git.bb  |  4 +--
 15 files changed, 71 insertions(+), 10 deletions(-)
 rename {meta-arm => meta-arm-bsp}/recipes-security/optee/optee-client_4.10.0.bb (100%)
 rename {meta-arm => meta-arm-bsp}/recipes-security/optee/optee-examples_4.10.0.bb (100%)
 rename {meta-arm => meta-arm-bsp}/recipes-security/optee/optee-os-tadevkit_4.10.0.bb (100%)
 rename {meta-arm => meta-arm-bsp}/recipes-security/optee/optee-os_4.10.0.bb (100%)
 rename {meta-arm => meta-arm-bsp}/recipes-security/optee/optee-test_4.10.0.bb (100%)
 rename meta-arm/recipes-security/optee-ftpm/{optee-ftpm_4.10.0.bb => optee-ftpm_4.11.0.bb} (97%)
 create mode 100644 meta-arm/recipes-security/optee/optee-client_4.11.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-examples_4.11.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit_4.11.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-os_4.11.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-test_4.11.0.bb

-- 
2.43.0

