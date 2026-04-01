Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F52D35175
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 10:29:59 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9983.1775039393957116609
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Apr 2026 03:29:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Y0FKXAil;
 spf=pass (domain: linaro.org, ip: 209.85.208.181, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38a67221fe8so53288381fa.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 01 Apr 2026 03:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775039392; x=1775644192; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKAuf1AdXyKCLV6q3zDaxG4qFwL9mM/cRIq29ZC2r/c=;
        b=Y0FKXAil663WQsm90k1uVsvwhroQUOLv5gYBOOlKipqF9POwprn1j2PI5MwjEl6B13
         dEkroUAeQsQ1C47ngitnqur3u4UTx1AH/TGPA9cfDdiOK52FL4mEHLr3ixCmuUs4rO2u
         JrZ4KHzxGkO70TRm5J9Ju+vHUVNPAwFC6jdGnfuWJvTc1F+ht61QcjrtoyaWw49dAGbs
         PT6GcVtbPO+qAoiy+VYpfa2JEOuUDpyIks3ysArPKBmkcatx/MxX0VYUvPfl1FmswrUX
         gcn5sroww07i/SEY9vo3pHUkHNRBdKbcaKW3uclBWdrAULV1ToPzoykZj9nVv4m4+t7Z
         8dDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775039392; x=1775644192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YKAuf1AdXyKCLV6q3zDaxG4qFwL9mM/cRIq29ZC2r/c=;
        b=I3CFl2K+03tsgpOr1nCd7iyVMpl29NGRr4BTJgCBkGBOLBL9bCyYvplxMWFg7SODk7
         n0ZqhhlDQ80wkdhqx3XSdqShZCZ6sYPEOkOKIIGBPDjcfuBgcnTmxptb8pOAhIRJ+Qdw
         cC4v2pC6X9d4lPW37gife/Y3G7B51DGhQBws5UR/e9n5LtsB4IWSjNVr1oMrwFGrF+f+
         43FuO31dTNvON+e4CvOgUOBPH8EHidrNFT/KpRRwxHfIioLlhPFnXTnOOS2lOp1gUSD2
         ikK+mNXyolvmsAczbbrHW4LHBvqVoD2/H5oGbCi6uBjDsZU5KHYk4ONKfZ16V54nUGYp
         jFgw==
X-Gm-Message-State: AOJu0Yxk2juP1/ibBFmNGheU8gBqJMCwDXC07LpSHyVszAsJ+m7kJFPX
	zR+xmeu+aAXT5rlPIUOMX5gIlJnLMlKKHUXdiyu79h6PQ5CYBQ3mzECDcbrHQv015e73qwPgfls
	Q461o
X-Gm-Gg: ATEYQzzJNi1q0vVkQXf2VedXVLQLhy9Tp6qGZQRbud697rdKBXfbAc6y06vgwWwJ1OS
	R11o4ZOECqa0YTNmq+7elr19yJz6ZeUSdUaEcvIn6U7ztwZKe2HDs09Ibj2TFsoYTzuNQ+0UU84
	bU23QR4+8DIKDH+FqFiU6Tg4nhpCmdrAZdoeQ91WSvdqRtJFSXeHNrO9p9sYC3YNUTK8ekZigHQ
	l290XZX41QoSivfdUd2k47pkrP+3mo4U4z897Q1Rsf8PNb+HaBc3WBc8r7pWfSpHjtOxoDnNEJB
	gcjwcvxpb5D56n37QVU3Vwt1tywgmIPrGhICzC6wVUMhMshNZLUQW6gHLuZSvHSPauXDjcRZ9kV
	9ghjjfC7MNuKw7/FnH5FqPp3Oq79j12QGWxvq3xJNxgC6baaGLNSgMBhk0TEoiFwBiEZxhZiJ7B
	QUqhM9wqTW28o7RArvkeznOicygJ95t+8k8VgLrWsN1jQx9yNmCqm1Y12aUniiJ7KUUB4=
X-Received: by 2002:a2e:9243:0:b0:38a:8c44:75a1 with SMTP id 38308e7fff4ca-38cc2f6bef5mr7957701fa.8.1775039391663;
        Wed, 01 Apr 2026 03:29:51 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83730f7csm26337651fa.16.2026.04.01.03.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 03:29:51 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 2/2] u-boot: enable tf-a support for genericarm64
Date: Wed,  1 Apr 2026 13:29:31 +0300
Message-ID: <20260401102931.781169-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260401102931.781169-1-mikko.rapeli@linaro.org>
References: <20260401102931.781169-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 01 Apr 2026 10:29:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6998

genericarm64 target HW uses separate vendor specific
UEFI firmware but for qemu testing tf-a support can
be enabled just like for qemuarm64. genericarm64
has the benefit that the same wic images will work on qemu
and on many Arm System Ready compatible devices from
different vendors.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
index 8ddc53619560..403260a2bc2f 100644
--- a/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -2,6 +2,7 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
 SRC_URI:append:qemuarm64-secureboot = " file://qemuarm64.cfg"
 SRC_URI:append:qemuarm-secureboot = " file://qemuarm.cfg"
+SRC_URI:append:genericarm64 = " file://qemuarm64.cfg"
 
 require ${@bb.utils.contains('MACHINE_FEATURES', 'uefi-secureboot', 'u-boot-uefi-secureboot.inc', '', d)}
 
-- 
2.34.1


