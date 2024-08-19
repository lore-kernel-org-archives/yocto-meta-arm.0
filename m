Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2331FC3DA4A
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 19:04:44 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.1075.1724094276802937628
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 19 Aug 2024 12:04:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=stPNV4HR;
 spf=pass (domain: linaro.org, ip: 209.85.219.42, mailfrom: javier.tia@linaro.org)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6bf7a2035d9so35723136d6.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 19 Aug 2024 12:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724094276; x=1724699076; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7LQHgRISQHcfF0QLO2liZofRFwc99d3sVsZckNqcRY=;
        b=stPNV4HRN7RutA1L+sdsO8bJ3yERNYbc5Dn55SUiNqiTAuvmIueCOKrZzm2qFytrDo
         yPIKSzZwbeBb2aqWxAG1yV4sUSNWHmOEXT4SkyIUOXA5GPceyvtgMTaxtpbC+tv+LnKg
         2D8hFWpXBZhbdv3Lf8pd6FRqF9nH9X4j8hV9bIeQ7thoYJLZ1BAmEl1G98cg2TjDE20o
         F5+MNAYtrqItinqgr9feko7eqAnmHYYweWmqQk/th5tD9jaoj+QyG8dhSqXP0QXSBH9P
         R/WY4VPUs16wE2vlCIg+PtgqYomY7gE+Z1CgVGkJKxJnAjV1mfXdwYaeLp38Wyw/E96n
         cgdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724094276; x=1724699076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O7LQHgRISQHcfF0QLO2liZofRFwc99d3sVsZckNqcRY=;
        b=wIa7W0byjSExTYAgfMkSGBHxfcdLy/wK/Qkr4D31gEdhQG4nLmtI94+US8sz2HGLqH
         OKw+CMtoxvKxLwzAKRMQYjN1PlTyoZBbTD5ma2lYedvZd4R4hHbGVFVGY7F2Tgco8o8y
         geU/GJo0EY0BkRSOf6OGzGK2kw3BW/TAIlBDDyqfhpc8q1n+U7N9hSWTGU30WGQB3P7B
         7/aLWFxf2nMXhggOlzBN15VV3Fo+aPZlF2KG18cVMtY5AmPF+iA8ZTK5H7P1syG8OFZA
         gpjswx/vzNaJhNVk89KlG/10J4n4OEe4r0n/miNVGu3+A8s8XjVU15oPNupKVqpEOAjp
         dK9Q==
X-Gm-Message-State: AOJu0YzVBjImRe4ni4DVAySMmeyKjvLieAmoXmERgYYdjPS2z56WoxY6
	iE+i6SXiwGeAgDpWk0sFSBY15zH2B1sbCrJlcfHEXzosJzFKeuM7p3YzTfJOr4rXYZUhEKPc4Yi
	7
X-Google-Smtp-Source: AGHT+IH/Ay6S5h4+LNykjTN6ubQcqYXcpLr9Lf90N09Upz4088EtasmjBYncF55sYTykdqDGfhUHfQ==
X-Received: by 2002:a05:6214:f0e:b0:6b5:2aa3:3a7f with SMTP id 6a1803df08f44-6bfa8a66706mr9524636d6.20.1724094275718;
        Mon, 19 Aug 2024 12:04:35 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([177.93.4.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fe06feasm45371756d6.40.2024.08.19.12.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 12:04:35 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v2 02/14] core-image-base: Use UEFI layout disk partitions
Date: Mon, 19 Aug 2024 13:04:17 -0600
Message-ID: <20240819190429.2897888-3-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819190429.2897888-1-javier.tia@linaro.org>
References: <20240819190429.2897888-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 19 Aug 2024 19:04:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5968

- Use efi-disk-no-swap.wks.in disk definition to add expected UEFI disk
  partitions configuration.

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 .../recipes-bsp/images/core-image-base-uefi-secureboot.inc       | 1 +
 meta-arm-bsp/recipes-bsp/images/core-image-base.bbappend         | 1 +
 2 files changed, 2 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/images/core-image-base.bbappend

diff --git a/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc b/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc
new file mode 100644
index 00000000..351e9030
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc
@@ -0,0 +1 @@
+WKS_FILE = "efi-disk-no-swap.wks.in"
diff --git a/meta-arm-bsp/recipes-bsp/images/core-image-base.bbappend b/meta-arm-bsp/recipes-bsp/images/core-image-base.bbappend
new file mode 100644
index 00000000..1f6dbd24
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/images/core-image-base.bbappend
@@ -0,0 +1 @@
+require ${@bb.utils.contains('MACHINE_FEATURES', 'uefi-secureboot', 'core-image-base-uefi-secureboot.inc', '', d)}
\ No newline at end of file
-- 
2.46.0


