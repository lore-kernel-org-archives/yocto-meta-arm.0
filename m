Return-Path: <rui.silva@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 819B4C433F5
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 14:41:37 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.11435.1648824096656146836
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 01 Apr 2022 07:41:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=F5mV8geE;
 spf=pass (domain: linaro.org, ip: 209.85.221.45,
 mailfrom: rui.silva@linaro.org)
Received: by mail-wr1-f45.google.com with SMTP id a1so4547425wrh.10
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 01 Apr 2022 07:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QJv7OJQlHN/FG/rWILEN8D02ibSQkhc/N0TwAhqvdcc=;
        b=F5mV8geERehw6dEpyPQQ8B+Iooc7CjmfbYg+bci6Xe98obzKebHAOU/j9VQSl6wYXE
         lN+z3OWRcLq/EZ/DsqFr+FbjNdOT7x1SEWqIe/dUxWRQmCXrH7F4REmFI6yt18pMh7h8
         wjWrUmh8EovM+O5MOB+rsszEEdXkXoREA1eOfvFq3RKZAIhOQVjiS37bfoM3A+HlvWBj
         CJ8Z0rO+4s9tel91EIgT7iY5YLxFxCui7lNHeknYfIFeoycJG7iP6L3OVQmktoFSB4QR
         n1AgsOS0FnJdtnVeDziHLIKjiHOwy6p20e217aKL7PWCtGmIqpODhJv6ePTifmGP54Da
         hr3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QJv7OJQlHN/FG/rWILEN8D02ibSQkhc/N0TwAhqvdcc=;
        b=XRGHPKb6dfZ3mVgZXkFKp8TBaoPwnrJTdbgtpBL/goXwJils6J9vf2hvg49VsCR+CZ
         UID861M/inPorHsGwRHAfZD8p0WEs3lNOmjSxOJcMSlyjo6vCpHwFj013SxOyvJ84TQl
         59C6l8ZC0r6vEXzOT0y/PmDf9hZ0WAcJuJpribxqH2jBScjWyGbgSwqnhJv4A4uQIXOS
         FZBMilBYk64YLM880tM5WwvROcBy1/rlxqiYerIT6WD8qCQg2hnMwZhzn42a7ThMdTE1
         zSC7NMFpbPJNYZfeW9FK3Sni19g98h+NU6rhCiMDXiL2GGllKeO22r8O+x4Og6YQn+Fz
         MEfQ==
X-Gm-Message-State: AOAM532w5l+qPqV7IMo1XRR1iFNzOYWShD4742SYMqKolhBmux+7Br5Z
	d7JaNHWsrDJbAXiBcuF2qZXfR9t1isHAXQ==
X-Google-Smtp-Source: 
 ABdhPJzluiBfHXe0SGPlcJrSaApebteujkPrIiLwrFtjhNewY/BK5M1AdaTsaA+UZDckZESbrEDNAQ==
X-Received: by 2002:adf:fc06:0:b0:204:975:acfb with SMTP id
 i6-20020adffc06000000b002040975acfbmr8037284wrr.486.1648824095037;
        Fri, 01 Apr 2022 07:41:35 -0700 (PDT)
Received: from arch-thunder.local (a109-49-33-111.cpe.netcabo.pt.
 [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id
 x13-20020adfec0d000000b00203ff46f802sm3144144wrn.36.2022.04.01.07.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 07:41:34 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 1/4] arm-bsp/corstone500: add image and container file
Date: Fri,  1 Apr 2022 15:41:25 +0100
Message-Id: <20220401144128.3517236-2-rui.silva@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401144128.3517236-1-rui.silva@linaro.org>
References: <20220401144128.3517236-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 01 Apr 2022 14:41:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3226

Now that we have the wic_nopt class in meta-arm we can add the
the wks file to create the final image for this platform.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 meta-arm-bsp/wic/core-image-minimal.corstone500.wks | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-arm-bsp/wic/core-image-minimal.corstone500.wks

diff --git a/meta-arm-bsp/wic/core-image-minimal.corstone500.wks b/meta-arm-bsp/wic/core-image-minimal.corstone500.wks
new file mode 100644
index 000000000000..0ab359c40a1e
--- /dev/null
+++ b/meta-arm-bsp/wic/core-image-minimal.corstone500.wks
@@ -0,0 +1,12 @@
+# WIC partitioning for corstone500
+# Layout and maximum sizes (to be defined):
+#
+
+# Rawcopy of the FIP binary
+part --source rawcopy --sourceparams="file=fip.bin" --no-table --align 1 --fixed-size 1
+
+# Rawcopy of the kernel binary
+part --source rawcopy --sourceparams="file=zImage" --no-table --fixed-size 12
+
+# Rawcopy of the rootfs
+part --source rawcopy --sourceparams="file=${IMGDEPLOYDIR}/core-image-minimal-corstone500.squashfs" --no-table
-- 
2.35.1


