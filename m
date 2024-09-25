Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02EADC369B0
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 09:03:06 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.10942.1727254979659297809
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 25 Sep 2024 02:03:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Fbw3FuVt;
 spf=pass (domain: linaro.org, ip: 209.85.208.169, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f74e468aa8so68519441fa.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 25 Sep 2024 02:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727254978; x=1727859778; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2zHguCEzAihugwTltFkmNp9juwL6HF5C0kX9q/nBJc=;
        b=Fbw3FuVtxNlgO8ehrzyr+iwXnMgapejKh7dBwt26LcofBCr1ZPaJXRcw9QTGICOYD2
         s+Yf4cHWEKV99uGst7S1d1zYk4lFKI9oPJJHFlMJehwz6S/hgLPh6C3PerItVRAddjQz
         ew2NPm8ch1ItQxwyRbeReXquR975BCvJh4viT7Wc8ux0zKF1r/XC12g8ise7/F42w92A
         3BMslUD1YuSn8jkO3+a+Y5MEzvbWFgW2bBXJxDv1h5gLizFBxdBseMgWBdrYAwLsSWYl
         8P3Zf1fuBYruCe7AFnYa1SPFweTiElmASB1Hfv/k20B1CJY5tNFYVxF9kA8ZMYslNIpz
         QysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727254978; x=1727859778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T2zHguCEzAihugwTltFkmNp9juwL6HF5C0kX9q/nBJc=;
        b=X4V3RCTwmLImLL3wxW82asUkzf1CLpfElnLSu9U+OY5SSwY2U4dVvjM/85O2s7t0Cd
         HukMQN2cSx6ZcjeA41FaIZryeaXrv2u4cQHFpYPHFNeIByKq3bTgoVfDnmRMF8W1CB8U
         myOko8AwBXZ3wAnpIQ7VDa/bF2njGedPT01XkRk9/bukTNIJDYuDeMd9s5MJn3hzdUj6
         GLLyF1WHTW/lSwGYklgnRQvvZIXw+INrlrj4vwkmZ2C+i7aEFftXVB7wD7Pm6+6tp1eH
         WRIvHyLGB+HewC51f7/gA7zRd/bjPpVXAFHJ5hAu3VwhcNANwK872GYR2i4vzPiw5ZpW
         jUgQ==
X-Gm-Message-State: AOJu0YyoRD/4qSJIzkKH2VpwsQm2rSJOPqCXriV5YTLfQ9m8hfG5MpD3
	PbwuSl0OFk8+xMGrBlwtK4MK+VD29eKbZO9yyKIGdNm5BGUuIJTpgqlUrt6LxRyXiOIJCUxKbxZ
	76gg=
X-Google-Smtp-Source: AGHT+IHRetnR8uvdVXBNjeWJSWbrYpx3+W7zwxlJFizreHJU/bQv/xkCpUpXIiXcBIMM3bQevmMY0Q==
X-Received: by 2002:a2e:b385:0:b0:2f6:5fa7:2640 with SMTP id 38308e7fff4ca-2f91ca6fba1mr9564231fa.34.1727254977635;
        Wed, 25 Sep 2024 02:02:57 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f8d289ef7fsm4686501fa.119.2024.09.25.02.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 02:02:55 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Forissier?= <jerome@forissier.org>
Subject: [PATCH 4/4] oeqa optee.py: increase timeout value from 22 to 45 minutes
Date: Wed, 25 Sep 2024 12:01:47 +0300
Message-ID: <20240925090147.66618-5-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240925090147.66618-1-mikko.rapeli@linaro.org>
References: <20240925090147.66618-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 25 Sep 2024 09:03:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6106

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


