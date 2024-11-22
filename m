Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37215D75E42
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 13:39:26 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.24125.1732282765107311151
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Nov 2024 05:39:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=YNexHavM;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53da209492cso2829478e87.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 22 Nov 2024 05:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732282763; x=1732887563; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PXB8UIj69v1PAKS+A+9xnGM/tncjdGvJ5WZhlCRVA0w=;
        b=YNexHavMX+0SncvoNXTkYYDC1eH/Lr9U5Llkccd/szluA37IBbHvninoxXrV+V41WZ
         qUj1AHREP1fv4/W+wDO43LdAsxn1CjZV5giPZeBRD0dNuR4js4Nu+yWsYtI7rhUjdt3/
         8U5hoQqSyNIhVM8h5s3g3vZNbCiJMOrNmToVgpWv8Sdy0PM7X4dG7Hmdkv/FL35H+X7P
         yr8RkBZkGlbuAOJL3Zvwh1h54uGiG+icbtwIkZl7bArN/9MK9zmuM3b0HLTjoTiO+df7
         uEFyHI1X/Jup5cGWjcZbge8+O506eA/N/n/jYYhKMvAUKZ3hsV8zYvHgN2QFFX4W36Mo
         OOtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732282763; x=1732887563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PXB8UIj69v1PAKS+A+9xnGM/tncjdGvJ5WZhlCRVA0w=;
        b=PZizvv9rqW29k2zrtOQszjK4bTyZKTMoQTFtPNTJTmrf4ALljpigspML0L78w+TdTP
         sQGiWHxLTdmmZVe5CVzOD7sd6rxhl6ZUujFrJim/ocXDkVt1HB23w5Pv+hRNOXSOSqvM
         l33yC1qXGzlr1R9C2K1SFqHEsPc+5GQV/pn7lqg4SLdvM01He1ZyDmOBu2kL8Z8DcmYr
         ZJDyDiJhaR+uVP7vnGGzKrEHjC2JN8069kaYTl7nLZUGyOe20HGK/vOfusQHlG912KAF
         Mn0GsnZswP2J1ltSU1wqldU0OoI2Tl1EcbqtXgDPUI2MI7gU0P5MLzuLSmSfZqV0TzjE
         rQaw==
X-Gm-Message-State: AOJu0YzSwBpIeZor6sTfpWVR21yfhA2AM5laKJAz9LOOMf1StQhCHFTa
	67RxbVvj7/y+JxN1lZuyQDUd+0RhBUq2zRAIu8muJ+IcaCzzzYnXFoxbL22/uONhi+UlhjNYhOZ
	t
X-Gm-Gg: ASbGncuzhXzofMzDVhwgeWd62mpnbR4zfxbx6jT5IE+8yoiGrZnZjIUpKP2PBa7Fd+D
	mWVg5x6JPK0BgTHN5OmmasSSyAtz2Vd0jsOh5U0KEPEb8oX1CKPqkly1U/1djpHcrMrmnVMqHKJ
	h8DaZ6/hn7iSnm3T+g2JT3ssWXgksHVYgexSddFlL54EYWMQTf4b6aRbhDXVxSC562vH+f7CFh4
	AVRvRMsxuYCOr9QS/RylsRN/80TTKqEzEbF5vAqE8m97wwcfR+TSrvJsUUrrIchysfPkuyFhz6V
	c2+WzYf/6hJ7ZXNyQhqXrT0tcg==
X-Google-Smtp-Source: AGHT+IFs4mNhhDOTibBWrVtfUV1xKTxpe8Qzd2+xBZ9kGrzcgzlZdxgqBMYtHFK3NCHhk7Y4yJ6DRw==
X-Received: by 2002:a05:6512:5c1:b0:53d:d3cb:debb with SMTP id 2adb3069b0e04-53dd3cbdf8dmr1416009e87.0.1732282763010;
        Fri, 22 Nov 2024 05:39:23 -0800 (PST)
Received: from localhost.localdomain (2001-14ba-7452-eb00--133.rev.dnainternet.fi. [2001:14ba:7452:eb00::133])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd248b1dcsm375253e87.203.2024.11.22.05.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 05:39:21 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 0/4] uefi secureboot with Unified Kernel Image (UKI)
Date: Fri, 22 Nov 2024 15:39:00 +0200
Message-ID: <20241122133904.202082-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Nov 2024 13:39:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6252

Change uefi-secureboot to use UKI which extends secure boot coverage from kernel
to initramfs and kernel command line. Tested on qemu with qemuarm64-secureboot and
genericarm64 machines:

$ kas build ci/qemuarm64-secureboot.yml:ci/uefi-secureboot.yml:ci/testimage.yml
$ kas build ci/genericarm64.yml:ci/uefi-secureboot.yml:ci/testimage.yml

Mikko Rapeli (4):
  qemuarm64-secureboot.conf: append to WKS_FILE_DEPENDS
  uefi-secureboot.yml: remove duplicate distro features
  uefi-secureboot.yml: switch to Unified Kernel Image (UKI)
  linux-yocto: remove signing

 ci/uefi-secureboot.yml                        | 20 ++++++++++++++++---
 .../conf/machine/qemuarm64-secureboot.conf    |  2 +-
 .../linux/linux-yocto-uefi-secureboot.inc     | 10 ----------
 3 files changed, 18 insertions(+), 14 deletions(-)

-- 
2.43.0


