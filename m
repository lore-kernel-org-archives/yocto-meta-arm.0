Return-Path: <mariam.elshakfy@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C213C83F1B
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 12:07:22 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.76593.1752494840577980537
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 14 Jul 2025 05:07:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=bPnPpuMm;
 spf=pass (domain: linaro.org, ip: 209.85.221.45, mailfrom: mariam.elshakfy@linaro.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso2612891f8f.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 14 Jul 2025 05:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752494838; x=1753099638; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k4E7qoLyorURb1qdte5LhOkTHdoTyhbEcpfT6osFXz8=;
        b=bPnPpuMmQcmeeOBOWmG+wCvrJ8tiY+s74cmdnBMGpXVctMiafYfsKYjyIXQt16wPKm
         POE56lkieVZQtHEZv954veWxPYVmVrEU+cRaLefQ5cTC05Z2fMklT63EGCtuA7/cKLUM
         +npJWscJm2GQpGc8dct4uhFwHgYKm48nYQ79YK/6D1hB4KBYALNOeiZ91mJCEPbqHLTV
         ULkIcvgL7/blMoin+Y2OffXpT9KV91nWccHH9R+Bl0pVk2Rlr8A10vXLC4TWTKW1+JCZ
         2sNfB0REp9KfMAYsA3YIHjdztfp3ZsERuIdzV+BH4wtfFdzyBVTEjPuH3sJyYSiIq+uL
         xjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752494838; x=1753099638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k4E7qoLyorURb1qdte5LhOkTHdoTyhbEcpfT6osFXz8=;
        b=llzfI2m1sC670/w6heIu7Kvxnp6ONPXXN+Gm3z7V/ixqRis/NLlJD38lZtWJ/2ta1m
         OFOlUqx3VKUw43/ipruMoNkej5dCooVx29nfcJxQ2O8DdwfgretUSv+F51qGihZ3DUyc
         biJMRsAliyJF7arYSUP1PISx9dVyAUm9zxiFBweiA9TrgiIuQoNkqtu3kuwYqHd7dvSR
         D9NbUwr/ZY0oOAIZkKDzOYB2RfrT8L9Eumtzc+MXz/XroGEhweYOuwLz83q0/7BVk1Ds
         9RYb7/+TkSywlq6jJpvRSOwHS7fni7OoUZq01jvlixmBdJW2NpaB9xOXg/kD2AjYwpZ2
         bLOA==
X-Gm-Message-State: AOJu0Yxem3A1/mA9XDvvtsOxFwDGRC/64ETOKkaqyUF+Gy/1pxdi77Ya
	IBZ0tdOvbU8NeN96yOWVRqovPKfheoX+Nhnu6SzXl+2v7yWziwroqUyUUBjZRC+os9eLsJEBYqm
	DHftI
X-Gm-Gg: ASbGncu78dyjirMzYHin1YvhuUCWfP29zd1Ssl/WjbWYxCcdE1VgNYwbHNI7rludCwt
	RN1h0gMcgNIyd1KVPH6OUUj2lg8xXAY9CwlTVzQKWExhf6+dQv51uzg4+ownelRtr15AE4uX3mj
	IhGur34YTJZyzelrbJtn9xFJr7XI1AVPby6MGBVuvujNcMO3HIuxwQKXgqDQ6XgcEG7g4GxtHIk
	uJnafxOIVzMZ26BT8ziFSyYPF4HPleZUZ+outSoc3lJez/uo3z3Kch2OZqrp839CpyO03HiVWJB
	ULyW78NH7C1T/rneoiQp4dg6z6lUofpDyWvWZhV4a6xvsWEdURqdQWJkMMBNUEFIo4h1qtLIwWn
	pVDIG1njTVlNmK5sIkrrI4ibakzhvBC9Yw+GHMhIN0q5Ten69wzqlJQKXgpkylsN7sKNrURQ=
X-Google-Smtp-Source: AGHT+IEZxsXOM/YcdoXkU1Yl3t/PDPvKNNOviT6gT7+SUBoZO3CkMj1VFUVQ3ICIov9fHqQAVhiuAA==
X-Received: by 2002:a05:6000:4112:b0:3a3:6e62:d8e8 with SMTP id ffacd0b85a97d-3b5f18dff07mr9611630f8f.55.1752494838401;
        Mon, 14 Jul 2025 05:07:18 -0700 (PDT)
Received: from ip-10-252-32-24.eu-west-1.compute.internal ([217.140.109.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8bd1997sm12472060f8f.10.2025.07.14.05.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 05:07:18 -0700 (PDT)
From: Mariam Elshakfy <mariam.elshakfy@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mariam Elshakfy <mariam.elshakfy@linaro.org>
Subject: [PATCH 0/2] optee: Switch to new optee-ftpm fork and fix CVE-2025-46733
Date: Mon, 14 Jul 2025 12:07:12 +0000
Message-Id: <20250714120714.337891-1-mariam.elshakfy@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 14 Jul 2025 12:07:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6607

These patches update optee-ftpm to use [1] instead of
ARM32-FirmwareTPM sample in [2] as it has been dropped [3]

It also backports a fix for CVE-2025-46733 in both optee-os and
optee-ftpm.

[1] https://github.com/OP-TEE/optee_ftpm/
[2] https://github.com/microsoft/ms-tpm-20-ref/tree/Historical_Samples/
[3] https://github.com/microsoft/ms-tpm-20-ref/pull/108

Signed-off-by: Mariam Elshakfy <mariam.elshakfy@linaro.org>

Mariam Elshakfy (2):
  arm/optee-ftpm: Switch to new fTPM TA fork
  arm/optee: Backport fix for CVE-2025-46733

 .../0001-add-enum-to-ta-flags.patch           | 27 ------
 ...{optee-ftpm_git.bb => optee-ftpm_4.6.0.bb} | 46 ++++++----
 ... => 0001-optee-enable-clang-support.patch} |  0
 ...002-Add-optee-ta-instanceKeepCrashed.patch | 89 +++++++++++++++++++
 .../recipes-security/optee/optee-os_4.6.0.bb  |  3 +-
 5 files changed, 119 insertions(+), 46 deletions(-)
 delete mode 100644 meta-arm/recipes-security/optee-ftpm/optee-ftpm/0001-add-enum-to-ta-flags.patch
 rename meta-arm/recipes-security/optee-ftpm/{optee-ftpm_git.bb => optee-ftpm_4.6.0.bb} (58%)
 rename meta-arm/recipes-security/optee/optee-os/{0003-optee-enable-clang-support.patch => 0001-optee-enable-clang-support.patch} (100%)
 create mode 100644 meta-arm/recipes-security/optee/optee-os/0002-Add-optee-ta-instanceKeepCrashed.patch


