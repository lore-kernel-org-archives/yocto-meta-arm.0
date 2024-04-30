Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC25C4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 12:37:48 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.14255.1714480666315830296
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 05:37:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=yp/rzSmw;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-51ae2e37a87so6911631e87.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 05:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714480664; x=1715085464; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2GSn78/0zAdHJ/HqlGeAkmuTXsI822OUoWvf4BQLM+0=;
        b=yp/rzSmw0RiRLBe9ZqWABgoG77h2Jr30Q1AnayOe+Vgb9WVIRquaYgVPi5v0bZkYST
         /FwxUqHgHj4i39LDXIbCaTMu/qdhfYfOSpfvfAYC85pqeLO1C/aA/VUkuuAMyZVmamL9
         tln1Jcqd6tS3xcu8LMUHKXCdJwqVyZL9r2OZBToi3kmRIoOapYCTw/vU+iQ3GHzITJ+/
         H/FGi/oK0PTy9bnKc2BcQlktd6gpBuIksszne8wKx1e+I6Wx3fjzB3wnQC/bJafxaiBZ
         UH5nIHHsutuWm70ha+UBhLaon6cUi/ALQuqiVGy+gFGs5E4T7uqczM6OpZ8J/Hvhoao+
         OxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714480664; x=1715085464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2GSn78/0zAdHJ/HqlGeAkmuTXsI822OUoWvf4BQLM+0=;
        b=XxgciSQDrA8H9U54ImgLXOOwIlICnluu452W7gMCeFi14HlVM5rCI5maEu4RwVcBJK
         shGqEWbh5ZHSsXH1VDeqoVDsVdd8flj7usWra6Wv5X8tsPPdOLhW+kjHKgfdnuC/qVPE
         7H7jlNPUJuS8skMSfMd46/pVQTmORq7i/El+HGrw9Qpg4CPRve/UUzIeyjgq6qYXSrXT
         +395joiMXnBwPM+WFNly2x/QG+EsQnpWDnzRr1JrLReUx8ahYQwrvCwftFc+oQZJk2Yh
         CfHtC99Uv+Vykj36XY5xoucoRFWeNlWzVbetxlwrHgV29h2TM4S6WoDQ8d9Vg7biL+7L
         iLzg==
X-Gm-Message-State: AOJu0Yyy4NIyY20F0u3Fm6L8Sf0YQx2JB0BCM3GAaIycFcwqBRRPvJ6/
	agbor4R3/cwtIJVqi+HUrREMvfuwGZpjZORnWSJy6nFpq6rsyJAwmEU+jZP7yZUs9ql8ruj8Ysz
	7DnI=
X-Google-Smtp-Source: AGHT+IEwSGcav++2LMKQ19MykPWJSasz/1cQDu46SNUPgOVrX68dYIaK07drRV3Tkpw/BPs38SkF3Q==
X-Received: by 2002:a05:6512:12c2:b0:518:96b5:f2cd with SMTP id p2-20020a05651212c200b0051896b5f2cdmr11007916lfg.47.1714480664415;
        Tue, 30 Apr 2024 05:37:44 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id cf12-20020a056512280c00b0051b41844048sm3011149lfb.285.2024.04.30.05.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 05:37:43 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 0/6] TPM and fTPM test
Date: Tue, 30 Apr 2024 15:37:26 +0300
Message-Id: <20240430123732.534277-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 12:37:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5641

v1: https://lists.yoctoproject.org/g/meta-arm/topic/105574754

v2: Dropped "optee-ftpm: enumerate also without tee-supplicant" since it
    depends on not-yet-merged kernel and optee patches. Added optee and
    ftpm tests which now pass on qemuarm-secureboot and
    qemuarm64-secureboot machines.

Mikko Rapeli (6):
  trusted-firmware-a: continue if TPM device is missing
  optee-os: inrease heap size with fTPM
  oeqa runtime: add optee.py test
  oeqa runtime: add ftpm.py test
  ci/qemuarm64-secureboot.yml: install optee and test both optee and
    ftpm
  ci/qemuarm-secureboot.yml: install optee and test both optee and ftpm

 ci/qemuarm-secureboot.yml                     |  8 ++--
 ci/qemuarm64-secureboot.yml                   |  8 ++--
 meta-arm/lib/oeqa/runtime/cases/ftpm.py       | 41 +++++++++++++++++++
 meta-arm/lib/oeqa/runtime/cases/optee.py      | 24 +++++++++++
 ...ot.c-ignore-TPM-error-and-continue-w.patch | 36 ++++++++++++++++
 .../trusted-firmware-a_2.10.3.bb              |  5 +++
 .../optee-ftpm/optee-os_%.bbappend            | 16 +++-----
 7 files changed, 122 insertions(+), 16 deletions(-)
 create mode 100644 meta-arm/lib/oeqa/runtime/cases/ftpm.py
 create mode 100644 meta-arm/lib/oeqa/runtime/cases/optee.py
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/0001-qemu_measured_boot.c-ignore-TPM-error-and-continue-w.patch

-- 
2.34.1


