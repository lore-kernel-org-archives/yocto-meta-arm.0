Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 895DDC369C5
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 10:04:46 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.12210.1727258679298118498
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 25 Sep 2024 03:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=y/V1qod8;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53568ffc525so7701851e87.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 25 Sep 2024 03:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727258677; x=1727863477; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2zHguCEzAihugwTltFkmNp9juwL6HF5C0kX9q/nBJc=;
        b=y/V1qod8++7HB/8wpSq1kR2Q45G04NUyglyIhb3dkGgK39uNax5jaxejZjvoBN6lzX
         mGNL9ZYys9+TiXJxAM6ELaxa5jPiuFOwbsIIsCWnFVncOrZBf4oeCUgM6/XxOWKD+kJY
         RzxfhsyLfgaMHh+u7oC6N5tv6mI6bR223jgsGftTsf6ONkbKHTP/pXegMMwaoVg4blYj
         JiAipnTKZGAJCnGpBFgPHT2D+lGagz9kvSfylDoUZKnd/2cfZNKabjKsWysMygHOdFXb
         YLfjCPkTZERY2Fg5cEPD1rTd6GNJuEJAuHB9+0TlybeV2ZKpSWSeXF+l280rlYn/L1Wa
         Is8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727258677; x=1727863477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T2zHguCEzAihugwTltFkmNp9juwL6HF5C0kX9q/nBJc=;
        b=NcSgtlRm0Ywad5eC4ragxaYLdkZ9X70K9C9D12m9ucjYETOW43qUnwRcMKikqXbTS3
         aYELKSlHPmhThauFsVKCGLyDK98F6t428ewkUcSHAXm3UVd6K5NtDdHM47pX9uz6YQOJ
         a3umsC51C64LsOsjNP9y9EFRROT6qv9l89+4yBjlwshB3FIOpbgJcjNNvUNEMx7Qp4Qv
         vOVOqNnnEJ4jKoi6cx6IQl3dyjv3AEfPhJLA+plzHteAIVCGiUdbdSIvZ4PNZEwNXFFG
         fFdFH2kHvkWUDotjXFeXPdYbTQwPivRbIOboKy86kYL5KtZ76vlGuZoBpenF4RoEigF1
         0+rQ==
X-Gm-Message-State: AOJu0Yx721CBfTIYFkORBPg8nbx1Os/S+MiP2maMQA8q9FIbzicnC0Rq
	fHw1yaILrh8bK7jFlatoZC8/W0eaFdM+A38SAKV5+Kgy0ytQ/YbE4aXz9rtdcpmaUQeWEwcMp5G
	BAQY=
X-Google-Smtp-Source: AGHT+IH34w/T3238vgcDSqKVRfWmJyvI9xsmwwdBDK50GF0az4osmJc1tv4eCUsywxp7EzgNYoXrlw==
X-Received: by 2002:a05:6512:2209:b0:536:54c2:fb7c with SMTP id 2adb3069b0e04-53877530edfmr1289475e87.25.1727258677358;
        Wed, 25 Sep 2024 03:04:37 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a864d9d9sm478631e87.253.2024.09.25.03.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 03:04:35 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Forissier?= <jerome@forissier.org>
Subject: [PATCH v2 4/4] oeqa optee.py: increase timeout value from 22 to 45 minutes
Date: Wed, 25 Sep 2024 13:04:14 +0300
Message-ID: <20240925100414.73073-5-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240925100414.73073-1-mikko.rapeli@linaro.org>
References: <20240925100414.73073-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 25 Sep 2024 10:04:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6112

Tests are taking more time now and several devices are
timing out:

https://gitlab.com/jonmason00/meta-arm/-/pipelines/1467809227

qemuarm64-secureboot runs the test in 10 and
qemuarm-secureboot in 13 minutes.

Upstream optee CI shows xtest runs taking around 30 minutes on
slowest qemu machines:

https://github.com/OP-TEE/optee_os/actions/runs/10997530234?pr=7052

Guestimate limit to 45 minutes so that slowest and most loaded
machines could fit there too. optee xtest has internal test
specific timeouts so if something hangs it should be detected
earlier.

If these limits still cause issues, then we could disable some of
the longer running tests with "xtest -l" option. Default for
testing level is 1 but maybe 2 or 3 could be enough.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Jérôme Forissier <jerome@forissier.org>
---
 meta-arm/lib/oeqa/runtime/cases/optee.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/lib/oeqa/runtime/cases/optee.py b/meta-arm/lib/oeqa/runtime/cases/optee.py
index 4f46225b..077eb6a4 100644
--- a/meta-arm/lib/oeqa/runtime/cases/optee.py
+++ b/meta-arm/lib/oeqa/runtime/cases/optee.py
@@ -12,7 +12,7 @@ class OpteeTestSuite(OERuntimeTestCase):
     """
     Run OP-TEE tests (xtest).
     """
-    @OETimeout(1300)
+    @OETimeout(2700)
     @OEHasPackage(['optee-test'])
     def test_opteetest_xtest(self):
         # clear storage before executing tests
-- 
2.34.1


