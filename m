Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4057.1793752595559934964
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 Nov 2026 16:36:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ZuJT5xSf;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=YM2VzBZz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RD6K2786080
	for <meta-arm@lists.yoctoproject.org>; Wed, 4 Nov 2026 00:36:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=s2KYCfRiJ76
	HQ47OSFlsleHdy6yz0qJbIO8r6zwV844=; b=ZuJT5xSfeIHTiSQ2aaimwEhDE/m
	UTeaaV+omNnrivSoQ4faM4T6SSgswUItEAhKwWhfjLDWK4wHXjoX3d/28hg7BE5r
	a9ga0rzV1/ZMVx4ary+ltL+/Pz5zy++lZhVAGNcJF4uL+4icHfvubBygeIqiWK62
	wx0gYDZA9u4lO6UteYfzlwTu6JnT1xkjdEc2nrP58KNiyMvzBE9zV4VoT5cC83Rm
	DP1e71FPGS1l9nBGEJxCY3MI7fwbmVfnQtX5uCRHrN0VSyTG0M/ORPEZZJoaqSmt
	8YrOi5LAYeon5hp3+eEo4uZ1hzN2zf/sCaAhEdJDC07aAQVEnNYOSHoZ6yg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhyd24q7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <meta-arm@lists.yoctoproject.org>; Wed, 04 Nov 2026 00:36:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b08364cdc7so212044a91.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 03 Nov 2026 16:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793752594; x=1794357394; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s2KYCfRiJ76HQ47OSFlsleHdy6yz0qJbIO8r6zwV844=;
        b=YM2VzBZznl672BfTiM6ovcmZfUGWSD1Qoia4tw2VPLbnT2V7+AO+Fq4nL75+aCKNtG
         JuIrUCYqLkZ0i2hQbzx++JARBRVwskDzf3oM5CZsWq2xNrUrxUXzDovD5+KAUruZ+BV8
         tL3uxwaOtyxqBqWbVvb7f9GpaR8+N5yR3d+RozIDzosUmQLZPkLQlndXP2T3lSc/+AtC
         JWpnqlB4Gf5bMMq4sOTeI/6NHSTXXOaGn0arTWicrprEBsi61+F7ZFKjlUw0WRCvYjae
         XX4inkE7PVbU9DxdtfWO+hD6M3wrkJ/dwMwpba58TlgIPGP6bKgd1NMbz43+aUj8zZOB
         hYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793752594; x=1794357394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s2KYCfRiJ76HQ47OSFlsleHdy6yz0qJbIO8r6zwV844=;
        b=EusoUk96qHvlJPsM8BsZ5/22ZywIjnzPLuHMAY5PynDzhP50PTJFKHPbo3VE369WNO
         0pzxeIy5phuFmKhApI9SnwivVSCbTAIjrpVoHMqaQIGvq74iI/1IFlIxGxCark1faPpT
         89emDdIgqWkfTC4Jo6PSgEf2u4BQ9GCJM1Up4s5MOM89hhMTmyK+qeo7PKJMziFt0VHk
         T1c+cBSMoQ2CuqLIPFimIUALzzFuwANw1OKNLCNjn9xdn8n0MyDiArw2fhTtOw1juaV7
         tgOUhb/L/i2jlYUthuPUv1svIQH1RWLaDIGINkysBK/epvsTEJUyEX5jOAWyV6ISB10b
         hJfA==
X-Gm-Message-State: APuU4Z/Pds7+fNv6np/keKScMsLrbUn4MtRBfvXuMgu6o0O6+Hcvpdx+
	WE46zxYbfuBGUGOQRd4T3hlxaQnx9mJVy6NfEL+DBF+LAxI7slreQcff/fTYKgFcT5qNwpD9f5L
	PmZs7d1JRkdABLQ2qPP/yVuI2ZvW/obY2WgrJAMX6TaBPFhFEEUb5aAvbrZiU1UgkgPQwyZlt/f
	HEfTraSA==
X-Gm-Gg: AYBFou0XaHAL7aDRIfrlahLXdSTJZrSjAWksP1NfuRlq8PaW1bTLlygjp6T9rYdVvjs
	8WGIxVgvv+Ee9gpK7M2SMGb5DFZFTXdtbjC3X0fogtIiTl7b/Vze1sgQAZlx/JiM2B0PlKmSBVU
	xEfi6NkcucMbcV4fvpiDZNXacPvDmO+NUwS+EJnedzarAUajHlKWJOgJjv6n3V6hJ+kK9XbGLP6
	MWT5txHkCFS3TsFwex7n8HElnJq00kgCMAGUkGvMjWqweM2Ri3KJhQo6Ol6KVl2HlIJ1mCG+j2j
	2C+vFpcruiV6G3hg+mWLUNyLNaQs4A1Kff3IpLLww9CUCTblBpiUwNWTuvVMhiqvsF8TkNxyKrz
	V4vwbv6/sQwTKH5yRyWKDMvcJlD5j8DhvH6OokuzDclkudxpGbcGnua2hDh+k2grS2i6Bp6HX0a
	RpAEaW10Y8U+hyaCZJhZVqKlGwU/FqhrSD3VKkTgX8se5T+DfdqpKCnn/GojDgn8BhjE5CBl11j
	LNcCmOVcxgykMA=
