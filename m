Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E7D1CFA779
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 13:05:04 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.21446.1728047098308927052
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Oct 2024 06:04:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=cMNTCSX5;
 spf=pass (domain: linaro.org, ip: 209.85.208.181, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fad15b3eeeso25110191fa.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 04 Oct 2024 06:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728047096; x=1728651896; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yj1f/cQEOcO5JAIgWruwfvGuS1Pz9glhyZ5IdEoCAxs=;
        b=cMNTCSX5+oKQMLjp9h5sp+2M+6nEgJGqcJif2suBKQLtjkJFbNkD0fzSIVz5IxNTRG
         YybYGTSHTkYz7J5jPqEy7Hs+Oql5pxrhTm75/vLf33vuFOL/uE7b6Q9d2pGJ2i/uZNf5
         SGRBCKNIDP3IsvV2ldM2Pd0PXUN9HP6imGoniYtKqXP9J76Uz5fDrQf1SyufAaJ/P/mQ
         dr4zipCVHSWNtASAf2qsXTjAmLHkXMi0eECxRcf1CMAFuOnay9spum2ZQtYUgzCn/oR4
         2RvNhlTXFMuzG3I3kSiVq0qXmCvPEp829bwLFOIXoCDphuvG7hSAAhKJq8QsmNBehTK1
         h4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728047096; x=1728651896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yj1f/cQEOcO5JAIgWruwfvGuS1Pz9glhyZ5IdEoCAxs=;
        b=XYCMnizkcut8aynPAHqqQnFiIe6ghJe/9aXkocxt/mai7C79quMOM8tPXpLB2rWt4v
         VVbiLsiWPTwMZoOUieurR2YVNNFX6fgJPZavQYquM554M3mSxnNqIM08H9mYrhnCGZyj
         Q3+Uzx2GJ+0yoR49vJX7gGoiL3/KHy6iUX99SukyVxUouBpBOxYYMQtWyyG6xtObvJ02
         nSKqnmJg+US2RMC9egapTs+dmNJNP/m4KPsngWzvIlM6srmMMbkHTT0zooHN4ReYgNRD
         ZbRk/Zkgy2TcjcWUL0D/X7kKywlJW63ZZ+yP8yAZUHGsDfEMNcGkVNRFZ8+mXksIh5+V
         ISAg==
X-Gm-Message-State: AOJu0YxiejOY4vEu34nBwjHkA2d/0r7pEWe8SLRuftfpoT4rlPfmftqZ
	xpdaBoIHwYwgwQtSTwgDONjUllAowabeHDpcw4FMAGa2XgnaSy3Bj4rQJAQUIU893dHEgEGdWou
	lryc=
X-Google-Smtp-Source: AGHT+IHfv5iT9N676cILYhR+DEoWjZO49J21xgWFxUZ8eHu+TW1GNPbhJrvIb4U6key3h5dPPvmJqQ==
X-Received: by 2002:a2e:be86:0:b0:2fa:d9db:7bae with SMTP id 38308e7fff4ca-2faf3c142b3mr13838951fa.10.1728047096151;
        Fri, 04 Oct 2024 06:04:56 -0700 (PDT)
Received: from localhost.localdomain (2001-14ba-7430-3d00--193.rev.dnainternet.fi. [2001:14ba:7430:3d00::193])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2faeccae206sm4554691fa.137.2024.10.04.06.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 06:04:54 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH master-next 2/2] qemuarm*-secureboot.conf: fix kernel serial consoles
Date: Fri,  4 Oct 2024 16:04:27 +0300
Message-ID: <20241004130427.217611-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241004130427.217611-1-mikko.rapeli@linaro.org>
References: <20241004130427.217611-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 04 Oct 2024 13:05:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6167

Kernel boot serial console is not visible in runqemu stdout.
Fix this by setting SERIAL_CONSOLES to include ttyAMA0
and use that as KERNEL_CONSOLE in .wks file bootloader
configuration which assembles the kernel command line.
Now kernel boot log is again visible, incase there are problems
with it.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta-arm/conf/machine/qemuarm-secureboot.conf   | 3 +++
 meta-arm/conf/machine/qemuarm64-secureboot.conf | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta-arm/conf/machine/qemuarm-secureboot.conf b/meta-arm/conf/machine/qemuarm-secureboot.conf
index f08b84fe..c01ca47a 100644
--- a/meta-arm/conf/machine/qemuarm-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm-secureboot.conf
@@ -21,3 +21,6 @@ WKS_FILE_DEPENDS = "trusted-firmware-a"
 IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
 
 MACHINE_FEATURES += "optee-ftpm"
+
+SERIAL_CONSOLES = "115200;ttyAMA0"
+KERNEL_CONSOLE ?= "${@','.join(d.getVar('SERIAL_CONSOLES').split(' ')[0].split(';')[::-1]) or 'ttyS0'}"
diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/conf/machine/qemuarm64-secureboot.conf
index 78a39c03..2f8c093a 100644
--- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
@@ -22,3 +22,6 @@ WKS_FILE_DEPENDS = "trusted-firmware-a"
 IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
 
 MACHINE_FEATURES += "optee-ftpm"
+
+SERIAL_CONSOLES = "115200;ttyAMA0"
+KERNEL_CONSOLE ?= "${@','.join(d.getVar('SERIAL_CONSOLES').split(' ')[0].split(';')[::-1]) or 'ttyS0'}"
-- 
2.34.1