X-Received: by 2002:a17:90b:3c44:b0:3ad:77fd:c3d8 with SMTP id 98e67ed59e1d1-3ae8957cb1dmr11416107a91.1.1793752594160;
        Tue, 03 Nov 2026 16:36:34 -0800 (PST)
X-Received: by 2002:a17:90b:3c44:b0:3ad:77fd:c3d8 with SMTP id 98e67ed59e1d1-3ae8957cb1dmr11416082a91.1.1793752593617;
        Tue, 03 Nov 2026 16:36:33 -0800 (PST)
Received: from ip-172-31-25-255.us-west-2.compute.internal (ec2-35-83-207-173.us-west-2.compute.amazonaws.com. [35.83.207.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9928d1sm6677855a91.14.2026.11.03.16.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:36:33 -0800 (PST)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Jon Mason <jon.mason@arm.com>, Ross Burton <ross.burton@arm.com>
Subject: [PATCH 2/2] arm/optee-ftpm: update to 4.11.0
Date: Wed,  4 Nov 2026 00:36:23 +0000
Message-ID: <20261104003624.3008551-3-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104003624.3008551-1-ricardo.salveti@oss.qualcomm.com>
References: <20261104003624.3008551-1-ricardo.salveti@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bp/Zl0ai c=1 sm=1 tr=0 ts=6aea7e13 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=P2/bgbqRawb6I1+7fxbs5g==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=x93TFQsxx7P1v2fP7zAA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: O0ukd6b-cHJKWgRp6HY8atp3Nphw-r6I
X-Proofpoint-ORIG-GUID: O0ukd6b-cHJKWgRp6HY8atp3Nphw-r6I
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwMSBTYWx0ZWRfXzY9i/7rD6JSD
 IV9WO0gAqlNGGqg8dtlYNHVwigmGZmnPTWNhMO/BiAiDa95PPlOGaKHAF0iLmKkFpQEd2wW21ei
 ZTrnw7CJcG12uQnqJh4CFjD5l+QM5OA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwMSBTYWx0ZWRfX/Mvv0Jc9wNxk
 aphRIeCY9CfEuCYQPkRgkt8VZs52XPomCh4NNn/6ZtVAvrVmj7Qb8IqYfiyV5bbDKELCjsItRDb
 /9QJ8TImNCq8m9WkmFYJKWwgztlHmsoCv3optna8J4OtfOKSORsslvrE+xQW6ukcHkoDsuACgz9
 b6XW63x9S6XtQpOJB1TFiGicb6lmk9oILB0DeY3+1f25ZhVHMQEdJkjZxzBzSoCIuGipLixuZig
 beVqtyqX5IJ9IMNtpOmtcedHQCSMf7lyacIbzzB3iWldTVBOOILJ6wrXiXkMTM2gAI6vwjshOFO
 QNv49TDQmhsEasSc+a50NYgNobSnXeVXwBP29wc7wixt1XHbh2H/8S+0Z6jxd/6EFOYb5MQErCY
 z5kpyRikeOZG14krvivqDpTXkEooysrd6d5MKSORbD2t8Utjl/Mdb0ZyvmHRLO76H7rr6vvVZwr
 uB49CCxtUjcQNbeNyrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040001
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arm@lists.yoctoproject.org>; Wed, 04 Nov 2026 00:36:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7203
Content-Type: text/plain; charset="utf-8"

Highlights:
- Keep the fTPM TA working when RPMB is unavailable.
- Fix an overflow when converting TA time to milliseconds.
- Build with strict-aliasing optimizations disabled.

Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
 .../optee-ftpm/{optee-ftpm_4.10.0.bb => optee-ftpm_4.11.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-arm/recipes-security/optee-ftpm/{optee-ftpm_4.10.0.bb => optee-ftpm_4.11.0.bb} (97%)

diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.10.0.bb b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.11.0.bb
similarity index 97%
rename from meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.10.0.bb
rename to meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.11.0.bb
index 9a58f7bc..49cbe658 100644
--- a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.10.0.bb
+++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.11.0.bb
@@ -33,8 +33,8 @@ SRC_URI = "\
 # As per optee-ftpm TA documentation, we have to use this SHA of MS TPM reference
 SRCREV_ms-tpm   ?= "98b60a44aba79b15fcce1c0d1e46cf5918400f6a"
 
-# v4.10.0
-SRCREV_optee-ta ?= "a09269b15de635e1816fe832e26adfbfb44c5455"
+# v4.11.0
+SRCREV_optee-ta ?= "f09f4cdad21028289d4e8fc573893b75f7228dc7"
 
 SRCREV_FORMAT    = "ms-tpm_optee-ta"
 
-- 
2.43.0

